import 'package:local_database/local_database.dart';
import 'package:rest_client/rest_client.dart';

abstract class DogImageRandomRepository {

  /// Remote
  Future<DogImage> getDogImageRandom();

  /// Local
  Future<void> insertDogImageDB(DogImageEntity dogImageEntity);
}