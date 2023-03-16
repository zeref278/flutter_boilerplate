import 'package:boilerplate/features/application/bloc/application_bloc.dart';
import 'package:boilerplate/features/demo/bloc/demo_bloc.dart';
import 'package:boilerplate/features/dog_image_random/bloc/dog_image_random_bloc.dart';
import 'package:flutter/foundation.dart';

import 'injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingleton<ApplicationBloc>(
        ApplicationBloc(localStorageService: injector()));

    injector.registerFactory<DogImageRandomBloc>(
      () => DogImageRandomBloc(
        dogImageRandomRepository: injector(),
        dogImageLocalRepository: kIsWeb ? null : injector(),
        logService: injector(),
      ),
    );

    injector.registerFactory<DemoBloc>(
      () => DemoBloc(
        dogImageRandomRepository: injector(),
        logService: injector(),
      ),
    );
  }
}
