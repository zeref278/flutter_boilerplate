part of 'app_bloc.dart';

@Freezed()
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(UIStatus.initial()) UIStatus status,
    @Default(AppConfig.defaultLocale) String locale,
    @Default(false) bool isDarkMode,
    @Default(true) bool isFirstUse,
  }) = _AppState;
}
