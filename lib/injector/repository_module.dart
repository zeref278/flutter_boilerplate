import 'package:boilerplate/data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import 'package:boilerplate/data/repositories/dog_image_random/remote/dog_image_random_repository_impl.dart';

import 'injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<DogImageRandomRepository>(
      () => DogImageRandomRepositoryImpl(
        dogApiClient: injector(),
      ),
    );
  }
}
