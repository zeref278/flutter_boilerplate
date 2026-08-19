import 'dart:async';

import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/di/di_module.dart';
import 'package:boilerplate/core/network/auth_tokens.dart';
import 'package:boilerplate/core/network/dio_client.dart';
import 'package:boilerplate/core/network/interceptors/auth_interceptor.dart';
import 'package:boilerplate/core/network/interceptors/logging_interceptor.dart';
import 'package:boilerplate/core/security/network_security.dart';
import 'package:boilerplate/core/security/rasp_network_security.dart';
import 'package:boilerplate/core/security/rasp_secure_app_guard.dart';
import 'package:boilerplate/core/security/secure_app_guard.dart';
import 'package:boilerplate/core/services/crashlytics_service/crashlytics_service.dart';
import 'package:boilerplate/core/services/crashlytics_service/log_crashlytics_service.dart';
import 'package:boilerplate/core/services/log_service/debug_log_service.dart';
import 'package:boilerplate/core/services/log_service/log_service.dart';
import 'package:boilerplate/core/storage/app_storage.dart';
import 'package:boilerplate/core/storage/app_storage_impl.dart';
import 'package:boilerplate/core/storage/encrypted_store.dart';
import 'package:boilerplate/core/storage/keychain.dart';
import 'package:boilerplate/core/storage/storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CoreModule extends DiModule {
  const CoreModule();

  @override
  FutureOr<void> register(GetIt gi) {
    gi
      ..registerLazySingleton<LogService>(DebugLogService.new)
      ..registerLazySingleton<CrashlyticsService>(
        () => LogCrashlyticsService(gi<LogService>()),
      )
      ..registerLazySingleton<TokenRefresher>(
        // The one piece of auth a boilerplate cannot supply. Override this
        // registration with a real implementation and AuthInterceptor starts
        // renewing sessions instead of ending them.
        UnsupportedTokenRefresher.new,
      )
      ..registerLazySingleton<NetworkSecurity>(
        () => RaspNetworkSecurity(
          isAntiProxyEnabled: AppConfig.isAntiProxyEnabled,
          spkiSha256Hashes: AppConfig.spkiSha256Hashes,
          certificateSha256Fingerprints:
              AppConfig.certificateSha256Fingerprints,
          bypassForLocalhost: AppConfig.bypassLocalhostChecks,
        ),
      )
      ..registerLazySingleton<Dio>(
        () => createDio(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: AppConfig.connectTimeout,
          receiveTimeout: AppConfig.receiveTimeout,
          sendTimeout: AppConfig.sendTimeout,
          apiKey: AppConfig.apiKey,
          security: gi<NetworkSecurity>(),
          interceptors: <Interceptor>[
            AuthInterceptor(
              storage: gi<AppStorage>(),
              refresher: gi<TokenRefresher>(),
              // Resolved lazily: the client being built here is the one the
              // retry replays through.
              clientProvider: () => gi<Dio>(),
              // Nothing to route to until this boilerplate has a login
              // screen. The credentials are already cleared by the time this
              // runs; replace the body with a redirect.
              onSessionExpired: () async =>
                  gi<LogService>().w('Session expired: credentials cleared'),
            ),
            // Driven by configuration, not by kReleaseMode: a profile build
            // of the production flavor must not print request bodies either.
            if (AppConfig.isNetworkLogEnabled)
              LoggingInterceptor(logService: gi<LogService>()),
          ],
        ),
        dispose: (client) => client.close(force: true),
      )
      ..registerLazySingleton<SecureAppGuard>(
        () => RaspSecureAppGuard(
          crashlytics: gi<CrashlyticsService>(),
          // Armed for the production flavor only. Every other flavor runs on
          // emulators, under debuggers, and signed with the debug key, all of
          // which the engine is built to reject.
          isEnabled: AppConfig.isProduction,
          validAndroidSignatures: AppConfig.validAndroidSignatures,
        ),
      )
      ..registerSingletonAsync<Keychain>(() async => const PlatformKeychain())
      ..registerSingletonAsync<AppStorage>(() async {
        final AppStorage storage = AppStorageImpl(
          HiveEncryptedStore(),
          gi<Keychain>(),
        );
        await storage.init(boxName: StorageKeys.boxName);
        return storage;
      }, dependsOn: <Type>[Keychain]);
  }
}
