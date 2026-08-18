part of 'app_bloc.dart';

@Freezed()
sealed class AppEvent with _$AppEvent {
  const factory AppEvent.loaded() = AppLoaded;

  const factory AppEvent.darkModeToggled() = AppDarkModeToggled;

  const factory AppEvent.localeChanged(String locale) = AppLocaleChanged;

  const factory AppEvent.firstUseCompleted() = AppFirstUseCompleted;
}
