part of 'home_bloc.dart';

@Freezed()
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(UIStatus.initial) UIStatus status,
    String? errorMessage,
    String? successMessage,
  }) = _HomeState;
}
