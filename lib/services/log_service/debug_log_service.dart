import 'package:boilerplate/services/log_service/log_service.dart';
import 'package:logger/logger.dart';

class DebugLogService implements LogService {
  DebugLogService({Logger? logger}) {
    _logger = logger ??
        Logger(
          printer: PrettyPrinter(),
        );
  }
  late final Logger _logger;

  @override
  void e(String message, dynamic e, StackTrace? stack) {
    _logger.e(message, e, stack);
  }

  @override
  void i(String message) {
    _logger.i(message);
  }
}
