import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_provider.dart';
import '../data/repositories/tax_rule_repository.dart';

final taxRuleRepositoryProvider = Provider<TaxRuleRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);

  return TaxRuleRepository(database.taxRuleDao);
});