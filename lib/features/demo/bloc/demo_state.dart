part of 'demo_bloc.dart';

@freezed
abstract class DemoState with _$DemoState {
  const factory DemoState({
    @Default(UIInitial()) UIStatus status,
    DemoNotification? notification,
    @Default([]) List<DogImage> images,
    @Default(false) bool isBusy,
  }) = _DemoState;
}
