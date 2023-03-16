part of 'dog_image_random_bloc.dart';

@Freezed(equal: false)
class DogImageRandomNotification with _$DogImageRandomNotification {
  factory DogImageRandomNotification.notifySuccess({
    required String message,
  }) = _NotificationNotifySuccess;

  factory DogImageRandomNotification.notifyFailed({
    required String message,
  }) = _NotificationNotifyFailed;
}
