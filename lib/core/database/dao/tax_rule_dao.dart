import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/tax_rules.dart';

part 'tax_rule_dao.g.dart';

@DriftAccessor(tables: [TaxRules])
class TaxRuleDao extends DatabaseAccessor<AppDatabase>
    with _$TaxRuleDaoMixin {
  TaxRuleDao(super.db);

  Future<List<TaxRule>> getAll() {
    return select(taxRules).get();
  }

  Future<TaxRule?> getRule({
    required int assessmentYearId,
    required int categoryId,
  }) {
    return (select(taxRules)
      ..where(
            (tbl) =>
        tbl.assessmentYearId.equals(assessmentYearId) &
        tbl.categoryId.equals(categoryId) &
        tbl.isActive.equals(true),
      ))
        .getSingleOrNull();
  }

  Future<List<TaxRule>> getRulesByAssessmentYear(
      int assessmentYearId,
      ) {
    return (select(taxRules)
      ..where(
            (tbl) =>
        tbl.assessmentYearId.equals(assessmentYearId) &
        tbl.isActive.equals(true),
      ))
        .get();
  }

  Future<int> insertRule(TaxRulesCompanion data) {
    return into(taxRules).insert(data);
  }

  Future<void> deleteAll() async {
    await delete(taxRules).go();
  }
}