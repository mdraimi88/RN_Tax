import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../../../core/database/dao/receipt_dao.dart';
import '../../../core/providers/database_provider.dart';
import '../../tax/domain/models/top_category_summary.dart';
import '../data/repositories/receipt_repository.dart';

/// ============================================================================
/// DAO
/// ============================================================================

final receiptDaoProvider = Provider<ReceiptDao>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return ReceiptDao(database);
});

/// ============================================================================
/// Repository
/// ============================================================================

final receiptRepositoryProvider = Provider<ReceiptRepository>((ref) {
  final dao = ref.watch(receiptDaoProvider);
  return ReceiptRepository(dao);
});

/// ============================================================================
/// Receipt List
/// ============================================================================

final receiptListProvider = StreamProvider<List<Receipt>>((ref) {
  final repository = ref.watch(receiptRepositoryProvider);
  return repository.watchAllReceipts();
});

/// ============================================================================
/// Total Amount
/// ============================================================================

final totalReceiptAmountProvider = FutureProvider<double>((ref) {
  final repository = ref.watch(receiptRepositoryProvider);
  return repository.getTotalAmount();
});

/// ============================================================================
/// Receipt Count
/// ============================================================================

final receiptCountProvider = FutureProvider<int>((ref) {
  final repository = ref.watch(receiptRepositoryProvider);
  return repository.getTotalReceiptCount();
});

/// ============================================================================
/// Top Categories
/// ============================================================================

final topCategoriesProvider =
FutureProvider<List<TopCategorySummary>>((ref) {
  final repository = ref.watch(receiptRepositoryProvider);
  return repository.getTopCategories();
});