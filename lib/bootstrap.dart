import 'dart:async';

import 'package:boilerplate/app/view/app.dart';
import 'package:boilerplate/config/env/app_config.dart';
import 'package:boilerplate/core/bloc/bloc_observer.dart';
import 'package:boilerplate/core/di/injector.dart';
import 'package:boilerplate/core/security/secure_app_guard.dart';
import 'package:boilerplate/core/services/crashlytics_service/crashlytics_service.dart';
import 'package:boilerplate/core/services/log_service/log_service.dart';
import 'package:boilerplate/di/app_modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Starts the app.
///
/// Configuration is compiled in rather than passed here: `envied` bakes one
/// flavor's `.env` file into the binary at code-generation time, so there is
/// nothing left to select at startup. See `AppConfig`.
Future<void> bootstrap() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // Before anything reads configuration: a binary built as one flavor and
      // compiled with another's values must not reach a user.
      AppConfig.verifyFlavor();
      await Injector.init(appModules);

      // Awaited so a device that fails the integrity checks is already
      // blocked when the first frame builds, rather than showing the app and
      // then covering it.
      await Injector.instance<SecureAppGuard>().arm();

      final LogService log = Injector.instance<LogService>();
      Bloc.observer = AppBlocObserver(onInfo: log.i, onFailure: log.e);

      runApp(const App());
    },
    (error, stackTrace) {
      // Guarded: this can fire before DI is ready, and an error thrown from
      // inside the error handler loses the original error entirely.
      try {
        Injector.instance<CrashlyticsService>().recordException(
          error,
          stackTrace,
        );
      } on Object {
        debugPrint('Fatal before DI was ready: $error\n$stackTrace');
      }
    },
  );
}
