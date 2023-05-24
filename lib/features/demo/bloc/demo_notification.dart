part of 'demo_bloc.dart';

@Freezed(equal: false)
class DemoNotification with _$DemoNotification {
  factory DemoNotification.insertSuccess({
    required String message,
  }) = _NotificationInsertSuccess;

  factory DemoNotification.insertFailed({
    required String message,
  }) = _NotificationInsertFailed;
}
