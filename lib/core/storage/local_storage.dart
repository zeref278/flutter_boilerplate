import 'dart:convert';

/// Key-value storage contract.
///
/// The JSON helpers are concrete because every backend would implement them
/// identically on top of [saveData]/[getData].
abstract class LocalStorage {
  /// Initialise the backend. [encryptionKey] enables encryption at rest.
  /// [testPath] uses a directory instead of platform paths, for tests.
  Future<void> init({
    required String boxName,
    String? testPath,
    List<int>? encryptionKey,
  });

  Future<void> saveData<T>(String key, T value);

  Future<T?> getData<T>(String key, {T? defaultValue});

  Future<void> removeData(String key);

  Future<void> clearAll();

  Future<bool> containsKey(String key);

  Future<List<String>> getAllKeys();

  Future<int> getSize();

  Future<void> saveObject<T>(String key, T value) async {
    await saveData<String>(key, jsonEncode(value));
  }

  Future<T?> getObject<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final String? raw = await getData<String>(key);
    if (raw == null) return null;
    return fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> saveObjectList<T>(String key, List<T> list) async {
    await saveData<String>(key, jsonEncode(list));
  }

  Future<List<T>?> getObjectList<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final String? raw = await getData<String>(key);
    if (raw == null) return null;
    return (jsonDecode(raw) as List<dynamic>)
        .map((item) => fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
