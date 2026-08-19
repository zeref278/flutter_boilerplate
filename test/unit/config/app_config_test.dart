import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/security/rasp_network_security.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppFlavor', () {
    test('resolves a flavor from its environment value', () {
      expect(AppFlavor.fromEnvironment('DEV'), AppFlavor.dev);
      expect(AppFlavor.fromEnvironment('PROD'), AppFlavor.production);
    });

    test('returns null for an environment value no flavor claims', () {
      expect(AppFlavor.fromEnvironment('STAGING'), isNull);
      expect(AppFlavor.fromEnvironment(''), isNull);
    });

    test('resolves a flavor from the name given to --flavor', () {
      expect(AppFlavor.fromName('dev'), AppFlavor.dev);
      expect(AppFlavor.fromName('production'), AppFlavor.production);
    });

    test('returns null for a --flavor name no flavor claims', () {
      // `--flavor` is free text; a typo must not resolve to a real flavor.
      expect(AppFlavor.fromName('prod'), isNull);
      expect(AppFlavor.fromName('DEV'), isNull);
    });
  });

  group('AppConfig', () {
    // These read whatever .env file code generation last baked in, which is
    // .env.dev after `make setup` but .env.production after
    // `make env_production`. The assertions are therefore about consistency
    // rather than about one flavor's values: a hardcoded 'DEV' here would
    // fail for a correct production build, which teaches the next person to
    // ignore this file.
    test('baked environment names a flavor the app knows', () {
      expect(AppConfig.flavor, isNotNull);
      expect(AppConfig.flavor!.environment, AppConfig.environment);
    });

    test('exactly one of the flavor predicates holds', () {
      expect(AppConfig.isDevelopment, isNot(AppConfig.isProduction));
    });

    test('always has a base URL to build a client from', () {
      expect(AppConfig.baseUrl, isNotEmpty);
    });

    test('exposes timeouts as durations rather than raw milliseconds', () {
      expect(AppConfig.connectTimeout, const Duration(seconds: 10));
      expect(AppConfig.receiveTimeout, const Duration(seconds: 30));
      expect(AppConfig.sendTimeout, const Duration(seconds: 30));
    });

    test('drops blank entries when splitting Android signatures', () {
      // The env value is empty here, so the useful assertion is that an empty
      // string yields no signatures rather than one empty one — which would
      // arm the signature check against a fingerprint nothing can match.
      expect(AppConfig.validAndroidSignatures, isEmpty);
    });

    test('drops blank entries when splitting pinning lists', () {
      // A trailing comma in a .env file must not become an empty hash that
      // nothing can ever match.
      expect(AppConfig.spkiSha256Hashes, everyElement(isNotEmpty));
      expect(AppConfig.certificateSha256Fingerprints, everyElement(isNotEmpty));
    });

    test('bypasses localhost checks everywhere except production', () {
      expect(AppConfig.bypassLocalhostChecks, !AppConfig.isProduction);
    });

    test('the baked transport settings build a valid security policy', () {
      // SPKI hashes without the anti-proxy adapter are a startup error, so
      // this asserts the .env this build was generated from is coherent.
      expect(
        () => RaspNetworkSecurity(
          isAntiProxyEnabled: AppConfig.isAntiProxyEnabled,
          spkiSha256Hashes: AppConfig.spkiSha256Hashes,
          certificateSha256Fingerprints:
              AppConfig.certificateSha256Fingerprints,
          bypassForLocalhost: AppConfig.bypassLocalhostChecks,
        ),
        returnsNormally,
      );
    });

    test('does not verify the flavor when the build named none', () {
      // `flutter test` never passes --flavor, so appFlavor is null and there
      // is nothing for the baked configuration to disagree with.
      expect(AppConfig.verifyFlavor, returnsNormally);
    });
  });

  group('FlavorMismatchException', () {
    test('names both sides and the command that fixes them', () {
      const FlavorMismatchException exception = FlavorMismatchException(
        buildFlavor: 'production',
        bakedEnvironment: 'DEV',
      );

      expect(exception.toString(), contains('--flavor production'));
      expect(exception.toString(), contains('ENVIRONMENT=DEV'));
      expect(exception.toString(), contains('make env_production'));
    });
  });
}
