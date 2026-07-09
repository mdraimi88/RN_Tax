import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/tax_rules.dart';

part 'tax_rule_dao.g.dart';

@DriftAccessor(tables: [TaxRules])
class TaxRuleDao extends DatabaseAccessor<AppDatabase> with _$TaxRuleDaoMixin {
  TaxRuleDao(super.db);

  Future<List<TaxRule>> getAll() {
    return select(taxRules).get();
  }

  Future<int> insertRule(TaxRulesCompanion data) {
    return into(taxRules).insert(data);
  }

  Future<void> deleteAll() {
    return delete(taxRules).go();
  }
}
