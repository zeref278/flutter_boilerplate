import 'dart:async';

import 'package:boilerplate/core/core.dart';
import 'package:boilerplate/features/dog_image/domain/entities/dog_image_entity.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/delete_saved_dog_image_use_case.dart';
import 'package:boilerplate/features/dog_image/domain/use_cases/get_saved_dog_images_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dog_image_saved_bloc.freezed.dart';
part 'dog_image_saved_event.dart';
part 'dog_image_saved_notification.dart';
part 'dog_image_saved_state.dart';

class DogImageSavedBloc extends Bloc<DogImageSavedEvent, DogImageSavedState> {
  DogImageSavedBloc(this._getSavedDogImages, this._deleteSavedDogImage)
    : super(const DogImageSavedState()) {
    on<DogImageSavedLoadRequested>(_onLoadRequested);
    on<DogImageSavedDeleteRequested>(_onDeleteRequested);
    on<DogImageSavedDeleteConfirmed>(_onDeleteConfirmed);
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

  /// Deleting is destructive and unrecoverable, so the request only asks the
  /// UI to confirm. Nothing is deleted here, and no use case runs.
  ///
  /// Ignored while a delete is already in flight, so a second tap cannot queue
  /// a duplicate confirmation behind the first.
  void _onDeleteRequested(
    DogImageSavedDeleteRequested event,
    Emitter<DogImageSavedState> emit,
  ) {
    if (state.isBusy) return;
    emit(
      state.copyWith(
        notification: DogImageSavedNotification.confirmDelete(
          image: event.image,
        ),
      ),
    );
  }

  Future<void> _onDeleteConfirmed(
    DogImageSavedDeleteConfirmed event,
    Emitter<DogImageSavedState> emit,
  ) async {
    emit(state.copyWith(isBusy: true));

    final result = await _deleteSavedDogImage(event.image);

    result.match(
      (failure) => emit(
        state.copyWith(
          isBusy: false,
          notification: DogImageSavedNotification.failed(failure: failure),
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
