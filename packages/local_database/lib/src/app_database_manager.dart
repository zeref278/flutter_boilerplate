import 'dart:async';

import 'package:local_database/local_database.dart';

import 'app_database.dart';

class AppDatabaseManager {
  static final AppDatabaseManager _singleton = AppDatabaseManager._internal();

  factory AppDatabaseManager() {
    return _singleton;
  }

  AppDatabaseManager._internal();

  late final AppDatabase _database;

  ///DAO
  DogImageDao? _dogImageDao;

  Future createDatabase() async {
    _database = await $FloorAppDatabase
        .databaseBuilder('app_database.db')
        .addMigrations(
      [
        //_migration1to2,
        //...
      ],
    ).build();
    initDao();
  }

  void initDao() {
    _dogImageDao = _database.dogImageDao;
  }

  FutureOr<DogImageDao> get dogImageDao async {
    if (_dogImageDao == null) {
      await createDatabase();
    }
    return _dogImageDao!;
  }

  // Migration (add database migration)

  // After release app to Store, whenever add entity, change entity ..., must write migraion
  // Step 1. Level up database version in  app_database.dart (example 1 -> 2)
  //
  // Step 2. Write migration (example migration1to2)
  //  final _migration1to2 = Migration(1, 2, (database) async {
  //    await database.execute(
  //        'CREATE TABLE IF NOT EXISTS `NotificationDb` (`key` INTEGER, `data` TEXT, `pushType` INTEGER, `error` INTEGER, PRIMARY KEY (`key`))');
  //    await database.execute('ALTER TABLE OrderDB ADD listShortItem TEXT');
  //  });
  //
  // Step 3. Run command "flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs"

}
