import 'package:boilerplate/features/dog_image/data/models/dog_image_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'dog_image_remote_data_source.g.dart';

/// Remote API access. Throws `DioException`; the repository converts it.
abstract class DogImageRemoteDataSource {
  Future<DogImageModel> getRandom();
}

@RestApi()
abstract class DogImageRemoteDataSourceImpl
    implements DogImageRemoteDataSource {
  factory DogImageRemoteDataSourceImpl(Dio dio, {String? baseUrl}) =
      _DogImageRemoteDataSourceImpl;

  @override
  @GET('/breeds/image/random')
  Future<DogImageModel> getRandom();
}
