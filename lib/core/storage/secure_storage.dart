import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Platform-secure key-value storage (Android Keystore / iOS Keychain).
///
/// Abstract so tests can substitute an in-memory fake without touching
/// platform channels. Strings only — encoding is the caller's job.
abstract class SecureStorage {
  Future<String?> read(String key);

  Future<void> write(String key, String value);

  Future<void> delete(String key);

  Future<void> deleteAll();

  Future<bool> containsKey(String key);

  Future<Map<String, String>> readAll();
}

/// Passthrough to [FlutterSecureStorage] with default platform options.
class FlutterSecureStorageImpl implements SecureStorage {
  const FlutterSecureStorageImpl({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  @override
  Future<void> delete(String key) => _storage.delete(key: key);

  @override
  Future<void> deleteAll() => _storage.deleteAll();

  @override
  Future<bool> containsKey(String key) => _storage.containsKey(key: key);

  @override
  Future<Map<String, String>> readAll() => _storage.readAll();
}
