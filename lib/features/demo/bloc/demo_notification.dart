part of 'demo_bloc.dart';

@freezed
abstract class DemoNotification with _$DemoNotification {
  const factory DemoNotification.insertSuccess({
    required String message,
  }) = _NotificationInsertSuccess;

  const factory DemoNotification.insertFailed({
    required String message,
  }) = _NotificationInsertFailed;
}
