import 'package:boilerplate/core/storage/database/tables/dog_image_table.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: <Type>[DogImages])
class AppDatabase extends _$AppDatabase {
  /// The optional executor exists so tests can pass
  /// `NativeDatabase.memory()`.
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'app_database'));

  @override
  int get schemaVersion => 1;
}
