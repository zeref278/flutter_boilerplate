import 'dart:async';

import 'package:boilerplate/core/core.dart';
import 'package:boilerplate/database/app_database.dart';
import 'package:boilerplate/features/dog_image/data/data_sources/dog_image_local_data_source.dart';
import 'package:boilerplate/features/dog_image/data/data_sources/dog_image_remote_data_source.dart';
import 'package:boilerplate/features/dog_image/data/repositories/dog_image_repository_impl.dart';
import 'package:boilerplate/features/dog_image/domain/repositories/dog_image_repository.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/delete_saved_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/get_random_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/get_saved_dog_images_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/save_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/presentation/random/bloc/dog_image_random_bloc.dart';
import 'package:boilerplate/features/dog_image/presentation/saved/bloc/dog_image_saved_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DogImageModule extends DiModule {
  const DogImageModule();

  @override
  FutureOr<void> register(GetIt gi) {
    gi
      ..registerLazySingleton<DogImageRemoteDataSource>(
        () => DogImageRemoteDataSourceImpl(gi<Dio>()),
      )
      ..registerLazySingleton<DogImageLocalDataSource>(
        () => DogImageLocalDataSourceImpl(gi<AppDatabase>()),
      )
      // Repositories are lazySingleton, not factory: a stateless repository
      // rebuilt on every injection is pure waste, and it matters once
      // caching lands.
      ..registerLazySingleton<DogImageRepository>(
        () => DogImageRepositoryImpl(
          gi<DogImageRemoteDataSource>(),
          gi<DogImageLocalDataSource>(),
        ),
      )
      ..registerFactory(() => GetRandomDogImageUseCase(gi()))
      ..registerFactory(() => SaveDogImageUseCase(gi()))
      ..registerFactory(() => GetSavedDogImagesUseCase(gi()))
      ..registerFactory(() => DeleteSavedDogImageUseCase(gi()))
      // Blocs are factories: BlocProvider owns and closes each instance.
      ..registerFactory(() => DogImageRandomBloc(gi(), gi()))
      ..registerFactory(() => DogImageSavedBloc(gi(), gi()));
  }
}
