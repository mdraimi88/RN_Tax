import '../dao/assessment_year_dao.dart';
import '../database.dart';

class AssessmentYearRepository {
  final AssessmentYearDao _dao;

  AssessmentYearRepository(this._dao);

  Future<List<AssessmentYear>> getAll() {
    return _dao.getAll();
  }

  Future<AssessmentYear?> getActive() {
    return _dao.getActive();
  }

  Future<void> setActiveYear(int id) {
    return _dao.setActiveYear(id);
  }
}