part of 'application_bloc.dart';

@Freezed()
class ApplicationState with _$ApplicationState {
  const factory ApplicationState({
    @Default(UIStatus.loading) UIStatus status,
    @Default('en') String locale,
    @Default(false) bool isDarkMode,
  }) = _ApplicationState;
}

enum UIStatus {
  initial,
  loading,
  loadSuccess,
  loadFailed,
}
