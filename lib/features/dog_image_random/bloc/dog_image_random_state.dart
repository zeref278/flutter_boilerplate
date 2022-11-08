part of 'dog_image_random_bloc.dart';

@Freezed()
class DogImageRandomState with _$DogImageRandomState {
  const factory DogImageRandomState({
    @Default(UIStatus.initial) UIStatus status,
    DogImageRandomNotification? notification,
    required DogImage dogImage,
    String? errorMsg,
    String? successMsg,
  }) = _DogImageRandomState;
}

@Freezed(equal: false)
class DogImageRandomNotification with _$DogImageRandomNotification {
  factory DogImageRandomNotification.notifySuccess({
    required String message,
  }) = _NotificationNotifySuccess;

  factory DogImageRandomNotification.notifyFailed({
    required String message,
  }) = _NotificationNotifyFailed;
}
