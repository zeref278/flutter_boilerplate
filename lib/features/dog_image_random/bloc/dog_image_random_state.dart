part of 'dog_image_random_bloc.dart';

@freezed
abstract class DogImageRandomState with _$DogImageRandomState {
  const factory DogImageRandomState({
    @Default(UIInitial()) UIStatus status,
    DogImageRandomNotification? notification,
    @Default(DogImage(message: '', status: '')) DogImage dogImage,
    @Default(false) bool isBusy,
  }) = _DogImageRandomState;
}
