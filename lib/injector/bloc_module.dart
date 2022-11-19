import 'package:boilerplate/features/application/bloc/application_bloc.dart';
import 'package:boilerplate/features/home/bloc/home_bloc.dart';
import 'injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingleton<ApplicationBloc>(
      ApplicationBloc(
        localStorageService: injector(),
      ),
    );

    injector.registerFactory<HomeBloc>(
      () => HomeBloc(
        flavorRepository: injector(),
        logService: injector(),
      ),
    );
  }
}
