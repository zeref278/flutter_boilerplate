import 'package:boilerplate/core/di/di_module.dart';
import 'package:get_it/get_it.dart';

class Injector {
  Injector._();

  static GetIt get instance => GetIt.instance;

  /// Registration order is the dependency order. Core first, features after.
  static const List<DiModule> _modules = <DiModule>[];

  static Future<void> init() async {
    for (final DiModule module in _modules) {
      await module.register(instance);
    }
    await instance.allReady();
  }

  static Future<void> reset() => instance.reset();
}
