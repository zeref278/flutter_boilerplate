import 'package:boilerplate/core/exceptions/api_exception.dart';
import 'package:boilerplate/data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import 'package:rest_client/rest_client.dart';

class DogImageRandomRepositoryImpl implements DogImageRandomRepository {
  DogImageRandomRepositoryImpl({
    required DogApiClient dogApiClient,
  }) : _dogApiClient = dogApiClient;

  late final DogApiClient _dogApiClient;

  /// Remote
  @override
  Future<DogImage> getDogImageRandom() async {
    return _dogApiClient.getDogImageRandom().onApiError;
  }
}
