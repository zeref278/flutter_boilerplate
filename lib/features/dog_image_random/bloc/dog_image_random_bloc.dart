import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:boilerplate/core/bloc_core/ui_status.dart';
import 'package:boilerplate/data/repositories/dog_image_random/local/dog_image_local_repository.dart';
import 'package:boilerplate/data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import 'package:boilerplate/services/log_service/log_service.dart';
import 'package:boilerplate/utils/mapper_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_database/local_database.dart';
import 'package:rest_client/rest_client.dart';

part 'dog_image_random_event.dart';
part 'dog_image_random_state.dart';
part 'dog_image_random_notification.dart';
part 'dog_image_random_bloc.freezed.dart';

class DogImageRandomBloc
    extends Bloc<DogImageRandomEvent, DogImageRandomState> {
  DogImageRandomBloc({
    required DogImageRandomRepository dogImageRandomRepository,
    required LogService logService,
    DogImageLocalRepository? dogImageLocalRepository,
  }) : super(
          const DogImageRandomState(),
        ) {
    _repository = dogImageRandomRepository;
    _localRepository = dogImageLocalRepository;
    _log = logService;
    on<_Loaded>(_onLoaded);
    on<_RandomRequested>(_onRandom, transformer: droppable());
  }

  late final DogImageRandomRepository _repository;
  late final DogImageLocalRepository? _localRepository;
  late final LogService _log;

  FutureOr<void> _onLoaded(
    _Loaded event,
    Emitter<DogImageRandomState> emit,
  ) {
    try {
      emit(
        state.copyWith(
          status: const UILoading(),
        ),
      );

      emit(
        state.copyWith(
          status: const UILoadSuccess(),
        ),
      );
    } catch (e, s) {
      _log.e('DogImageRandomLoaded failed', e, s);
      emit(
        state.copyWith(
          status: UILoadFailed(message: e.toString()),
        ),
      );
    }
  }

  FutureOr<void> _onRandom(
    _RandomRequested event,
    Emitter<DogImageRandomState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isBusy: true,
        ),
      );

      final DogImage image = await _repository.getDogImageRandom();

      if (event.insertDb && !kIsWeb && _localRepository != null) {
        final DogImageEntity entity = MapperUtils.mapDogImage(image);
        await _localRepository!.insertDogImageDB(entity);
      }

      emit(
        state.copyWith(
          isBusy: false,
          status: const UILoadSuccess(),
          dogImage: image,
        ),
      );
    } catch (e, s) {
      _log.e('DogImageRandomLoaded failed', e, s);
      emit(
        state.copyWith(
          isBusy: false,
          notification: _NotificationNotifyFailed(
            message: e.toString(),
          ),
        ),
      );
    }
  }
}
