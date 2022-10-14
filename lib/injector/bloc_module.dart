import 'package:boilerplate/features/application/bloc/application_bloc.dart';
import 'package:boilerplate/features/dog_image_random/bloc/dog_image_random_bloc.dart';

import 'injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<ApplicationBloc>(() => ApplicationBloc());

    injector.registerFactory<DogImageRandomBloc>(
      () => DogImageRandomBloc(
        dogImageRandomRepository: injector(),
        logService: injector(),
      ),
    );
  }
}