part of 'demo_bloc.dart';

@Freezed()
class DemoState with _$DemoState {
  const factory DemoState({
    @Default(UIStatus.initial) UIStatus status,
    @Default([]) List<DogImage> images,
    String? errorMsg,
    String? successMsg,
    @Default(false) bool isBusy,
  }) = _DemoState;
}
