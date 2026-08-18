import 'dart:io';

import 'package:boilerplate/core/storage/encrypted_store.dart';
import 'package:boilerplate/core/storage/storage_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  late Directory dir;
  late EncryptedStore store;

  final List<int> key = List<int>.filled(32, 7);

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('store_test');
    store = HiveEncryptedStore();
    await store.open(name: 'test_store', encryptionKey: key, path: dir.path);
  });

  tearDown(() async {
    await Hive.close();
    await dir.delete(recursive: true);
  });

  test('returns null for a key that was never written', () async {
    expect(await store.read<String>('missing'), isNull);
  });

  test('returns the default when the key is absent', () async {
    expect(
      await store.read<String>('missing', defaultValue: 'fallback'),
      'fallback',
    );
  });

  test('round-trips a value', () async {
    await store.write<String>('name', 'ada');

    expect(await store.read<String>('name'), 'ada');
  });

  test('delete removes only the named key', () async {
    await store.write<String>('a', '1');
    await store.write<String>('b', '2');

    await store.delete('a');

    expect(await store.containsKey('a'), isFalse);
    expect(await store.read<String>('b'), '2');
  });

  test('reports its keys', () async {
    await store.write<String>('a', '1');
    await store.write<String>('b', '2');

    expect(await store.keys(), <String>{'a', 'b'});
  });

  test('throws StorageNotReadyException when used before open', () async {
    final EncryptedStore unopened = HiveEncryptedStore();

    expect(
      () => unopened.read<String>('a'),
      throwsA(isA<StorageNotReadyException>()),
    );
  });
}
