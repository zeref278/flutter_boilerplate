part of 'demo_bloc.dart';

@Freezed()
class DemoState with _$DemoState {
  const factory DemoState({
    @Default(UIStatus.initial) UIStatus status,
    DemoNotification? notification,
    @Default([]) List<DogImage> images,
    String? errorMsg,
    String? successMsg,
    @Default(false) bool isBusy,
  }) = _DemoState;
}

@Freezed(equal: false)
class DemoNotification with _$DemoNotification {
  factory DemoNotification.insertSuccess({
    required String message,
  }) = _NotificationInsertSuccess;

  factory DemoNotification.insertFailed({
    required String message,
  }) = _NotificationInsertFailed;
}
