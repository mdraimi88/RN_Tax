import '../../../../core/database/database.dart';
import '../../../../core/database/dao/assessment_year_dao.dart';

class AssessmentYearRepository {
  final AssessmentYearDao dao;

  AssessmentYearRepository(this.dao);

  Future<List<AssessmentYear>> getAllYears() {
    return dao.getAll();
  }

  Future<AssessmentYear?> getActiveYear() async {
    final years = await dao.getAll();

    if (years.isEmpty) {
      return null;
    }

    final targetYear = DateTime.now().year - 1;

    try {
      return years.firstWhere(
            (year) => year.year == targetYear,
      );
    } catch (_) {
      // Jika tiada tahun semasa - 1, ambil tahun terakhir
      return years.last;
    }
  }

  Future<void> setActiveYear(int id) {
    return dao.setActiveYear(id);
  }
}