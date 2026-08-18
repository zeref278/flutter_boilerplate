import 'dart:convert';

import 'package:boilerplate/core/storage/local_storage.dart';
import 'package:boilerplate/core/storage/secure_storage.dart';
import 'package:boilerplate/core/storage/storage_exception.dart';
import 'package:boilerplate/core/storage/storage_keys.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Routes keys in [StorageKeys.secureKeys] to the platform keystore and
/// everything else to the wrapped [LocalStorage].
///
/// This is the only storage type the app injects, so no caller ever picks a
/// backend — the key decides. It also owns the Hive AES key lifecycle.
class SecureRoutedStorage extends LocalStorage {
  SecureRoutedStorage(this._local, this._secure);

  final LocalStorage _local;
  final SecureStorage _secure;

  /// [HiveAesCipher] rejects keys that are not exactly this long.
  static const int _aesKeyLength = 32;

  bool _isSecure(String key) => StorageKeys.secureKeys.contains(key);

  @override
  Future<void> init({
    required String boxName,
    String? testPath,
    List<int>? encryptionKey,
  }) async {
    final List<int> key = encryptionKey ?? await _getOrCreateEncryptionKey();
    await _local.init(boxName: boxName, testPath: testPath, encryptionKey: key);
    await _wipeSecureKeysOnFreshInstall();
  }

  Future<List<int>> _getOrCreateEncryptionKey() async {
    final List<int>? stored = await _readStoredEncryptionKey();
    if (stored != null) return stored;

    final List<int> key = Hive.generateSecureKey();
    try {
      await _secure.write(StorageKeys.hiveEncryptionKey, base64Url.encode(key));
    } on PlatformException catch (e) {
      throw StorageInitializationException(
        'Failed to persist the storage encryption key',
        originalError: e,
      );
    }
    return key;
  }

  /// Fails soft on an unreadable or corrupt key.
  ///
  /// Returning null regenerates, costing one cache wipe. Keystore reads are
  /// known to fail after a backup restore, and bricking startup on every
  /// launch is the worse outcome.
  Future<List<int>?> _readStoredEncryptionKey() async {
    final String? stored;
    try {
      stored = await _secure.read(StorageKeys.hiveEncryptionKey);
    } on PlatformException {
      return null;
    }
    if (stored == null) return null;

    final List<int> key;
    try {
      key = base64Url.decode(stored);
    } on FormatException {
      return null;
    }
    return key.length == _aesKeyLength ? key : null;
  }

  /// iOS Keychain entries survive app uninstall.
  ///
  /// On a fresh install the Hive box starts empty, so a missing
  /// [StorageKeys.isFirstLaunch] flag means any secure values belong to a
  /// previous install — wipe them, or a reinstall could restore an old
  /// session.
  Future<void> _wipeSecureKeysOnFreshInstall() async {
    final bool isFirstLaunch =
        await _local.getData<bool>(StorageKeys.isFirstLaunch) ?? true;
    if (!isFirstLaunch) return;

    try {
      await _wipeSecurePreservingEncryptionKey();
    } on PlatformException {
      // Fail open: never block startup on a wipe failure. The flag stays
      // unset, so the wipe retries next launch.
      return;
    }
    await _local.saveData<bool>(StorageKeys.isFirstLaunch, false);
  }

  /// A full secure wipe must keep the encryption key, or the existing box
  /// becomes permanently unreadable.
  Future<void> _wipeSecurePreservingEncryptionKey() async {
    final String? key = await _secure.read(StorageKeys.hiveEncryptionKey);
    await _secure.deleteAll();
    if (key != null) {
      await _secure.write(StorageKeys.hiveEncryptionKey, key);
    }
  }

  @override
  Future<void> saveData<T>(String key, T value) async {
    if (!_isSecure(key)) return _local.saveData<T>(key, value);
    await _secure.write(key, value.toString());
  }

  @override
  Future<T?> getData<T>(String key, {T? defaultValue}) async {
    if (!_isSecure(key)) {
      return _local.getData<T>(key, defaultValue: defaultValue);
    }
    final String? raw = await _secure.read(key);
    if (raw == null) return defaultValue;
    return _decode<T>(raw) ?? defaultValue;
  }

  /// Secure storage holds strings only, so primitives are decoded on read.
  T? _decode<T>(String raw) {
    if (T == String) return raw as T;
    if (T == int) return int.tryParse(raw) as T?;
    if (T == double) return double.tryParse(raw) as T?;
    if (T == bool) return (raw == 'true') as T;
    return raw as T?;
  }

  @override
  Future<void> removeData(String key) async {
    if (!_isSecure(key)) return _local.removeData(key);
    await _secure.delete(key);
  }

  @override
  Future<void> clearAll() async {
    await _local.clearAll();
    await _wipeSecurePreservingEncryptionKey();
  }

  @override
  Future<bool> containsKey(String key) async {
    if (!_isSecure(key)) return _local.containsKey(key);
    return _secure.containsKey(key);
  }

  @override
  Future<List<String>> getAllKeys() async {
    final List<String> local = await _local.getAllKeys();
    final Map<String, String> secure = await _secure.readAll();
    return <String>[...local, ...secure.keys];
  }

  @override
  Future<int> getSize() async => (await getAllKeys()).length;
}
