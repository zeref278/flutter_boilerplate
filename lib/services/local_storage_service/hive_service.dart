import 'dart:async';

import 'package:boilerplate/services/local_storage_service/shared_preferences_service.dart';

/// TODO: modify this if you use Hive packages
class HiveService implements SharedPreferencesService {
  @override
  String isDarkModeKey = 'hiveIsDarkModeKey';

  @override
  String isFirstUseKey = 'hiveIsFirstUseKey';

  @override
  String localeKey = 'hiveLocaleKey';

  @override
  String tokenKey = 'hiveTokenKey';

  @override
  getValue({required String key}) {
    // TODO: implement getValue
    throw UnimplementedError();
  }

  @override
  FutureOr<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  // TODO: implement isDarkMode
  bool get isDarkMode => throw UnimplementedError();

  @override
  // TODO: implement isFirstUse
  bool get isFirstUse => throw UnimplementedError();

  @override
  // TODO: implement locale
  String get locale => throw UnimplementedError();

  @override
  Future<bool> setIsDarkMode(bool isDarkMode) {
    // TODO: implement setIsDarkMode
    throw UnimplementedError();
  }

  @override
  Future<bool> setIsFirstUse(bool isFirstUse) {
    // TODO: implement setIsFirstUse
    throw UnimplementedError();
  }

  @override
  Future<bool> setLocale(String locale) {
    // TODO: implement setLocale
    throw UnimplementedError();
  }

  @override
  Future<bool> setToken(String token) {
    // TODO: implement setToken
    throw UnimplementedError();
  }

  @override
  void setValue({required String key, required value}) {
    // TODO: implement setValue
  }

  @override
  // TODO: implement token
  String? get token => throw UnimplementedError();
}
