import 'dart:io';

import 'package:boilerplate/core/storage/hive_storage.dart';
import 'package:boilerplate/core/storage/secure_routed_storage.dart';
import 'package:boilerplate/core/storage/secure_storage.dart';
import 'package:boilerplate/core/storage/storage_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InMemorySecureStorage implements SecureStorage {
  final Map<String, String> values = <String, String>{};

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async => values[key] = value;

  @override
  Future<void> delete(String key) async => values.remove(key);

  @override
  Future<void> deleteAll() async => values.clear();

  @override
  Future<bool> containsKey(String key) async => values.containsKey(key);

  @override
  Future<Map<String, String>> readAll() async =>
      Map<String, String>.from(values);
}

void main() {
  late Directory dir;
  late HiveStorage hive;
  late InMemorySecureStorage secure;
  late SecureRoutedStorage storage;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('routed_test');
    hive = HiveStorage();
    secure = InMemorySecureStorage();
    storage = SecureRoutedStorage(hive, secure);
    await storage.init(boxName: 'routed_box', testPath: dir.path);
  });

  tearDown(() async {
    await Hive.close();
    await dir.delete(recursive: true);
  });

  test('generates and persists an AES key in secure storage', () async {
    expect(secure.values[StorageKeys.hiveEncryptionKey], isNotNull);
  });

  test('routes a secure key to secure storage and never to the box', () async {
    await storage.saveData<String>(StorageKeys.accessToken, 'token-123');

    expect(secure.values[StorageKeys.accessToken], 'token-123');
    expect(await hive.containsKey(StorageKeys.accessToken), isFalse);
  });

  test(
    'routes a non-secure key to the box and never to secure storage',
    () async {
      await storage.saveData<bool>(StorageKeys.darkMode, true);

      expect(await hive.getData<bool>(StorageKeys.darkMode), isTrue);
      expect(secure.values.containsKey(StorageKeys.darkMode), isFalse);
    },
  );

  test('reads a secure value back through the router', () async {
    await storage.saveData<String>(StorageKeys.accessToken, 'token-123');

    expect(await storage.getData<String>(StorageKeys.accessToken), 'token-123');
  });

  test('decodes non-string primitives written to secure storage', () async {
    await storage.saveData<String>(StorageKeys.refreshToken, 'r1');

    expect(await storage.getData<String>(StorageKeys.refreshToken), 'r1');
  });

  test('removeData deletes from the correct backend', () async {
    await storage.saveData<String>(StorageKeys.accessToken, 'token');
    await storage.saveData<bool>(StorageKeys.darkMode, true);

    await storage.removeData(StorageKeys.accessToken);

    expect(secure.values.containsKey(StorageKeys.accessToken), isFalse);
    expect(await storage.getData<bool>(StorageKeys.darkMode), isTrue);
  });

  test('preserves the encryption key when clearing everything', () async {
    await storage.saveData<String>(StorageKeys.accessToken, 'token');

    await storage.clearAll();

    expect(secure.values[StorageKeys.hiveEncryptionKey], isNotNull);
    expect(secure.values.containsKey(StorageKeys.accessToken), isFalse);
  });
}
