import 'dart:io';

import 'package:boilerplate/core/storage/app_storage.dart';
import 'package:boilerplate/core/storage/app_storage_impl.dart';
import 'package:boilerplate/core/storage/encrypted_store.dart';
import 'package:boilerplate/core/storage/keychain.dart';
import 'package:boilerplate/core/storage/storage_exception.dart';
import 'package:boilerplate/core/storage/storage_keys.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FakeKeychain implements Keychain {
  final Map<String, String> values = <String, String>{};

  PlatformException? readException;
  PlatformException? writeException;
  PlatformException? deleteException;
  PlatformException? deleteAllException;
  PlatformException? containsKeyException;
  PlatformException? readAllException;

  @override
  Future<String?> read(String key) async {
    final PlatformException? exception = readException;
    if (exception != null) throw exception;
    return values[key];
  }

  @override
  Future<void> write(String key, String value) async {
    final PlatformException? exception = writeException;
    if (exception != null) throw exception;
    values[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    final PlatformException? exception = deleteException;
    if (exception != null) throw exception;
    values.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    final PlatformException? exception = deleteAllException;
    if (exception != null) throw exception;
    values.clear();
  }

  @override
  Future<bool> containsKey(String key) async {
    final PlatformException? exception = containsKeyException;
    if (exception != null) throw exception;
    return values.containsKey(key);
  }

  @override
  Future<Map<String, String>> readAll() async {
    final PlatformException? exception = readAllException;
    if (exception != null) throw exception;
    return Map<String, String>.from(values);
  }
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

  test(
    'regenerates a malformed AES key and recreates the cached store',
    () async {
      await storage.write<bool>(StorageKeys.darkMode, true);
      final String oldKey = keychain.values[StorageKeys.boxEncryptionKey]!;
      keychain.values[StorageKeys.boxEncryptionKey] = 'not-a-valid-aes-key';

      await Hive.close();
      store = HiveEncryptedStore();
      storage = AppStorageImpl(store, keychain);
      await storage.init(boxName: 'app_store', path: dir.path);

      expect(keychain.values[StorageKeys.boxEncryptionKey], isNot(oldKey));
      expect(await storage.read<bool>(StorageKeys.darkMode), isNull);
    },
  );

  test(
    'regenerates an unreadable AES key and recreates the cached store',
    () async {
      await storage.write<bool>(StorageKeys.darkMode, true);
      final String oldKey = keychain.values[StorageKeys.boxEncryptionKey]!;
      keychain.readException = PlatformException(code: 'key-unreadable');

      await Hive.close();
      store = HiveEncryptedStore();
      storage = AppStorageImpl(store, keychain);
      await storage.init(boxName: 'app_store', path: dir.path);

      expect(keychain.values[StorageKeys.boxEncryptionKey], isNot(oldKey));
      expect(await storage.read<bool>(StorageKeys.darkMode), isNull);
    },
  );

  test('wipes surviving secrets when a fresh install starts', () async {
    await Hive.close();
    store = HiveEncryptedStore();
    keychain = FakeKeychain()..values[StorageKeys.accessToken] = 'stale-token';
    storage = AppStorageImpl(store, keychain);

    await storage.init(boxName: 'fresh_install', path: dir.path);

    expect(keychain.values.containsKey(StorageKeys.accessToken), isFalse);
    expect(await store.read<bool>(StorageKeys.hasLaunchedBefore), isTrue);
  });

  test('leaves the marker unset when surviving-secret wiping fails', () async {
    await Hive.close();
    store = HiveEncryptedStore();
    keychain = FakeKeychain()
      ..values[StorageKeys.accessToken] = 'stale-token'
      ..deleteAllException = PlatformException(code: 'wipe-failed');
    storage = AppStorageImpl(store, keychain);

    await storage.init(boxName: 'failed_wipe', path: dir.path);

    expect(keychain.values[StorageKeys.accessToken], 'stale-token');
    expect(await store.read<bool>(StorageKeys.hasLaunchedBefore), isNull);
  });

  test(
    'maps a secret keychain write failure to StorageWriteException',
    () async {
      keychain.writeException = PlatformException(code: 'write-failed');

      await expectLater(
        storage.write<String>(StorageKeys.accessToken, 'token'),
        throwsA(isA<StorageWriteException>()),
      );
    },
  );

  test('returns the default when a secret keychain read fails', () async {
    keychain.readException = PlatformException(code: 'read-failed');

    expect(
      await storage.read<String>(
        StorageKeys.accessToken,
        defaultValue: 'logged-out',
      ),
      'logged-out',
    );
  });

  test(
    'maps a secret keychain delete failure to StorageDeleteException',
    () async {
      keychain.deleteException = PlatformException(code: 'delete-failed');

      await expectLater(
        storage.delete(StorageKeys.accessToken),
        throwsA(isA<StorageDeleteException>()),
      );
    },
  );

  test('maps a keychain clear failure to StorageClearException', () async {
    keychain.deleteAllException = PlatformException(code: 'clear-failed');

    await expectLater(storage.clear(), throwsA(isA<StorageClearException>()));
  });

  test(
    'maps a secret keychain contains failure to StorageReadException',
    () async {
      keychain.containsKeyException = PlatformException(
        code: 'contains-failed',
      );

      await expectLater(
        storage.containsKey(StorageKeys.accessToken),
        throwsA(isA<StorageReadException>()),
      );
    },
  );

  test('maps a keychain key-list failure to StorageReadException', () async {
    keychain.readAllException = PlatformException(code: 'keys-failed');

    await expectLater(storage.keys(), throwsA(isA<StorageReadException>()));
  });
}
