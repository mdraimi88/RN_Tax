import '../database/database.dart';
import '../database/seed/database_seed.dart';

class AppBootstrap {
  const AppBootstrap._();

  static Future<void> initialize() async {
    final database = AppDatabase();

    await DatabaseSeed(database).seed();

    await database.close();
  }
}
