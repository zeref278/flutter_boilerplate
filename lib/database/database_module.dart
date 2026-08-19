import 'dart:async';

import 'package:boilerplate/core/di/di_module.dart';
import 'package:boilerplate/database/app_database.dart';
import 'package:get_it/get_it.dart';

/// Registers the relational store.
///
/// Separate from `CoreModule` for the same reason [AppDatabase] is separate
/// from `core`: registering it means naming it, and `core` may not.
class DatabaseModule extends DiModule {
  const DatabaseModule();

  @override
  FutureOr<void> register(GetIt gi) {
    gi.registerLazySingleton<AppDatabase>(
      AppDatabase.new,
      dispose: (database) => database.close(),
    );
  }
}
