import 'dart:async';

import 'package:boilerplate/core/bloc_core/ui_status.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:boilerplate/services/local_storage_service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_event.dart';
part 'application_state.dart';
part 'application_bloc.freezed.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc({
    required LocalStorageService localStorageService,
  }) : super(const ApplicationState()) {
    _localStorageService = localStorageService;
    on<ApplicationLoaded>(_onLoaded);
    on<ApplicationLocaleChanged>(_onLocaleChanged);
    on<ApplicationDarkModeChanged>(_onDarkModeChanged);
  }

  late LocalStorageService _localStorageService;

  FutureOr<void> _onLoaded(
    ApplicationLoaded event,
    Emitter<ApplicationState> emit,
  ) {
    emit(state.copyWith(
      status: const Loading(),
    ));

    final String locale = _localStorageService.locale;
    final bool isDarkMode = _localStorageService.isDarkMode;

    emit(state.copyWith(
      status: const LoadSuccess(),
      locale: locale,
      isDarkMode: isDarkMode,
    ));
  }

  FutureOr<void> _onLocaleChanged(
    ApplicationLocaleChanged event,
    Emitter<ApplicationState> emit,
  ) async {
    if (state.locale != event.locale) {
      emit(state.copyWith(
        status: const Loading(),
      ));
      await S.load(Locale(event.locale));

      _localStorageService.setLocale(event.locale);

      emit(state.copyWith(
        status: const LoadSuccess(),
        locale: event.locale,
      ));
    }
  }

  FutureOr<void> _onDarkModeChanged(
    ApplicationDarkModeChanged event,
    Emitter<ApplicationState> emit,
  ) async {
    if (state.isDarkMode != event.enable) {
      emit(state.copyWith(
        status: const Loading(),
      ));

      _localStorageService.setIsDarkMode(event.enable);

      emit(state.copyWith(
        status: const LoadSuccess(),
        isDarkMode: event.enable,
      ));
    }
  }
}
