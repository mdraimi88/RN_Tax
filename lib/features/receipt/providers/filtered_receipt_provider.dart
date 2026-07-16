import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database.dart';
import 'receipt_provider.dart';
import 'search_query_provider.dart';

final filteredReceiptProvider =
Provider<AsyncValue<List<Receipt>>>((ref) {
  final receipts = ref.watch(receiptProvider);
  final query = ref.watch(receiptSearchProvider);

  return receipts.whenData((items) {
    if (query.trim().isEmpty) {
      return items;
    }

    final keyword = query.toLowerCase();

    return items.where((receipt) {
      return receipt.merchant.toLowerCase().contains(keyword);
    }).toList();
  });
});