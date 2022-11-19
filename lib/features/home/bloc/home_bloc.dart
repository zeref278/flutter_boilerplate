import 'dart:async';

import 'package:boilerplate/data/repositories/flavor_repository/flavor_repository.dart';
import 'package:boilerplate/features/application/bloc/application_bloc.dart';
import 'package:boilerplate/services/log_service/log_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required FlavorRepository flavorRepository,
    required LogService logService,
  }) : super(const HomeState()) {
    _flavorRepository = flavorRepository;
    _logService = logService;
    on<HomeLoaded>(_onLoaded);
  }

  late final FlavorRepository _flavorRepository;
  late final LogService _logService;

  FutureOr<void> _onLoaded(
    HomeLoaded event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: UIStatus.loading,
      ));

      final String flavor = await _flavorRepository.getFlavor();

      emit(state.copyWith(
        status: UIStatus.loadSuccess,
        successMessage: flavor,
      ));
    } catch (e, s) {
      _logService.e('HomeLoaded failed', e, s);
      emit(state.copyWith(
        status: UIStatus.loadFailed,
        errorMessage: e.toString(),
      ));
    }
  }
}
