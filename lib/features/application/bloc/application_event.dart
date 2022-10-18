part of 'application_bloc.dart';

@Freezed()
class ApplicationEvent with _$ApplicationEvent {
  const factory ApplicationEvent.loaded() = ApplicationLoaded;
  const factory ApplicationEvent.localeChanged({
    required String locale,
  }) = ApplicationLocaleChanged;
  const factory ApplicationEvent.darkModeChanged({
    required bool enable,
  }) = ApplicationDarkModeChanged;
}
