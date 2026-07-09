import '../database.dart';
import 'assessment_year_seed.dart';

class DatabaseSeed {
  final AppDatabase database;

  DatabaseSeed(this.database);

  Future<void> seed() async {
    await AssessmentYearSeed(database).seed();
  }
}
