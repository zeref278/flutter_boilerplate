import 'package:rest_client/rest_client.dart';
import 'package:rest_client/src/models/dog_image/dog_image.dart';

import 'dog_image_random_repository.dart';

class DogImageRandomRepositoryImpl implements DogImageRandomRepository {
  DogImageRandomRepositoryImpl({
    required DogApiClient dogApiClient,
  }) : _dogApiClient = dogApiClient;

  late final DogApiClient _dogApiClient;

  @override
  Future<DogImage> getDogImageRandom() async {
    return await _dogApiClient
        .getDogImageRandom()
        .catchError(ExceptionHandler.handleException);
  }
}
