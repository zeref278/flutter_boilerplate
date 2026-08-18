import 'package:boilerplate/core/errors/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dog_image_notification.freezed.dart';

/// One-shot UI notifications (snackbars).
///
/// `equal: false` gives identity equality, so two consecutive identical
/// messages are distinct objects and a `listenWhen` comparison fires for both.
/// With value equality the second would be silently swallowed.
@Freezed(equal: false)
sealed class DogImageNotification with _$DogImageNotification {
  factory DogImageNotification.succeeded({required String message}) =
      DogImageNotificationSucceeded;

  factory DogImageNotification.failed({required Failure failure}) =
      DogImageNotificationFailed;
}
