import '../dao/tax_rule_dao.dart';
import '../database.dart';

class TaxRuleRepository {
  final TaxRuleDao _dao;

  TaxRuleRepository(this._dao);

  Future<List<TaxRule>> getAllRules() {
    return _dao.getAll();
  }

  Future<TaxRule?> getRule({
    required int assessmentYearId,
    required int categoryId,
  }) {
    return _dao.getRule(
      assessmentYearId: assessmentYearId,
      categoryId: categoryId,
    );
  }

  Future<List<TaxRule>> getRulesByAssessmentYear(
      int assessmentYearId,
      ) {
    return _dao.getRulesByAssessmentYear(assessmentYearId);
  }

  Future<double> getMaximumRelief(
      int assessmentYearId,
      ) {
    return _dao.getMaximumRelief(assessmentYearId);
  }
}