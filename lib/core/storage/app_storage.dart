import 'dart:convert';

import 'package:boilerplate/core/storage/storage_keys.dart';

/// The app's storage. The only storage type anything outside this folder
/// injects.
///
/// Where a value physically lands — encrypted store or platform keychain — is
/// decided by [StorageKeys.secretKeys], not by the caller.
abstract class AppStorage {
  /// Opens the backends. Must complete before any other method is called.
  Future<void> init({required String boxName, String? path});

  Future<void> write<T>(String key, T value);

  Future<T?> read<T>(String key, {T? defaultValue});

  Future<void> delete(String key);

  /// Wipes everything except the store encryption key, whose loss would make
  /// the existing encrypted store permanently unreadable.
  Future<void> clear();

  Future<bool> containsKey(String key);

  Future<Set<String>> keys();
}

/// JSON convenience, kept out of the interface so implementations only ever
/// implement the seven primitive operations.
extension AppStorageJson on AppStorage {
  Future<void> writeObject<T>(String key, T value) =>
      write<String>(key, jsonEncode(value));

  Future<T?> readObject<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final String? raw = await read<String>(key);
    if (raw == null) return null;
    return fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> writeObjectList<T>(String key, List<T> list) =>
      write<String>(key, jsonEncode(list));

  Future<List<T>?> readObjectList<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final String? raw = await read<String>(key);
    if (raw == null) return null;
    return (jsonDecode(raw) as List<dynamic>)
        .map((item) => fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
