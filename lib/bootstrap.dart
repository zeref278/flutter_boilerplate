import 'dart:async';
import 'package:boilerplate/core/bloc_core/bloc_observer.dart';
import 'package:boilerplate/features/app/view/app.dart';
import 'package:boilerplate/injector/injector.dart';
import 'package:boilerplate/services/crashlytics_service/crashlytics_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

Future<void> bootstrap({
  AsyncCallback? firebaseInitialization,
  AsyncCallback? flavorConfiguration,
}) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await firebaseInitialization?.call();
    Logger.level = Level.verbose;
    await flavorConfiguration?.call();

    Injector.init();

    await Injector.instance.allReady();

    Bloc.observer = AppBlocObserver();

    runApp(const App());
  }, (error, stack) {
    Injector.instance<CrashlyticsService>().recordException(error, stack);
  });
}
