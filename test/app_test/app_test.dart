import 'package:boilerplate/data/repositories/dog_image_random/local/dog_image_local_repository.dart';
import 'package:boilerplate/data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import 'package:boilerplate/services/log_service/log_service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  DogImageRandomRepository,
  DogImageLocalRepository,
  LogService,

  /// TODO
])
void main() {}
