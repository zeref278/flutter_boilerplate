import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

/// Saved dog images.
///
/// The primary key is a synthetic auto-increment id, never the image URL —
/// the same image may be saved twice, and the delete path needs row identity.
class DogImages extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get message => text()();

  TextColumn get status => text()();
}

@DriftDatabase(tables: <Type>[DogImages])
class AppDatabase extends _$AppDatabase {
  /// The optional executor exists so tests can pass
  /// `NativeDatabase.memory()`.
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'app_database'));

  @override
  int get schemaVersion => 1;
}
