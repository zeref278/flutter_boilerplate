import 'dart:async';

import 'package:boilerplate/app/view/app.dart';
import 'package:boilerplate/core/bloc/bloc_observer.dart';
import 'package:boilerplate/core/di/injector.dart';
import 'package:boilerplate/core/services/crashlytics_service/crashlytics_service.dart';
import 'package:boilerplate/core/services/log_service/log_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> bootstrap({required FutureOr<void> Function() configure}) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configure();
      await Injector.init();

      final LogService log = Injector.instance<LogService>();
      Bloc.observer = AppBlocObserver(
        onInfo: log.i,
        onFailure: (message, error, stackTrace) =>
            log.e(message, error, stackTrace),
      );

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
