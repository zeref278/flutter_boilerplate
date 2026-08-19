import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Platform secret storage — Android Keystore, iOS Keychain.
///
/// Abstract so tests substitute an in-memory fake without platform channels.
/// Strings only; encoding non-strings is the caller's job.
abstract class Keychain {
  Future<String?> read(String key);

  Future<void> write(String key, String value);

  Future<void> delete(String key);

  Future<void> deleteAll();

  Future<bool> containsKey(String key);

  Future<Map<String, String>> readAll();
}

/// Passthrough to `flutter_secure_storage` with default platform options.
///
/// No error handling here: `AppStorageImpl` maps `PlatformException` at the
/// routing layer, where it knows whether the failure is recoverable.
class PlatformKeychain implements Keychain {
  const PlatformKeychain({FlutterSecureStorage? storage})
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
