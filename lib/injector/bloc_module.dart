import 'package:boilerplate/features/application/bloc/application_bloc.dart';
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
  }
}
