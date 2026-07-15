import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/database_provider.dart';
import '../data/repositories/receipt_repository.dart';

final receiptRepositoryProvider = Provider<ReceiptRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);

  return ReceiptRepository(database.receiptDao);
});
