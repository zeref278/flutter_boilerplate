import 'package:boilerplate/app/di/app_module.dart';
import 'package:boilerplate/core/di/di_module.dart';
import 'package:boilerplate/core/di/modules/core_module.dart';
import 'package:boilerplate/features/dog_image/di/dog_image_module.dart';
import 'package:get_it/get_it.dart';

class Injector {
  Injector._();

  static GetIt get instance => GetIt.instance;

  /// Registration order is the dependency order. Core first, features after.
  static const List<DiModule> _modules = <DiModule>[
    CoreModule(),
    DogImageModule(),
    AppModule(),
  ];

  static Future<void> init() async {
    for (final DiModule module in _modules) {
      await module.register(instance);
    }
    await instance.allReady();
  }

  static Future<void> reset() => instance.reset();
}
