import 'package:boilerplate/app/preferences/app_preferences.dart';
import 'package:boilerplate/app/preferences/stored_app_preferences.dart';
import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/storage/app_storage.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeAppStorage implements AppStorage {
  final Map<String, Object?> values = <String, Object?>{};

  @override
  Future<void> init({required String boxName, String? path}) async {}

  @override
  Future<void> write<T>(String key, T value) async => values[key] = value;

  @override
  Future<T?> read<T>(String key, {T? defaultValue}) async =>
      (values[key] as T?) ?? defaultValue;

  @override
  Future<void> delete(String key) async => values.remove(key);

  @override
  Future<void> clear() async => values.clear();

  @override
  Future<bool> containsKey(String key) async => values.containsKey(key);

  @override
  Future<Set<String>> keys() async => values.keys.toSet();
}

void main() {
  late FakeAppStorage storage;
  late AppPreferences preferences;

  setUp(() {
    storage = FakeAppStorage();
    preferences = StoredAppPreferences(storage);
  });

  test('defaults to light mode when nothing is stored', () async {
    expect(await preferences.isDarkMode, isFalse);
  });

  test('defaults to first use when nothing is stored', () async {
    expect(await preferences.isFirstUse, isTrue);
  });

  test('defaults to the configured locale when nothing is stored', () async {
    expect(await preferences.locale, AppConfig.defaultLocale);
  });

  test('round-trips dark mode', () async {
    await preferences.setIsDarkMode(darkMode: true);

    expect(await preferences.isDarkMode, isTrue);
  });

  test('round-trips the locale', () async {
    await preferences.setLocale(locale: 'vi');

    expect(await preferences.locale, 'vi');
  });

  test('round-trips first use', () async {
    await preferences.setIsFirstUse(isFirstUse: false);

    expect(await preferences.isFirstUse, isFalse);
  });
}
