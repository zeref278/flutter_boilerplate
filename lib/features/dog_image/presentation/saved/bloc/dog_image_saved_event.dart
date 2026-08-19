part of 'dog_image_saved_bloc.dart';

@Freezed()
sealed class DogImageSavedEvent with _$DogImageSavedEvent {
  const factory DogImageSavedEvent.loadRequested() = DogImageSavedLoadRequested;

  /// The user asked to delete. Nothing is deleted yet — the bloc asks the UI
  /// to confirm first.
  const factory DogImageSavedEvent.deleteRequested(DogImageEntity image) =
      DogImageSavedDeleteRequested;

  /// The user confirmed the dialog. This is the event that actually deletes.
  const factory DogImageSavedEvent.deleteConfirmed(DogImageEntity image) =
      DogImageSavedDeleteConfirmed;
}
