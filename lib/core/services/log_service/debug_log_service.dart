import 'dart:developer' as developer;

import 'package:boilerplate/core/services/log_service/log_service.dart';
import 'package:logger/logger.dart';

class DebugLogService implements LogService {
  DebugLogService({Logger? logger})
    : _logger =
          logger ??
          Logger(
            printer: PrettyPrinter(methodCount: 0),
            output: _DeveloperLogOutput(),
          );

  final Logger _logger;

  @override
  void i(String message) => _logger.i(message);

  @override
  void w(String message, [Object? error, StackTrace? stackTrace]) =>
      _logger.w(message, error: error, stackTrace: stackTrace);

  @override
  void e(String message, Object error, [StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}

class _DeveloperLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) => event.lines.forEach(developer.log);
}
