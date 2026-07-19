import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../receipt/providers/receipt_repository_provider.dart';
import '../../tax/domain/models/top_category_summary.dart';

final topCategoryProvider =
FutureProvider.autoDispose<List<TopCategorySummary>>((ref) async {
  final repository = ref.watch(receiptRepositoryProvider);

  return repository.getTopCategories();
});