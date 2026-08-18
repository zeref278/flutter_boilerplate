import 'dart:io';

import 'package:boilerplate/core/storage/app_storage.dart';
import 'package:boilerplate/core/storage/app_storage_impl.dart';
import 'package:boilerplate/core/storage/encrypted_store.dart';
import 'package:boilerplate/core/storage/keychain.dart';
import 'package:boilerplate/core/storage/storage_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FakeKeychain implements Keychain {
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
  late HiveEncryptedStore store;
  late FakeKeychain keychain;
  late AppStorage storage;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('app_storage_test');
    store = HiveEncryptedStore();
    keychain = FakeKeychain();
    storage = AppStorageImpl(store, keychain);
    await storage.init(boxName: 'app_store', path: dir.path);
  });

  tearDown(() async {
    await Hive.close();
    await dir.delete(recursive: true);
  });

  test('generates and persists an AES key in the keychain', () async {
    expect(keychain.values[StorageKeys.boxEncryptionKey], isNotNull);
  });

  test('a secret key reaches the keychain and never the store', () async {
    await storage.write<String>(StorageKeys.accessToken, 'token-123');

    expect(keychain.values[StorageKeys.accessToken], 'token-123');
    expect(await store.containsKey(StorageKeys.accessToken), isFalse);
  });

  test('a non-secret key reaches the store and never the keychain', () async {
    await storage.write<bool>(StorageKeys.darkMode, true);

    expect(await store.read<bool>(StorageKeys.darkMode), isTrue);
    expect(keychain.values.containsKey(StorageKeys.darkMode), isFalse);
  });

  test('reads a secret back through the router', () async {
    await storage.write<String>(StorageKeys.accessToken, 'token-123');

    expect(await storage.read<String>(StorageKeys.accessToken), 'token-123');
  });

  test('decodes a bool written to the keychain', () async {
    await storage.write<String>(StorageKeys.refreshToken, 'true');

    expect(await storage.read<String>(StorageKeys.refreshToken), 'true');
  });

  test('delete removes from the correct backend only', () async {
    await storage.write<String>(StorageKeys.accessToken, 'token');
    await storage.write<bool>(StorageKeys.darkMode, true);

    await storage.delete(StorageKeys.accessToken);

    expect(keychain.values.containsKey(StorageKeys.accessToken), isFalse);
    expect(await storage.read<bool>(StorageKeys.darkMode), isTrue);
  });

  test('clear preserves the store encryption key', () async {
    await storage.write<String>(StorageKeys.accessToken, 'token');

    await storage.clear();

    expect(keychain.values[StorageKeys.boxEncryptionKey], isNotNull);
    expect(keychain.values.containsKey(StorageKeys.accessToken), isFalse);
  });

  test('keys() unions both backends', () async {
    await storage.write<String>(StorageKeys.accessToken, 'token');
    await storage.write<bool>(StorageKeys.darkMode, true);

    final Set<String> keys = await storage.keys();

    expect(keys, contains(StorageKeys.accessToken));
    expect(keys, contains(StorageKeys.darkMode));
  });
}
