/// Flavor configuration. `configDev` runs from `main.dart`; add
/// `main_staging.dart` / `main_prod.dart` entrypoints calling the others.
class AppConfig {
  AppConfig._();

  static String baseUrl = '';

  static const String defaultLocale = 'en';

  static const List<String> supportedLocales = <String>['en', 'vi'];

  static void configDev() {
    baseUrl = 'https://dog.ceo/api';
  }

  static void configStaging() {
    baseUrl = 'https://dog.ceo/api';
  }

  static void configProduction() {
    baseUrl = 'https://dog.ceo/api';
  }
}
