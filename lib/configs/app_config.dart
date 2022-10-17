class AppConfig {
  static String baseUrl = '';

  static void configDev() {
    baseUrl = 'https://dog.ceo/api';
  }
  static void configTest() {
    /// TODO
  }

  static void configProduction() {
    /// TODO
  }

}