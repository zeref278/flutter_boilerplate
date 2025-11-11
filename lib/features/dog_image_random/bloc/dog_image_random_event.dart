part of 'dog_image_random_bloc.dart';

@freezed
abstract class DogImageRandomEvent with _$DogImageRandomEvent {
  const factory DogImageRandomEvent.loaded() = _Loaded;
  const factory DogImageRandomEvent.randomRequested({
    @Default(false) bool insertDb,
  }) = _RandomRequested;
}
