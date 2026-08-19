import 'package:boilerplate/database/app_database.dart' as db;
import 'package:boilerplate/features/dog_image/data/mappers/dog_image_mapper.dart';
import 'package:boilerplate/features/dog_image/data/models/dog_image_model.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps a wire model to a domain entity, dropping transport status', () {
    const DogImageModel model = DogImageModel(
      message: 'https://dog/a.jpg',
      status: 'success',
    );

    final DogImageEntity entity = model.toEntity();

    expect(entity.imageUrl, 'https://dog/a.jpg');
    expect(entity.id, isNull);
  });

  test('maps a database row to a domain entity, carrying the id', () {
    const db.DogImage row = db.DogImage(
      id: 3,
      message: 'https://dog/b.jpg',
      status: 'success',
    );

    final DogImageEntity entity = row.toEntity();

    expect(entity.id, 3);
    expect(entity.imageUrl, 'https://dog/b.jpg');
  });

  test('maps a domain entity to an insert companion', () {
    const DogImageEntity entity = DogImageEntity(imageUrl: 'https://dog/c.jpg');

    final db.DogImagesCompanion companion = entity.toCompanion();

    expect(companion.message.value, 'https://dog/c.jpg');
    expect(companion.status.value, 'success');
  });
}
