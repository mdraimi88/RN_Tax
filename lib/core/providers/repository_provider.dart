import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/dao/assessment_year_dao.dart';
import '../database/dao/tax_rule_dao.dart';
import '../database/repositories/assessment_year_repository.dart';
import '../database/repositories/tax_rule_repository.dart';
import 'database_provider.dart';

final assessmentYearRepositoryProvider =
Provider<AssessmentYearRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return AssessmentYearRepository(
    AssessmentYearDao(db),
  );
});

final taxRuleRepositoryProvider =
Provider<TaxRuleRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return TaxRuleRepository(
    TaxRuleDao(db),
  );
});