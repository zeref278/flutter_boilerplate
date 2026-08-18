import 'dart:async';

import 'package:boilerplate/app/preferences/app_preferences.dart';
import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/storage/storage_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._preferences) : super(const AppState()) {
    on<AppLoaded>(_onLoaded);
    on<AppDarkModeToggled>(_onDarkModeToggled);
    on<AppLocaleChanged>(_onLocaleChanged);
    on<AppFirstUseCompleted>(_onFirstUseCompleted);
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
    await _preferences.setIsDarkMode(darkMode: next);
    emit(state.copyWith(isDarkMode: next));
  }

  Future<void> _onLocaleChanged(
    AppLocaleChanged event,
    Emitter<AppState> emit,
  ) async {
    if (state.locale == event.locale) return;
    await _preferences.setLocale(locale: event.locale);
    emit(state.copyWith(locale: event.locale));
  }

  Future<void> _onFirstUseCompleted(
    AppFirstUseCompleted event,
    Emitter<AppState> emit,
  ) async {
    if (!state.isFirstUse) return;
    await _preferences.setIsFirstUse(isFirstUse: false);
    emit(state.copyWith(isFirstUse: false));
  }
}
