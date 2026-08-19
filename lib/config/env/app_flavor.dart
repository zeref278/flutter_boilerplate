/// The build flavors this app ships.
///
/// The name of each value is the flavor name given to `flutter run --flavor`,
/// to `flavorizr.yaml`, and to the `.env.<flavor>` file. Keeping one spelling
/// across all three is what lets `AppConfig` verify at startup that the
/// baked-in configuration matches the binary it was compiled into.
enum AppFlavor {
  dev('DEV'),
  production('PROD');

  const AppFlavor(this.environment);

  /// The `ENVIRONMENT` value the matching `.env` file must carry.
  final String environment;

  /// The flavor whose [environment] is [value], or null if none matches.
  static AppFlavor? fromEnvironment(String value) {
    for (final AppFlavor flavor in AppFlavor.values) {
      if (flavor.environment == value) return flavor;
    }
    return null;
  }

  /// The flavor named [value], or null if none matches.
  ///
  /// [value] is what `--flavor` was given, which is free text until it is
  /// checked against this enum.
  static AppFlavor? fromName(String value) {
    for (final AppFlavor flavor in AppFlavor.values) {
      if (flavor.name == value) return flavor;
    }
    return null;
  }
}
