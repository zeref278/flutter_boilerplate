import 'package:boilerplate/core/storage/database/app_database.dart' as db;
import 'package:boilerplate/features/dog_image/data/models/dog_image_model.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image.dart';

/// Every conversion between transport, storage and domain shapes lives here.
extension DogImageModelX on DogImageModel {
  DogImage toEntity() => DogImage(imageUrl: message);
}

extension DogImageRowX on db.DogImage {
  DogImage toEntity() => DogImage(id: id, imageUrl: message);
}

extension DogImageEntityX on DogImage {
  /// `status` is transport metadata the domain does not model; the stored
  /// value is a constant so the column stays non-null.
  db.DogImagesCompanion toCompanion() =>
      db.DogImagesCompanion.insert(message: imageUrl, status: 'success');
}
