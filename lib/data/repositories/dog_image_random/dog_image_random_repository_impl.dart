import 'package:local_database/local_database.dart';
import 'package:local_database/src/entities/dog_image_entity.dart';
import 'package:rest_client/rest_client.dart';
import 'package:rest_client/src/models/dog_image/dog_image.dart';

import 'dog_image_random_repository.dart';

class DogImageRandomRepositoryImpl implements DogImageRandomRepository {
  DogImageRandomRepositoryImpl({
    required DogApiClient dogApiClient,
    required AppDatabaseManager appDatabaseManager,
  }) : _dogApiClient = dogApiClient,
        _appDatabaseManager = appDatabaseManager;

  late final DogApiClient _dogApiClient;
  late final AppDatabaseManager _appDatabaseManager;


  /// Remote
  @override
  Future<DogImage> getDogImageRandom() async {
    return await _dogApiClient
        .getDogImageRandom()
        .catchError(ExceptionHandler.handleException);
  }

  /// Local
  @override
  Future<void> insertDogImageDB(DogImageEntity dogImageEntity) async {
    final DogImageDao dao = await _appDatabaseManager.dogImageDao;
    await dao.insertDogImage(dogImageEntity);
  }
}
