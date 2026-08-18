import 'dart:io';

import 'package:boilerplate/core/storage/hive_storage.dart';
import 'package:boilerplate/core/storage/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  late Directory dir;
  late LocalStorage storage;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('hive_test');
    storage = HiveStorage();
    await storage.init(boxName: 'test_box', testPath: dir.path);
  });

  tearDown(() async {
    await Hive.close();
    await dir.delete(recursive: true);
  });

  test('returns null for a key that was never written', () async {
    expect(await storage.getData<String>('missing'), isNull);
  });

  test('returns the default value when the key is absent', () async {
    expect(
      await storage.getData<String>('missing', defaultValue: 'fallback'),
      'fallback',
    );
  });

  test('round-trips a string value', () async {
    await storage.saveData<String>('name', 'ada');

    expect(await storage.getData<String>('name'), 'ada');
  });

  test('round-trips an object through the JSON helpers', () async {
    await storage.saveObject<Map<String, dynamic>>('user', <String, dynamic>{
      'id': 7,
    });

    final Map<String, dynamic>? result = await storage.getObject(
      'user',
      (json) => json,
    );

    expect(result?['id'], 7);
  });

  test('removeData deletes only the named key', () async {
    await storage.saveData<String>('a', '1');
    await storage.saveData<String>('b', '2');

    await storage.removeData('a');

    expect(await storage.containsKey('a'), isFalse);
    expect(await storage.getData<String>('b'), '2');
  });

  test('reports size and keys', () async {
    await storage.saveData<String>('a', '1');
    await storage.saveData<String>('b', '2');

    expect(await storage.getSize(), 2);
    expect(await storage.getAllKeys(), containsAll(<String>['a', 'b']));
  });
}
