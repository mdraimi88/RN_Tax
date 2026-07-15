import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_provider.dart';
import '../data/repositories/tax_category_repository.dart';

final taxCategoryRepositoryProvider = Provider<TaxCategoryRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);

  return TaxCategoryRepository(database.taxCategoryDao);
});
