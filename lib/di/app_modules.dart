import 'package:boilerplate/app/di/app_module.dart';
import 'package:boilerplate/core/di/di_module.dart';
import 'package:boilerplate/core/di/modules/core_module.dart';
import 'package:boilerplate/database/database_module.dart';
import 'package:boilerplate/features/dog_image/di/dog_image_module.dart';

/// The composition root: the one list that names every module in the app.
///
/// Registration order is dependency order — core first, the database next,
/// then features, then the app shell that consumes them.
///
/// Adding a feature is one line here. Removing one is the same line, and
/// nothing under `core` changes either way.
const List<DiModule> appModules = <DiModule>[
  CoreModule(),
  DatabaseModule(),
  DogImageModule(),
  AppModule(),
];
