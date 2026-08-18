part of 'dog_image_saved_bloc.dart';

@Freezed()
sealed class DogImageSavedEvent with _$DogImageSavedEvent {
  const factory DogImageSavedEvent.loadRequested() = DogImageSavedLoadRequested;

  const factory DogImageSavedEvent.deleteRequested(DogImageEntity image) =
      DogImageSavedDeleteRequested;
}
