import 'dart:async';

import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/bloc/ui_status.dart';
import 'package:boilerplate/core/errors/failures.dart';
import 'package:boilerplate/core/services/app_service/app_service.dart';
import 'package:boilerplate/core/storage/storage_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._appService) : super(const AppState()) {
    on<AppLoaded>(_onLoaded);
    on<AppDarkModeToggled>(_onDarkModeToggled);
    on<AppLocaleChanged>(_onLocaleChanged);
    on<AppFirstUseCompleted>(_onFirstUseCompleted);
  }

  final AppService _appService;

  Future<void> _onLoaded(AppLoaded event, Emitter<AppState> emit) async {
    emit(state.copyWith(status: const UIStatus.loading()));
    try {
      emit(
        state.copyWith(
          status: const UIStatus.loadSuccess(),
          isDarkMode: await _appService.isDarkMode,
          locale: await _appService.locale,
          isFirstUse: await _appService.isFirstUse,
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
    await _appService.setIsDarkMode(darkMode: next);
    emit(state.copyWith(isDarkMode: next));
  }

  Future<void> _onLocaleChanged(
    AppLocaleChanged event,
    Emitter<AppState> emit,
  ) async {
    if (state.locale == event.locale) return;
    await _appService.setLocale(locale: event.locale);
    emit(state.copyWith(locale: event.locale));
  }

  Future<void> _onFirstUseCompleted(
    AppFirstUseCompleted event,
    Emitter<AppState> emit,
  ) async {
    if (!state.isFirstUse) return;
    await _appService.setIsFirstUse(isFirstUse: false);
    emit(state.copyWith(isFirstUse: false));
  }
}
