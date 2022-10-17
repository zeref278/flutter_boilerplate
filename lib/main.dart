import 'dart:async';

import 'package:boilerplate/configs/app_config.dart';
import 'package:boilerplate/injector/injector.dart';
import 'package:boilerplate/services/crashlytics_service/crashlytics_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'my_app.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// Firebase initialize ...
    Logger.level = Level.verbose;
    AppConfig.configDev();
    Injector.init();

    await Injector.instance.allReady();

    runApp(const MyApp());
  }, (error, stack) {
    final CrashlyticsService crashlyticsService =
        Injector.instance<CrashlyticsService>();
    crashlyticsService.recordException(error, stack);
  });
}
