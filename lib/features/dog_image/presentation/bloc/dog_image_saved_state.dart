part of 'dog_image_saved_bloc.dart';

@Freezed()
abstract class DogImageSavedState with _$DogImageSavedState {
  const factory DogImageSavedState({
    @Default(UIStatus.initial()) UIStatus status,
    @Default(<DogImageEntity>[]) List<DogImageEntity> images,
    @Default(false) bool isBusy,
    DogImageNotification? notification,
  }) = _DogImageSavedState;
}
