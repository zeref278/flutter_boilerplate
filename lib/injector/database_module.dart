import 'package:boilerplate/injector/injector.dart';
import 'package:local_database/local_database.dart';

class DatabaseModule {
  DatabaseModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingletonAsync<AppDatabaseManager>(() async {
      final AppDatabaseManager databaseManager = AppDatabaseManager();
      await databaseManager.createDatabase();
      return databaseManager;
    });
  }
}
