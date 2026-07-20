import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database.dart';
import 'receipt_provider.dart';
import 'search_query_provider.dart';

final filteredReceiptProvider =
Provider<AsyncValue<List<Receipt>>>((ref) {
  final receipts = ref.watch(receiptListProvider);
  final query = ref.watch(searchQueryProvider);

  return receipts.whenData((items) {
    final keyword = query.trim().toLowerCase();

    if (keyword.isEmpty) {
      return items;
    }

    return items.where((receipt) {
      return receipt.merchant.toLowerCase().contains(keyword);
    }).toList();
  });
});