import 'package:local_database/local_database.dart';

abstract class DogImageLocalRepository {
  /// Local
  Future<void> insertDogImageDB(DogImageEntity dogImageEntity);

  Future<List<DogImageEntity>> getDogImagesFromDB();

  Future<DogImageEntity?> deleteDogImageDB(String message);
}
