part of 'demo_bloc.dart';

@Freezed()
class DemoState with _$DemoState {
  const factory DemoState({
    @Default(Initial()) UIStatus status,
    DemoNotification? notification,
    @Default([]) List<DogImage> images,
    @Default(false) bool isBusy,
  }) = _DemoState;
}
