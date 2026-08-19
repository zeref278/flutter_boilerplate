abstract class LogService {
  void i(String message);

  void w(String message, [Object? error, StackTrace? stackTrace]);

  void e(String message, Object error, [StackTrace? stackTrace]);
}
