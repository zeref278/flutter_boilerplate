import 'package:boilerplate/core/security/network_security.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_app/flutter_secure_app.dart';

/// [NetworkSecurity] backed by `flutter_secure_app`.
///
/// A rejection here reaches the user twice: the request fails with a
/// `DioException`, which the repository maps to a `NetworkFailure`, and the
/// package notifies its RASP engine, which `SecureAppGuard` turns into
/// `SecureAppThreat.networkInterception` and the shell turns into the block
/// screen.
///
/// That second path only fires when the engine is armed — production. In
/// every other flavor a pinning failure is an ordinary failed request, which
/// is the right outcome: a staging build should not brick itself over a
/// certificate rotation.
class RaspNetworkSecurity implements NetworkSecurity {
  /// Throws [NetworkSecurityMisconfigured] when the arguments describe
  /// protection that would not actually be applied.
  factory RaspNetworkSecurity({
    required bool isAntiProxyEnabled,
    required List<String> spkiSha256Hashes,
    required List<String> certificateSha256Fingerprints,
    required bool bypassForLocalhost,
  }) {
    // The vendor's SPKI check rides on the same adapter that disables the
    // system proxy, so hashes without that adapter are silently ignored —
    // the build would report itself as pinned while pinning nothing.
    if (spkiSha256Hashes.isNotEmpty && !isAntiProxyEnabled) {
      throw const NetworkSecurityMisconfigured(
        'SPKI_SHA256_HASHES is set but ENABLE_ANTI_PROXY is false. SPKI '
        'pinning is applied by the secure HTTP adapter, which only the '
        'anti-proxy setting installs, so these hashes would never be checked.',
      );
    }

    return RaspNetworkSecurity._(
      isAntiProxyEnabled: isAntiProxyEnabled,
      spkiSha256Hashes: spkiSha256Hashes,
      certificateSha256Fingerprints: certificateSha256Fingerprints,
      bypassForLocalhost: bypassForLocalhost,
    );
  }

  const RaspNetworkSecurity._({
    required this.isAntiProxyEnabled,
    required this.spkiSha256Hashes,
    required this.certificateSha256Fingerprints,
    required this.bypassForLocalhost,
  });

  /// Whether to force the client past the system proxy. Also what installs
  /// the adapter that performs SPKI pinning.
  final bool isAntiProxyEnabled;

  /// SHA-256 hashes of the server's SubjectPublicKeyInfo. Checked during the
  /// TLS handshake the request was making anyway, so this costs nothing per
  /// request. Survives certificate renewal as long as the key is reused.
  final List<String> spkiSha256Hashes;

  /// SHA-256 fingerprints of the whole server certificate.
  ///
  /// Stricter than SPKI and correspondingly more brittle — every renewal
  /// needs a new app release. It also costs a separate TLS connection on
  /// **every request**, because the vendor's interceptor validates by opening
  /// its own. Prefer [spkiSha256Hashes] unless a threat model demands both.
  final List<String> certificateSha256Fingerprints;

  /// Whether localhost, 127.0.0.1, and the Android emulator's 10.0.2.2 skip
  /// the checks, so a local mock server does not need a pinned certificate.
  final bool bypassForLocalhost;

  @override
  List<Interceptor> get interceptors => <Interceptor>[
    if (certificateSha256Fingerprints.isNotEmpty)
      SslPinningInterceptor(
        allowedFingerprints: certificateSha256Fingerprints,
        bypassForLocalhost: bypassForLocalhost,
      ),
  ];

  @override
  HttpClientAdapter? get httpClientAdapter => isAntiProxyEnabled
      ? SecureHttpClientAdapter.getAdapter(
          allowedSpkiHashes: spkiSha256Hashes,
          bypassSpkiForLocalhost: bypassForLocalhost,
        )
      : null;
}
