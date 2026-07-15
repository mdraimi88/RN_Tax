import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database.dart';
import 'receipt_repository_provider.dart';

final receiptProvider = FutureProvider.autoDispose<List<Receipt>>((ref) async {
  final repository = ref.watch(receiptRepositoryProvider);

  return repository.getAllReceipts();
});

final totalReceiptAmountProvider = FutureProvider.autoDispose<double>((
  ref,
) async {
  final repository = ref.watch(receiptRepositoryProvider);

  return repository.getTotalAmount();
});
