import 'package:boilerplate/services/crashlytics_service/crashlytics_service.dart';
import 'package:boilerplate/services/crashlytics_service/firebase_crashlytics_service.dart';
import 'package:boilerplate/services/local_storage_service/local_storage_service.dart';
import 'package:boilerplate/services/local_storage_service/shared_preferences_service.dart';
import 'package:boilerplate/services/log_service/debug_log_service.dart';
import 'package:boilerplate/services/log_service/log_service.dart';

import 'injector.dart';

class ServiceModule {
  ServiceModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingletonAsync<CrashlyticsService>(() async {
      final CrashlyticsService service = FirebaseCrashlyticsService();
      await service.init();
      return service;
    },signalsReady: true);

    injector.registerFactory<LogService>(() => DebugLogService());

    injector.registerSingleton<LocalStorageService>(
      SharedPreferencesService(),
      signalsReady: true,
    );
  }
}
