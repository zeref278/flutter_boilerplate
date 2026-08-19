import 'dart:async';

import 'package:boilerplate/app/bloc/app_bloc.dart';
import 'package:boilerplate/app/preferences/app_preferences.dart';
import 'package:boilerplate/app/preferences/stored_app_preferences.dart';
import 'package:boilerplate/core/di/di_module.dart';
import 'package:boilerplate/core/storage/app_storage.dart';
import 'package:get_it/get_it.dart';

class AppModule extends DiModule {
  const AppModule();

  @override
  FutureOr<void> register(GetIt gi) {
    gi
      ..registerLazySingleton<AppPreferences>(
        () => StoredAppPreferences(storage: gi<AppStorage>()),
      )
      // App-scoped, so a lazySingleton rather than a factory.
      ..registerLazySingleton<AppBloc>(
        () => AppBloc(gi<AppPreferences>()),
        dispose: (bloc) => bloc.close(),
      );
  }
}
