abstract class CrashlyticsService {
  Future<void> recordException(Object exception, StackTrace? stackTrace);
}
