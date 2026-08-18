import 'dart:async';

import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/delete_saved_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/get_saved_dog_images_use_case.dart';
import 'package:boilerplate/features/dog_image/presentation/bloc/dog_image_notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dog_image_saved_bloc.freezed.dart';
part 'dog_image_saved_event.dart';
part 'dog_image_saved_state.dart';

class DogImageSavedBloc extends Bloc<DogImageSavedEvent, DogImageSavedState> {
  DogImageSavedBloc(this._getSavedDogImages, this._deleteSavedDogImage)
    : super(const DogImageSavedState()) {
    on<DogImageSavedLoadRequested>(_onLoadRequested);
    on<DogImageSavedDeleteRequested>(_onDeleteRequested);
  }

  final GetSavedDogImagesUseCase _getSavedDogImages;
  final DeleteSavedDogImageUseCase _deleteSavedDogImage;

  Future<void> _onLoadRequested(
    DogImageSavedLoadRequested event,
    Emitter<DogImageSavedState> emit,
  ) async {
    emit(state.copyWith(status: const UIStatus.loading()));

    final result = await _getSavedDogImages();

    result.match(
      (failure) =>
          emit(state.copyWith(status: UIStatus.loadFailed(failure: failure))),
      (images) => emit(
        state.copyWith(status: const UIStatus.loadSuccess(), images: images),
      ),
    );
  }

  Future<void> _onDeleteRequested(
    DogImageSavedDeleteRequested event,
    Emitter<DogImageSavedState> emit,
  ) async {
    emit(state.copyWith(isBusy: true));

    final result = await _deleteSavedDogImage(event.image);

    result.match(
      (failure) => emit(
        state.copyWith(
          isBusy: false,
          notification: DogImageNotification.failed(failure: failure),
        ),
      ),
      (_) => emit(
        state.copyWith(
          isBusy: false,
          images: state.images
              .where((image) => image.id != event.image.id)
              .toList(),
        ),
      ),
    );
  }
}
