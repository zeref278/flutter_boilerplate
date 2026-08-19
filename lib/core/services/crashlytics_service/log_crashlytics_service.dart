import 'package:boilerplate/core/services/crashlytics_service/crashlytics_service.dart';
import 'package:boilerplate/core/services/log_service/log_service.dart';

/// Default implementation: forwards crashes to the logger.
///
/// Swap for a Firebase-backed implementation in CoreModule when a crash
/// reporting backend is added. Deliberately never throws.
class LogCrashlyticsService implements CrashlyticsService {
  const LogCrashlyticsService(this._logService);

  final LogService _logService;

  @override
  Future<void> recordException(Object exception, StackTrace? stackTrace) async {
    _logService.e('Uncaught exception', exception, stackTrace);
  }
}
