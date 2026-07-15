import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database.dart';
import 'tax_category_repository_provider.dart';

final taxCategoryListProvider = FutureProvider<List<TaxCategory>>((ref) async {
  final repository = ref.watch(taxCategoryRepositoryProvider);

  return repository.getAllCategories();
});
