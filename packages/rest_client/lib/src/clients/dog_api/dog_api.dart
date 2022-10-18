import 'package:dio/dio.dart';
import 'package:rest_client/src/models/dog_image/dog_image.dart';
import 'package:retrofit/retrofit.dart';

part 'dog_api.g.dart';

@RestApi()
abstract class DogApiClient {
  factory DogApiClient(Dio dio, {String baseUrl}) = _DogApiClient;

  @GET('/breeds/image/random')
  Future<DogImage> getDogImageRandom();
}
