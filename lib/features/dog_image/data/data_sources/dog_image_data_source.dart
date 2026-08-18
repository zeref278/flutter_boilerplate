import 'package:boilerplate/features/dog_image/data/models/dog_image_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'dog_image_data_source.g.dart';

/// Remote API access. Throws `DioException`; the repository converts it.
abstract class DogImageDataSource {
  Future<DogImageModel> getRandom();
}

@RestApi()
abstract class DogImageDataSourceRemote implements DogImageDataSource {
  factory DogImageDataSourceRemote(Dio dio, {String? baseUrl}) =
      _DogImageDataSourceRemote;

  @override
  @GET('/breeds/image/random')
  Future<DogImageModel> getRandom();
}
