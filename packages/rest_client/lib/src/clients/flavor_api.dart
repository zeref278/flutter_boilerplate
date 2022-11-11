import 'package:dio/dio.dart';
import 'package:rest_client/src/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'flavor_api.g.dart';

@RestApi()
abstract class FlavorApiClient {
  factory FlavorApiClient(Dio dio, {String? baseUrl}) = _FlavorApiClient;

  @GET('/flavor')
  Future<FlavorModel> getFlavor();
}
