import 'package:boilerplate/services/crashlytics_service/crashlytics_service.dart';
import 'package:boilerplate/services/crashlytics_service/firebase_crashlytics_service.dart';
import 'package:boilerplate/services/log_service/debug_log_service.dart';
import 'package:boilerplate/services/log_service/log_service.dart';

import 'injector.dart';

class ServiceModule {
  ServiceModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingletonAsync<CrashlyticsService>(() async {
      return FirebaseCrashlyticsService();
    });

    injector.registerFactory<LogService>(() => DebugLogService());
  }
}
