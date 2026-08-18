/// App-level user preferences.
abstract class AppPreferences {
  Future<bool> get isDarkMode;

  Future<String> get locale;

  Future<bool> get isFirstUse;

  Future<void> setIsDarkMode({required bool darkMode});

  Future<void> setLocale({required String locale});

  Future<void> setIsFirstUse({required bool isFirstUse});
}
