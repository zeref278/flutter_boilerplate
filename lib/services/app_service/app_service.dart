abstract class AppService {
  String get locale;
  bool get isDarkMode;
  bool get isFirstUse;

  Future<void> setLocale({
    required String locale,
  });

  Future<void> setIsDarkMode({
    required bool darkMode,
  });

  Future<void> setIsFirstUse({
    required bool isFirstUse,
  });
}
