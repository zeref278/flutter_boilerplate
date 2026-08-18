import 'package:boilerplate/core/storage/local_storage.dart';
import 'package:boilerplate/core/storage/storage_exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Hive-backed key-value storage, encrypted with AES-256 when an encryption
/// key is supplied.
class HiveStorage extends LocalStorage {
  Box<dynamic>? _box;
  String? _boxName;

  Box<dynamic> get _requireBox {
    final Box<dynamic>? box = _box;
    if (box == null || !box.isOpen) {
      throw const StorageNotInitializedException();
    }
    return box;
  }

  @override
  Future<void> init({
    required String boxName,
    String? testPath,
    List<int>? encryptionKey,
  }) async {
    if (_box != null && _box!.isOpen) return;

    _boxName = boxName;
    try {
      if (testPath == null || testPath.isEmpty) {
        await Hive.initFlutter();
      } else {
        Hive.init(testPath);
      }
      _box = await _openBox(
        encryptionKey == null ? null : HiveAesCipher(encryptionKey),
      );
    } on StorageException {
      rethrow;
    } on Object catch (e) {
      throw StorageInitializationException(
        'Failed to initialize storage',
        originalError: e,
      );
    }
  }

  /// Opens the box, recreating it if unreadable.
  ///
  /// A corrupt box would otherwise fail every launch. Losing the cache is
  /// recoverable; refusing to start is not.
  Future<Box<dynamic>> _openBox(HiveCipher? cipher) async {
    try {
      return await Hive.openBox<dynamic>(_boxName!, encryptionCipher: cipher);
    } on HiveError {
      await Hive.deleteBoxFromDisk(_boxName!);
      return Hive.openBox<dynamic>(_boxName!, encryptionCipher: cipher);
    }
  }

  @override
  Future<void> saveData<T>(String key, T value) async {
    try {
      await _requireBox.put(key, value);
    } on StorageException {
      rethrow;
    } on Object catch (e) {
      throw StorageSaveException('Failed to save', key, originalError: e);
    }
  }

  @override
  Future<T?> getData<T>(String key, {T? defaultValue}) async {
    try {
      return _requireBox.get(key, defaultValue: defaultValue) as T?;
    } on StorageException {
      rethrow;
    } on Object catch (e) {
      throw StorageRetrievalException('Failed to read', key, originalError: e);
    }
  }

  @override
  Future<void> removeData(String key) async {
    try {
      await _requireBox.delete(key);
    } on StorageException {
      rethrow;
    } on Object catch (e) {
      throw StorageDeletionException('Failed to delete', key, originalError: e);
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await _requireBox.clear();
    } on StorageException {
      rethrow;
    } on Object catch (e) {
      throw StorageClearException('Failed to clear', originalError: e);
    }
  }

  @override
  Future<bool> containsKey(String key) async => _requireBox.containsKey(key);

  @override
  Future<List<String>> getAllKeys() async =>
      _requireBox.keys.map((key) => key.toString()).toList();

  @override
  Future<int> getSize() async => _requireBox.length;
}
