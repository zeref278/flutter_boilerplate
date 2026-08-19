import 'package:boilerplate/config/env/app_flavor.dart';
import 'package:boilerplate/config/env/env.dart';
import 'package:flutter/services.dart' show appFlavor;

export 'package:boilerplate/config/env/app_flavor.dart';

/// Thrown when the configuration compiled into the binary does not belong to
/// the flavor the binary was built as.
///
/// The two are selected by different commands at different times: `make env_x`
/// bakes the values during code generation and `--flavor x` picks the native
/// target during the build. So building production without
/// re-running code generation first would otherwise ship a
/// production-signed, production-named app carrying development
/// configuration, silently.
class FlavorMismatchException implements Exception {
  const FlavorMismatchException({
    required this.buildFlavor,
    required this.bakedEnvironment,
  });

  /// The value passed to `--flavor`.
  final String buildFlavor;

  /// `ENVIRONMENT` from the `.env` file that code generation actually used.
  final String bakedEnvironment;

  @override
  String toString() =>
      'FlavorMismatchException: built as --flavor $buildFlavor but compiled '
      'with ENVIRONMENT=$bakedEnvironment. Run `make env_$buildFlavor` and '
      'build again.';
}

/// The app's configuration, and the only thing that reads [Env].
///
/// Every value is a compile-time constant baked in by `envied`, so there is
/// nothing to load, nothing to await, and no way for one flavor's build to
/// read another's values.
class AppConfig {
  AppConfig._();

  static const String defaultLocale = 'en';

  static const List<String> supportedLocales = <String>['en', 'vi'];

  static String get environment => Env.environment;

  static String get baseUrl => Env.baseUrl;

  static Duration get connectTimeout =>
      const Duration(milliseconds: Env.connectTimeoutMs);

  static Duration get receiveTimeout =>
      const Duration(milliseconds: Env.receiveTimeoutMs);

  static Duration get sendTimeout =>
      const Duration(milliseconds: Env.sendTimeoutMs);

  static bool get isNetworkLogEnabled => Env.enableNetworkLog;

  /// Sent as a bearer credential when non-empty. Obfuscated in the binary.
  static String get apiKey => Env.apiKey;

  /// Allowed Android signing certificate SHA-256 fingerprints, without
  /// colons. Empty entries are dropped, so a trailing comma is harmless.
  static List<String> get validAndroidSignatures =>
      _commaSeparated(Env.validAndroidSignatures);

  /// Whether the HTTP client ignores the system proxy. Also what installs the
  /// adapter that applies [spkiSha256Hashes].
  static bool get isAntiProxyEnabled => Env.enableAntiProxy;

  /// SHA-256 hashes of the server's SubjectPublicKeyInfo to pin against.
  static List<String> get spkiSha256Hashes =>
      _commaSeparated(Env.spkiSha256Hashes);

  /// SHA-256 fingerprints of the whole server certificate to pin against.
  static List<String> get certificateSha256Fingerprints =>
      _commaSeparated(Env.certificateSha256Fingerprints);

  /// Whether local addresses skip transport checks. False in production: a
  /// production build has no reason to talk to localhost, and a bypass that
  /// ships is a bypass an attacker can aim at.
  static bool get bypassLocalhostChecks => !isProduction;

  /// Splits an env list, dropping blanks so a trailing comma is harmless.
  static List<String> _commaSeparated(String value) => value
      .split(',')
      .map((entry) => entry.trim())
      .where((entry) => entry.isNotEmpty)
      .toList(growable: false);

  /// The flavor whose configuration is compiled in, or null if `ENVIRONMENT`
  /// names none of them.
  static AppFlavor? get flavor => AppFlavor.fromEnvironment(environment);

  static bool get isProduction => flavor == AppFlavor.production;

  static bool get isDevelopment => flavor == AppFlavor.dev;

  /// Fails the launch when the baked configuration and the built flavor
  /// disagree.
  ///
  /// Skipped when [appFlavor] is null, which is every `flutter test` run and
  /// every `flutter run` without `--flavor`. There is no flavor to disagree
  /// with in that case, and refusing to start would break the default
  /// developer loop for no gain.
  static void verifyFlavor() {
    const String? built = appFlavor;
    if (built == null) return;
    if (AppFlavor.fromName(built) == flavor) return;
    throw FlavorMismatchException(
      buildFlavor: built,
      bakedEnvironment: environment,
    );
  }
}
