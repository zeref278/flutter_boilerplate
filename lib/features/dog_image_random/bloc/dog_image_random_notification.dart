part of 'dog_image_random_bloc.dart';

@freezed
abstract class DogImageRandomNotification with _$DogImageRandomNotification {
  const factory DogImageRandomNotification.notifySuccess({
    required String message,
  }) = _NotificationNotifySuccess;

  const factory DogImageRandomNotification.notifyFailed({
    required String message,
  }) = _NotificationNotifyFailed;
}
