import 'package:boilerplate/app/preferences/app_preferences.dart';
import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/storage/app_storage.dart';
import 'package:boilerplate/core/storage/storage_keys.dart';

class StoredAppPreferences implements AppPreferences {
  const StoredAppPreferences({required AppStorage storage})
    : _storage = storage;

  final AppStorage _storage;

  @override
  Future<bool> get isDarkMode async =>
      await _storage.read<bool>(StorageKeys.darkMode) ?? false;

  @override
  Future<String> get locale async =>
      await _storage.read<String>(StorageKeys.locale) ??
      AppConfig.defaultLocale;

  @override
  Future<bool> get isFirstUse async =>
      await _storage.read<bool>(StorageKeys.isFirstUse) ?? true;

  @override
  Future<void> setIsDarkMode({required bool darkMode}) =>
      _storage.write<bool>(StorageKeys.darkMode, darkMode);

  @override
  Future<void> setLocale({required String locale}) =>
      _storage.write<String>(StorageKeys.locale, locale);

  @override
  Future<void> setIsFirstUse({required bool isFirstUse}) =>
      _storage.write<bool>(StorageKeys.isFirstUse, isFirstUse);
}
