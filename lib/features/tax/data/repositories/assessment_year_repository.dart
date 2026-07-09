import '../../../../core/database/database.dart';
import '../../../../core/database/dao/assessment_year_dao.dart';

class AssessmentYearRepository {
  final AssessmentYearDao dao;

  AssessmentYearRepository(this.dao);

  Future<List<AssessmentYear>> getAllYears() {
    return dao.getAll();
  }

  Future<AssessmentYear?> getActiveYear() {
    return dao.getActive();
  }
}
