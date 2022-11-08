import 'package:rest_client/rest_client.dart';
import 'dog_image_random_repository.dart';

class DogImageRandomRepositoryImpl implements DogImageRandomRepository {
  DogImageRandomRepositoryImpl({
    required DogApiClient dogApiClient,
  }) : _dogApiClient = dogApiClient;

  late final DogApiClient _dogApiClient;

  /// Remote
  @override
  Future<DogImage> getDogImageRandom() async {
    return await _dogApiClient
        .getDogImageRandom()
        .catchError(ExceptionHandler.handleException);
  }
}
