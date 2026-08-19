import 'package:boilerplate/core/storage/storage_exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// An encrypted key-value store. Nothing above this file knows it is Hive.
abstract class EncryptedStore {
  Future<void> open({
    required String name,
    required List<int> encryptionKey,
    String? path,
  });

  Future<void> write<T>(String key, T value);

  Future<T?> read<T>(String key, {T? defaultValue});

  Future<void> delete(String key);

  Future<void> clear();

  Future<bool> containsKey(String key);

  Future<Set<String>> keys();
}

/// Hive-backed store, encrypted with AES-256.
class HiveEncryptedStore implements EncryptedStore {
  Box<dynamic>? _box;
  late String _name;

  Box<dynamic> get _requireOpen {
    final Box<dynamic>? box = _box;
    if (box == null || !box.isOpen) throw const StorageNotReadyException();
    return box;
  }

  @override
  Future<void> open({
    required String name,
    required List<int> encryptionKey,
    String? path,
  }) async {
    if (_box != null && _box!.isOpen) return;
    _name = name;

    try {
      if (path == null || path.isEmpty) {
        await Hive.initFlutter();
      } else {
        Hive.init(path);
      }
      _box = await _openOrRecreate(HiveAesCipher(encryptionKey));
    } on StorageException {
      rethrow;
    } on Object catch (e) {
      throw StorageInitException('Could not open the store', originalError: e);
    }
  }

  /// Opens the store, wiping and recreating it if it cannot be read.
  ///
  /// A store corrupted on disk would otherwise fail every launch forever.
  /// Losing cached data is recoverable; refusing to start is not.
  Future<Box<dynamic>> _openOrRecreate(HiveCipher cipher) async {
    try {
      return await Hive.openBox<dynamic>(_name, encryptionCipher: cipher);
    } on Object catch (error) {
      // Hive reports an unreadable box as a HiveError, which extends Error
      // rather than Exception. Matching it in the `on` clause would be
      // catching an Error, so it is matched here instead and everything else
      // rethrown with its original stack trace intact.
      if (error is! HiveError) rethrow;
      await Hive.deleteBoxFromDisk(_name);
      return Hive.openBox<dynamic>(_name, encryptionCipher: cipher);
    }
  }

  @override
  Future<void> write<T>(String key, T value) async {
    try {
      await _requireOpen.put(key, value);
    } on StorageException {
      rethrow;
    } on Object catch (e) {
      throw StorageWriteException('Could not write', key, originalError: e);
    }
  }

  @override
  Future<T?> read<T>(String key, {T? defaultValue}) async {
    try {
      return _requireOpen.get(key, defaultValue: defaultValue) as T?;
    } on StorageException {
      rethrow;
    } on Object catch (e) {
      throw StorageReadException('Could not read', key, originalError: e);
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _requireOpen.delete(key);
    } on StorageException {
      rethrow;
    } on Object catch (e) {
      throw StorageDeleteException('Could not delete', key, originalError: e);
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _requireOpen.clear();
    } on StorageException {
      rethrow;
    } on Object catch (e) {
      throw StorageClearException('Could not clear', originalError: e);
    }
  }

  @override
  Future<bool> containsKey(String key) async => _requireOpen.containsKey(key);

  @override
  Future<Set<String>> keys() async =>
      _requireOpen.keys.map((key) => key.toString()).toSet();
}
