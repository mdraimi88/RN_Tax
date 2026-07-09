// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_rule_dao.dart';

// ignore_for_file: type=lint
mixin _$TaxRuleDaoMixin on DatabaseAccessor<AppDatabase> {
  $AssessmentYearsTable get assessmentYears => attachedDatabase.assessmentYears;
  $TaxCategoriesTable get taxCategories => attachedDatabase.taxCategories;
  $TaxRulesTable get taxRules => attachedDatabase.taxRules;
  TaxRuleDaoManager get managers => TaxRuleDaoManager(this);
}

class TaxRuleDaoManager {
  final _$TaxRuleDaoMixin _db;
  TaxRuleDaoManager(this._db);
  $$AssessmentYearsTableTableManager get assessmentYears =>
      $$AssessmentYearsTableTableManager(
        _db.attachedDatabase,
        _db.assessmentYears,
      );
  $$TaxCategoriesTableTableManager get taxCategories =>
      $$TaxCategoriesTableTableManager(_db.attachedDatabase, _db.taxCategories);
  $$TaxRulesTableTableManager get taxRules =>
      $$TaxRulesTableTableManager(_db.attachedDatabase, _db.taxRules);
}
