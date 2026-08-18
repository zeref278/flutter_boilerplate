/// Centralised storage keys.
///
/// Membership in [secureKeys] is what routes a value to the platform keystore
/// rather than the Hive box — callers never choose a backend.
class StorageKeys {
  StorageKeys._();

  // App settings
  static const String darkMode = 'dark_mode';
  static const String locale = 'locale';
  static const String isFirstUse = 'is_first_use';

  /// Set once the app has completed a launch. Its absence signals a fresh
  /// install, which is how reinstall detection works — see
  /// SecureRoutedStorage.
  static const String isFirstLaunch = 'is_first_launch';

  // Credentials
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';

  /// The Hive AES key itself. Read directly through SecureStorage, so it is
  /// deliberately NOT in [secureKeys] — routing it would be circular.
  static const String hiveEncryptionKey = 'hive_encryption_key';

  /// Keys held in the platform keystore instead of the Hive box.
  static Set<String> get secureKeys => <String>{accessToken, refreshToken};

  /// Keys cleared on logout.
  static List<String> get clearOnLogout => <String>[accessToken, refreshToken];
}
