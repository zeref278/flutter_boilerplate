import 'package:dio/dio.dart';

/// The transport-level hardening applied to the app's HTTP client.
///
/// Two independent protections, both configured per flavor:
///
/// - **Anti-proxy.** Forces the client to ignore the system proxy, so
///   Charles, Proxyman, or Burp see nothing even on a device the operator
///   controls. Also the carrier for SPKI pinning, because both live on the
///   same HTTP client adapter.
/// - **Pinning.** Rejects a connection whose certificate is not one this
///   build expects — SPKI pinning validates the public key during the
///   handshake that is happening anyway, certificate pinning compares the
///   whole certificate's fingerprint.
///
/// Expressed as dio types rather than as the vendor's, so the security
/// package stays named in one file. See `RaspNetworkSecurity`.
abstract class NetworkSecurity {
  /// Interceptors to install, in order. May be empty.
  List<Interceptor> get interceptors;

  /// The adapter to swap in, or null to keep dio's default.
  HttpClientAdapter? get httpClientAdapter;
}

/// Thrown when the configured protections cannot do what they claim.
///
/// Every case is a build-time mistake in a `.env` file that would otherwise
/// be invisible: the app would run, the requests would succeed, and nothing
/// would be pinned. Failing at startup makes it a bug someone finds in QA
/// rather than a property nobody notices is missing.
class NetworkSecurityMisconfigured implements Exception {
  const NetworkSecurityMisconfigured(this.message);

  final String message;

  @override
  String toString() => 'NetworkSecurityMisconfigured: $message';
}

/// Applies nothing. The correct configuration for local development, where a
/// debugging proxy is a tool rather than an attack.
class PermissiveNetworkSecurity implements NetworkSecurity {
  const PermissiveNetworkSecurity();

  @override
  List<Interceptor> get interceptors => const <Interceptor>[];

  @override
  HttpClientAdapter? get httpClientAdapter => null;
}
