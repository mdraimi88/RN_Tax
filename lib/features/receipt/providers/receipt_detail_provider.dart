import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database.dart';
import 'receipt_repository_provider.dart';

final receiptDetailProvider =
FutureProvider.family<Receipt?, int>((ref, receiptId) async {
  final repository = ref.watch(receiptRepositoryProvider);

  return repository.getReceiptById(receiptId);
});