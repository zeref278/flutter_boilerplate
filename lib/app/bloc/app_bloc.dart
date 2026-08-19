import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:boilerplate/app/preferences/app_preferences.dart';
import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_notification.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._preferences) : super(const AppState()) {
    on<AppLoaded>(_onLoaded, transformer: sequential());
    on<AppDarkModeToggled>(_onDarkModeToggled, transformer: sequential());
    on<AppLocaleChanged>(_onLocaleChanged, transformer: sequential());
    on<AppFirstUseCompleted>(_onFirstUseCompleted, transformer: sequential());
  }

  final AppPreferences _preferences;

  Future<void> _onLoaded(AppLoaded event, Emitter<AppState> emit) async {
    emit(state.copyWith(status: const UIStatus.loading()));
    try {
      emit(
        state.copyWith(
          status: const UIStatus.loadSuccess(),
          isDarkMode: await _preferences.isDarkMode,
          locale: await _preferences.locale,
          isFirstUse: await _preferences.isFirstUse,
        ),
      );
    } on StorageException catch (e) {
      emit(
        state.copyWith(
          status: UIStatus.loadFailed(
            failure: CacheFailure(message: e.message),
          ),
        ),
      );
    }
  }

  Future<void> _onDarkModeToggled(
    AppDarkModeToggled event,
    Emitter<AppState> emit,
  ) async {
    final bool next = !state.isDarkMode;
    try {
      await _preferences.setIsDarkMode(darkMode: next);
      emit(state.copyWith(isDarkMode: next, notification: null));
    } on StorageException catch (e) {
      emit(state.copyWith(notification: _notificationFor(e)));
    }
  }

  Future<void> _onLocaleChanged(
    AppLocaleChanged event,
    Emitter<AppState> emit,
  ) async {
    if (state.locale == event.locale) return;
    try {
      await _preferences.setLocale(locale: event.locale);
      emit(state.copyWith(locale: event.locale, notification: null));
    } on StorageException catch (e) {
      emit(state.copyWith(notification: _notificationFor(e)));
    }
  }

  Future<void> _onFirstUseCompleted(
    AppFirstUseCompleted event,
    Emitter<AppState> emit,
  ) async {
    if (!state.isFirstUse) return;
    try {
      await _preferences.setIsFirstUse(isFirstUse: false);
      emit(state.copyWith(isFirstUse: false, notification: null));
    } on StorageException catch (e) {
      emit(state.copyWith(notification: _notificationFor(e)));
    }
  }

  AppNotification _notificationFor(StorageException exception) =>
      AppNotification.failed(failure: CacheFailure(message: exception.message));
}
