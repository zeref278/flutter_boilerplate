import 'package:boilerplate/core/network/dio_client.dart';
import 'package:boilerplate/core/security/network_security.dart';
import 'package:boilerplate/core/security/rasp_network_security.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  RaspNetworkSecurity build({
    bool antiProxy = false,
    List<String> spki = const <String>[],
    List<String> fingerprints = const <String>[],
    bool bypassLocalhost = true,
  }) => RaspNetworkSecurity(
    isAntiProxyEnabled: antiProxy,
    spkiSha256Hashes: spki,
    certificateSha256Fingerprints: fingerprints,
    bypassForLocalhost: bypassLocalhost,
  );

  group('configuration', () {
    test('applies nothing when every protection is off', () {
      final RaspNetworkSecurity security = build();

      expect(security.interceptors, isEmpty);
      expect(security.httpClientAdapter, isNull);
    });

    test('swaps the adapter when anti-proxy is on', () {
      expect(build(antiProxy: true).httpClientAdapter, isNotNull);
    });

    test('adds a pinning interceptor only when fingerprints are given', () {
      expect(build().interceptors, isEmpty);
      expect(build(fingerprints: <String>['AA:BB']).interceptors, hasLength(1));
    });

    test('carries SPKI hashes on the adapter, not as an interceptor', () {
      // SPKI is validated during the handshake the adapter owns, so it must
      // not add per-request work.
      final RaspNetworkSecurity security = build(
        antiProxy: true,
        spki: <String>['AABB'],
      );

      expect(security.httpClientAdapter, isNotNull);
      expect(security.interceptors, isEmpty);
    });

    test('rejects SPKI hashes that no adapter would ever check', () {
      // The vendor applies SPKI through the same adapter anti-proxy installs.
      // Without it the hashes are silently ignored, which is worse than
      // failing: the build would report itself pinned while pinning nothing.
      expect(
        () => build(spki: <String>['AABB']),
        throwsA(isA<NetworkSecurityMisconfigured>()),
      );
    });

    test('names the two settings in the misconfiguration message', () {
      try {
        build(spki: <String>['AABB']);
        fail('expected NetworkSecurityMisconfigured');
      } on NetworkSecurityMisconfigured catch (error) {
        expect(error.toString(), contains('SPKI_SHA256_HASHES'));
        expect(error.toString(), contains('ENABLE_ANTI_PROXY'));
      }
    });
  });

  group('createDio', () {
    Dio buildClient(NetworkSecurity security) => createDio(
      baseUrl: 'https://example.test',
      connectTimeout: const Duration(seconds: 1),
      receiveTimeout: const Duration(seconds: 1),
      sendTimeout: const Duration(seconds: 1),
      security: security,
    );

    test('leaves the default adapter alone when security applies none', () {
      final HttpClientAdapter adapter = buildClient(
        const PermissiveNetworkSecurity(),
      ).httpClientAdapter;

      expect(adapter, isNotNull);
    });

    test('installs the interceptors security asks for', () {
      final Dio dio = buildClient(build(fingerprints: <String>['AA']));

      expect(dio.interceptors.whereType<Interceptor>(), isNotEmpty);
    });

    test('puts pinning ahead of every other interceptor', () {
      // Order is the contract: a rejected request must not reach anything
      // that would log it, retry it, or attach a credential to it.
      final Interceptor trailing = LogInterceptor();
      final Dio dio = createDio(
        baseUrl: 'https://example.test',
        connectTimeout: const Duration(seconds: 1),
        receiveTimeout: const Duration(seconds: 1),
        sendTimeout: const Duration(seconds: 1),
        security: build(fingerprints: <String>['AA']),
        interceptors: <Interceptor>[trailing],
      );

      final int pinning = dio.interceptors.indexWhere(
        (Interceptor i) => i.runtimeType.toString().contains('SslPinning'),
      );

      expect(pinning, isNonNegative);
      expect(pinning, lessThan(dio.interceptors.indexOf(trailing)));
    });

    test('omits the Authorization header when no key is configured', () {
      final Dio dio = buildClient(const PermissiveNetworkSecurity());

      expect(dio.options.headers.containsKey('Authorization'), isFalse);
    });
  });
}
