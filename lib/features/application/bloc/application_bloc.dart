import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'application_event.dart';
part 'application_state.dart';
part 'application_bloc.freezed.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<ApplicationLoaded>(_onLoaded);
    on<ApplicationLocaleChanged>(_onLocaleChanged);
    on<ApplicationDarkModeChanged>(_onDarkModeChanged);
  }

  FutureOr<void> _onLoaded(
    ApplicationLoaded event,
    Emitter<ApplicationState> emit,
  ) {
    emit(state.copyWith(
      status: UIStatus.loading,
    ));

    emit(state.copyWith(
      status: UIStatus.loadSuccess,
      locale: 'en',
    ));
  }

  FutureOr<void> _onLocaleChanged(
    ApplicationLocaleChanged event,
    Emitter<ApplicationState> emit,
  ) async {
    if (state.locale != event.locale) {
      emit(state.copyWith(
        status: UIStatus.loading,
      ));
      await S.load(Locale(event.locale));
      emit(state.copyWith(
        status: UIStatus.loadSuccess,
        locale: event.locale,
      ));
    }
  }

  FutureOr<void> _onDarkModeChanged(
    ApplicationDarkModeChanged event,
    Emitter<ApplicationState> emit,
  ) {
    if (state.isDarkMode != event.enable) {
      emit(state.copyWith(
        isDarkMode: event.enable,
      ));
    }
  }
}
