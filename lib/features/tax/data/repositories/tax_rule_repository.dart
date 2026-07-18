import '../../../../core/database/dao/tax_rule_dao.dart';
import '../../../../core/database/database.dart';

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
    return _dao.getRulesByAssessmentYear(
      assessmentYearId,
    );
  }

  Future<int> insertRule(TaxRulesCompanion data) {
    return _dao.insertRule(data);
  }

  Future<void> deleteAllRules() {
    return _dao.deleteAll();
  }
}