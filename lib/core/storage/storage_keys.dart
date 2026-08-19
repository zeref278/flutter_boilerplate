/// Every storage key in the app, and which of them are secrets.
///
/// Membership in [secretKeys] is what routes a value to the platform keychain
/// instead of the encrypted box. Callers never choose a backend — this set
/// does. Adding a credential key here is the whole act of securing it.
class StorageKeys {
  StorageKeys._();

  /// Name of the encrypted box every non-secret key lands in. Storage naming,
  /// so it belongs beside the keys rather than in whichever module happens to
  /// open the store.
  static const String boxName = 'app';

  // Settings
  static const String darkMode = 'dark_mode';
  static const String locale = 'locale';
  static const String isFirstUse = 'is_first_use';

  /// Written once the app has completed a launch. Its ABSENCE means a fresh
  /// install, which is how reinstall detection works — see `AppStorageImpl`.
  static const String hasLaunchedBefore = 'has_launched_before';

  // Credentials
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';

  /// The store's AES key. Read straight from the `Keychain`, never routed —
  /// routing it would be circular, since routing is what needs the box open.
  static const String boxEncryptionKey = 'box_encryption_key';

  /// Keys held in the platform keychain rather than the encrypted box.
  static Set<String> get secretKeys => <String>{accessToken, refreshToken};

  /// Keys cleared on logout. Deliberately excludes settings.
  static List<String> get clearOnLogout => <String>[accessToken, refreshToken];
}
