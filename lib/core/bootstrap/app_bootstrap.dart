import '../database/database.dart';
import '../database/seed/database_seeder.dart';

class AppBootstrap {
  const AppBootstrap._();

  static Future<void> initialize() async {
    final database = AppDatabase();

    await DatabaseSeeder(database).seed();

    await database.close();
  }
}
