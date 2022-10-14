part of 'dog_image_random_bloc.dart';

@Freezed()
class DogImageRandomState with _$DogImageRandomState {
  const factory DogImageRandomState({
    @Default(UIStatus.initial) UIStatus status,
    required DogImage dogImage,
    String? errorMsg,
    String? successMsg,
  }) = _DogImageRandomState;
}
