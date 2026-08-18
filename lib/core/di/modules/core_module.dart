import 'dart:async';

import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/di/di_module.dart';
import 'package:boilerplate/core/network/dio_client.dart';
import 'package:boilerplate/core/services/app_service/app_service.dart';
import 'package:boilerplate/core/services/app_service/app_service_impl.dart';
import 'package:boilerplate/core/services/crashlytics_service/crashlytics_service.dart';
import 'package:boilerplate/core/services/crashlytics_service/log_crashlytics_service.dart';
import 'package:boilerplate/core/services/log_service/debug_log_service.dart';
import 'package:boilerplate/core/services/log_service/log_service.dart';
import 'package:boilerplate/core/storage/app_storage.dart';
import 'package:boilerplate/core/storage/app_storage_impl.dart';
import 'package:boilerplate/core/storage/database/app_database.dart';
import 'package:boilerplate/core/storage/encrypted_store.dart';
import 'package:boilerplate/core/storage/keychain.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CoreModule extends DiModule {
  const CoreModule();

  static const String boxName = 'app';

  @override
  FutureOr<void> register(GetIt gi) {
    gi
      ..registerLazySingleton<LogService>(DebugLogService.new)
      ..registerLazySingleton<CrashlyticsService>(
        () => LogCrashlyticsService(logService: gi<LogService>()),
      )
      ..registerLazySingleton<Dio>(() => createDio(baseUrl: AppConfig.baseUrl))
      ..registerLazySingleton<AppDatabase>(AppDatabase.new)
      ..registerSingletonAsync<Keychain>(() async => const PlatformKeychain())
      ..registerSingletonAsync<AppStorage>(() async {
        final AppStorage storage = AppStorageImpl(
          HiveEncryptedStore(),
          gi<Keychain>(),
        );
        await storage.init(boxName: boxName);
        return storage;
      }, dependsOn: <Type>[Keychain])
      ..registerSingletonAsync<AppService>(
        () async => AppServiceImpl(storage: gi<AppStorage>()),
        dependsOn: <Type>[AppStorage],
      );
  }
}
