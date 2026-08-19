import 'package:boilerplate/features/dog_image/data/tables/dog_image_table.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

/// The app's single relational store.
///
/// This file lives outside `core` because it cannot avoid naming features:
/// Drift needs every table listed on the annotation, and each table is owned
/// by the feature that queries it. Assembling feature schemas into one
/// database is composition, the same category of work as assembling DI
/// modules, so it sits beside them rather than inside the layer that is not
/// allowed to know features exist.
///
/// One database rather than one per feature. Features share a connection, a
/// migration history, and a transaction boundary; splitting them would trade
/// all three away for an import graph nobody reads.
///
/// Adding a feature that persists: declare its table under
/// `features/<name>/data/tables/`, then add it here. Removing that feature is
/// the same two edits in reverse, and touches nothing else.
@DriftDatabase(tables: <Type>[DogImages])
class AppDatabase extends _$AppDatabase {
  /// The optional executor exists so tests can pass
  /// `NativeDatabase.memory()`.
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'app_database'));

  @override
  int get schemaVersion => 1;
}
