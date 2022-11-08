import 'package:rest_client/rest_client.dart';

abstract class DogImageRandomRepository {
  /// Remote
  Future<DogImage> getDogImageRandom();
}
