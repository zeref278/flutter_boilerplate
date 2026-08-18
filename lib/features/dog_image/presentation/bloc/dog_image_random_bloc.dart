import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/get_random_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/save_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/presentation/bloc/dog_image_notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dog_image_random_bloc.freezed.dart';
part 'dog_image_random_event.dart';
part 'dog_image_random_state.dart';

class DogImageRandomBloc
    extends Bloc<DogImageRandomEvent, DogImageRandomState> {
  DogImageRandomBloc(this._getRandomDogImage, this._saveDogImage)
    : super(const DogImageRandomState()) {
    on<DogImageRandomRequested>(_onRandomRequested, transformer: droppable());
  }

  final GetRandomDogImageUseCase _getRandomDogImage;
  final SaveDogImageUseCase _saveDogImage;

  Future<void> _onRandomRequested(
    DogImageRandomRequested event,
    Emitter<DogImageRandomState> emit,
  ) async {
    emit(state.copyWith(isBusy: true));

    final result = await _getRandomDogImage();

    await result.match(
      (failure) async => emit(
        state.copyWith(
          isBusy: false,
          notification: DogImageNotification.failed(failure: failure),
        ),
      ),
      (image) async {
        if (event.saveToDb) {
          final saved = await _saveDogImage(image);
          saved.match(
            (failure) => emit(
              state.copyWith(
                notification: DogImageNotification.failed(failure: failure),
              ),
            ),
            (_) {},
          );
        }
        emit(
          state.copyWith(
            isBusy: false,
            status: const UIStatus.loadSuccess(),
            dogImage: image,
          ),
        );
      },
    );
  }
}
