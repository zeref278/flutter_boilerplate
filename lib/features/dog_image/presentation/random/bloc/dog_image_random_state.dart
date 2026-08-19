part of 'dog_image_random_bloc.dart';

@Freezed()
abstract class DogImageRandomState with _$DogImageRandomState {
  const factory DogImageRandomState({
    @Default(UIStatus.initial()) UIStatus status,
    DogImageEntity? dogImage,
    @Default(false) bool isBusy,
    DogImageRandomNotification? notification,
  }) = _DogImageRandomState;
}
