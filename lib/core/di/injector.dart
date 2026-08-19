import 'package:boilerplate/core/di/di_module.dart';
import 'package:get_it/get_it.dart';

/// Runs a list of [DiModule]s against the service locator.
///
/// Deliberately knows no module by name. The list is passed in from
/// `di/app_modules.dart`, which is allowed to name features; this file is
/// part of `core`, which is not. That split is what lets a feature be deleted
/// without editing anything under `core`.
class Injector {
  Injector._();

  static GetIt get instance => GetIt.instance;

  /// Registers [modules] in order. Order is dependency order: a module may
  /// resolve anything registered by a module before it.
  static Future<void> init(List<DiModule> modules) async {
    for (final DiModule module in modules) {
      await module.register(instance);
    }
    await instance.allReady();
  }

  static Future<void> reset() => instance.reset();
}
