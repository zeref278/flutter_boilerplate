import 'package:boilerplate/database/app_database.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;

  setUp(() => database = AppDatabase(NativeDatabase.memory()));
  tearDown(() => database.close());

  test('starts with no saved dog images', () async {
    expect(await database.select(database.dogImages).get(), isEmpty);
  });

  test('returns the saved dog image after insert', () async {
    await database
        .into(database.dogImages)
        .insert(
          DogImagesCompanion.insert(
            message: 'https://dog/a.jpg',
            status: 'success',
          ),
        );

    final List<DogImage> rows = await database.select(database.dogImages).get();

    expect(rows, hasLength(1));
    expect(rows.single.message, 'https://dog/a.jpg');
  });

  test('saves the same image url twice without throwing', () async {
    for (int i = 0; i < 2; i++) {
      await database
          .into(database.dogImages)
          .insert(
            DogImagesCompanion.insert(
              message: 'https://dog/a.jpg',
              status: 'success',
            ),
          );
    }

    expect(await database.select(database.dogImages).get(), hasLength(2));
  });

  test('assigns distinct auto-increment ids', () async {
    await database
        .into(database.dogImages)
        .insert(DogImagesCompanion.insert(message: 'a', status: 'success'));
    await database
        .into(database.dogImages)
        .insert(DogImagesCompanion.insert(message: 'b', status: 'success'));

    final List<DogImage> rows = await database.select(database.dogImages).get();

    expect(rows.map((row) => row.id).toSet(), hasLength(2));
  });
}
