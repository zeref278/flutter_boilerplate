import 'dart:convert';

import 'package:boilerplate/core/storage/app_storage.dart';
import 'package:boilerplate/core/storage/encrypted_store.dart';
import 'package:boilerplate/core/storage/keychain.dart';
import 'package:boilerplate/core/storage/storage_exception.dart';
import 'package:boilerplate/core/storage/storage_keys.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Routes each key to a backend and owns the store's encryption key.
///
/// Secrets go to the [Keychain]; everything else to the [EncryptedStore].
/// Callers never choose — [StorageKeys.secretKeys] decides, so securing a new
/// value is one line in that set rather than a change at every call site.
class AppStorageImpl implements AppStorage {
  AppStorageImpl(this._store, this._keychain);

  final EncryptedStore _store;
  final Keychain _keychain;

  /// `HiveAesCipher` rejects any key that is not exactly this long.
  static const int _aesKeyLength = 32;

  bool _isSecret(String key) => StorageKeys.secretKeys.contains(key);

  @override
  Future<void> init({required String boxName, String? path}) async {
    final List<int> encryptionKey = await _readOrCreateEncryptionKey();
    await _store.open(name: boxName, encryptionKey: encryptionKey, path: path);
    await _wipeSecretsOnFreshInstall(base64Url.encode(encryptionKey));
  }

  Future<List<int>> _readOrCreateEncryptionKey() async {
    final List<int>? existing = await _readEncryptionKey();
    if (existing != null) return existing;

    final List<int> key = Hive.generateSecureKey();
    try {
      await _keychain.write(
        StorageKeys.boxEncryptionKey,
        base64Url.encode(key),
      );
    } on PlatformException catch (e) {
      throw StorageInitException(
        'Could not persist the store encryption key',
        originalError: e,
      );
    }
    return key;
  }

  /// Fails soft on an unreadable or malformed key.
  ///
  /// Returning null regenerates, which costs one wipe of cached data.
  /// Keychain reads are known to fail after a device backup restore, and
  /// bricking startup on every launch is far worse than losing a cache.
  Future<List<int>?> _readEncryptionKey() async {
    final String? stored;
    try {
      stored = await _keychain.read(StorageKeys.boxEncryptionKey);
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

  /// iOS Keychain entries outlive app uninstall.
  ///
  /// On a fresh install the store starts empty, so a missing
  /// [StorageKeys.hasLaunchedBefore] flag means any secrets present belong to
  /// a previous install. Left alone, a reinstall could restore an old session
  /// or prefill an old password.
  Future<void> _wipeSecretsOnFreshInstall(String encryptionKey) async {
    final bool launchedBefore =
        await _store.read<bool>(StorageKeys.hasLaunchedBefore) ?? false;
    if (launchedBefore) return;

    try {
      await _wipeKeychainKeepingEncryptionKey(encryptionKey: encryptionKey);
    } on PlatformException {
      // Fail open: never block startup on a wipe failure. The flag stays
      // unset, so the wipe is retried on the next launch.
      return;
    }
    await _store.write<bool>(StorageKeys.hasLaunchedBefore, true);
  }

  /// A keychain wipe must keep the encryption key, or the existing store
  /// becomes permanently unreadable.
  Future<void> _wipeKeychainKeepingEncryptionKey({
    String? encryptionKey,
  }) async {
    final String? key =
        encryptionKey ?? await _keychain.read(StorageKeys.boxEncryptionKey);
    await _keychain.deleteAll();
    if (key != null) {
      await _keychain.write(StorageKeys.boxEncryptionKey, key);
    }
  }

  @override
  Future<void> write<T>(String key, T value) async {
    if (!_isSecret(key)) return _store.write<T>(key, value);
    try {
      await _keychain.write(key, value.toString());
    } on PlatformException catch (e) {
      throw StorageWriteException('Could not write', key, originalError: e);
    }
  }

  @override
  Future<T?> read<T>(String key, {T? defaultValue}) async {
    if (!_isSecret(key)) {
      return _store.read<T>(key, defaultValue: defaultValue);
    }

    final String? raw;
    try {
      raw = await _keychain.read(key);
    } on PlatformException {
      return defaultValue;
    }
    if (raw == null) return defaultValue;
    return _parse<T>(raw) ?? defaultValue;
  }

  /// The keychain holds strings, so primitives are parsed back on read.
  T? _parse<T>(String raw) {
    if (T == String) return raw as T;
    if (T == int) return int.tryParse(raw) as T?;
    if (T == double) return double.tryParse(raw) as T?;
    if (T == bool) return (raw == 'true') as T;
    return raw as T?;
  }

  @override
  Future<void> delete(String key) async {
    if (!_isSecret(key)) return _store.delete(key);
    try {
      await _keychain.delete(key);
    } on PlatformException catch (e) {
      throw StorageDeleteException('Could not delete', key, originalError: e);
    }
  }

  @override
  Future<void> clear() async {
    await _store.clear();
    try {
      await _wipeKeychainKeepingEncryptionKey();
    } on PlatformException catch (e) {
      throw StorageClearException('Could not clear', originalError: e);
    }
  }

  @override
  Future<bool> containsKey(String key) async {
    if (!_isSecret(key)) return _store.containsKey(key);
    try {
      return await _keychain.containsKey(key);
    } on PlatformException catch (e) {
      throw StorageReadException('Could not read', key, originalError: e);
    }
  }

  @override
  Future<Set<String>> keys() async {
    final Map<String, String> secretKeys;
    try {
      secretKeys = await _keychain.readAll();
    } on PlatformException catch (e) {
      throw StorageReadException(
        'Could not read keys',
        'keys',
        originalError: e,
      );
    }
    return <String>{...await _store.keys(), ...secretKeys.keys};
  }
}
