part of 'dog_image_random_bloc.dart';

@Freezed()
sealed class DogImageRandomEvent with _$DogImageRandomEvent {
  const factory DogImageRandomEvent.randomRequested({
    @Default(false) bool shouldSave,
  }) = DogImageRandomRequested;
}
