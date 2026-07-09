import 'package:drift/drift.dart';

import '../../config/app_constants.dart';
import '../database.dart';

class AssessmentYearSeed {
  final AppDatabase database;

  AssessmentYearSeed(this.database);

  Future<void> seed() async {
    final existing = await database.assessmentYearDao.getAll();

    if (existing.isNotEmpty) {
      return;
    }

    for (
      int year = AppConstants.minAssessmentYear;
      year <= AppConstants.maxAssessmentYear;
      year++
    ) {
      await database.assessmentYearDao.insertYear(
        AssessmentYearsCompanion.insert(
          year: year,
          isActive: Value(year == AppConstants.defaultAssessmentYear),
          isLocked: const Value(false),
        ),
      );
    }
  }
}
