import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/assessment_years.dart';
part 'assessment_year_dao.g.dart';

@DriftAccessor(tables: [AssessmentYears])
class AssessmentYearDao extends DatabaseAccessor<AppDatabase>
    with _$AssessmentYearDaoMixin {
  AssessmentYearDao(super.db);

  Future<List<AssessmentYear>> getAll() {
    return select(assessmentYears).get();
  }

  Future<AssessmentYear?> getActive() {
    return (select(
      assessmentYears,
    )..where((tbl) => tbl.isActive.equals(true))).getSingleOrNull();
  }

  Future<int> insertYear(AssessmentYearsCompanion data) {
    return into(assessmentYears).insert(data);
  }

  Future<void> setActiveYear(int id) async {
    await update(
      assessmentYears,
    ).write(const AssessmentYearsCompanion(isActive: Value(false)));

    await (update(assessmentYears)..where((tbl) => tbl.id.equals(id))).write(
      const AssessmentYearsCompanion(isActive: Value(true)),
    );
  }
}
