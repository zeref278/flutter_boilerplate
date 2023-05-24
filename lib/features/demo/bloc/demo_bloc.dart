import 'dart:async';
import 'package:boilerplate/core/bloc_core/ui_status.dart';
import 'package:boilerplate/data/repositories/dog_image_random/local/dog_image_local_repository.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:boilerplate/services/log_service/log_service.dart';
import 'package:boilerplate/utils/mapper_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_database/local_database.dart';
import 'package:rest_client/rest_client.dart';

part 'demo_event.dart';
part 'demo_state.dart';
part 'demo_bloc.freezed.dart';
part 'demo_notification.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc({
    required LogService logService,
    required DogImageLocalRepository dogImageRandomRepository,
  }) : super(const DemoState()) {
    _repository = dogImageRandomRepository;
    _logService = logService;
    on<_LoadImageFromDB>(_onImagesLoadFromDB);
    on<_DeleteImageFromDB>(_onDeleteImageFromDB);
  }

  late final DogImageLocalRepository _repository;
  late final LogService _logService;

  FutureOr<void> _onImagesLoadFromDB(
    _LoadImageFromDB event,
    Emitter<DemoState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: const UILoading(),
        ),
      );

      final List<DogImageEntity> imageEntities =
          await _repository.getDogImagesFromDB();

      final List<DogImage> images =
          imageEntities.map(MapperUtils.mapDogImageEntity).toList();

      emit(
        state.copyWith(
          status: const UILoadSuccess(),
          images: images,
        ),
      );
    } catch (e, s) {
      _logService.e('DemoLoadImageFromDB failed', e, s);
      emit(
        state.copyWith(
          status: UILoadFailed(message: e.toString()),
        ),
      );
    }
  }

  FutureOr<void> _onDeleteImageFromDB(
    _DeleteImageFromDB event,
    Emitter<DemoState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isBusy: true,
        ),
      );

      await _repository
          .deleteDogImageDB(MapperUtils.mapDogImage(event.dogImage));

      final List<DogImage> images = List.from(state.images)
        ..removeWhere((element) => element.message == event.dogImage.message);

      emit(
        state.copyWith(
          notification:
              _NotificationInsertSuccess(message: S.current.delete_success),
          images: images,
          isBusy: false,
        ),
      );
    } catch (e, s) {
      _logService.e('DemoLoadImageFromDB failed', e, s);
      emit(
        state.copyWith(
          notification: _NotificationInsertFailed(message: e.toString()),
          isBusy: false,
        ),
      );
    }
  }
}
