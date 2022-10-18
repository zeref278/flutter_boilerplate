abstract class CrashlyticsService {
  Future<void> init();

  Future<void> recordException(dynamic exception, StackTrace? stack);
}
