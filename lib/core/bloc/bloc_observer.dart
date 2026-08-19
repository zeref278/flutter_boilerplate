import 'package:flutter_bloc/flutter_bloc.dart';

/// Logs bloc lifecycle and, importantly, forwards bloc errors.
///
/// Without `onError` an exception thrown inside a bloc handler disappears
/// silently.
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver({required this.onInfo, required this.onFailure});

  final void Function(String message) onInfo;
  final void Function(String message, Object error, StackTrace stackTrace)
  onFailure;

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    onInfo('BLoC created: ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    onInfo('Event: ${event.runtimeType}');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    onFailure('BLoC error in ${bloc.runtimeType}', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
