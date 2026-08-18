import 'dart:async';

import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/core/di/di_module.dart';
import 'package:get_it/get_it.dart';

class AppModule extends DiModule {
  const AppModule();

  @override
  FutureOr<void> register(GetIt gi) {
    // App-scoped, so a lazySingleton rather than a factory.
    gi.registerLazySingleton<AppBloc>(() => AppBloc(gi()));
  }
}
