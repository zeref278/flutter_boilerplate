import 'package:boilerplate/core/storage/database/app_database.dart' as db;

/// Local persistence. Throws drift/sqlite errors; the repository converts them.
abstract class DogImageCacheDataSource {
  Future<void> save(db.DogImagesCompanion image);

  Future<List<db.DogImage>> getSaved();

  Future<void> delete(int id);
}

class DogImageCacheDataSourceLocal implements DogImageCacheDataSource {
  const DogImageCacheDataSourceLocal(this._database);

  final db.AppDatabase _database;

  @override
  Future<void> save(db.DogImagesCompanion image) =>
      _database.into(_database.dogImages).insert(image);

  @override
  Future<List<db.DogImage>> getSaved() =>
      _database.select(_database.dogImages).get();

  @override
  Future<void> delete(int id) => (_database.delete(
    _database.dogImages,
  )..where((t) => t.id.equals(id))).go();
}
