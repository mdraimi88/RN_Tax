import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database.dart';
import '../domain/models/create_receipt_request.dart';
import 'receipt_provider.dart';
import 'receipt_repository_provider.dart';

final receiptNotifierProvider = AsyncNotifierProvider<ReceiptNotifier, void>(
  ReceiptNotifier.new,
);

class ReceiptNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> addReceipt(CreateReceiptRequest request) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(receiptRepositoryProvider);

      await repository.insertReceipt(
        ReceiptsCompanion.insert(
          assessmentYearId: request.assessmentYearId,
          categoryId: request.categoryId,
          merchant: request.merchant,
          receiptDate: request.receiptDate,
          amount: request.amount,
          imagePath: request.imagePath,
          notes: Value(request.notes),
        ),
      );

      // Refresh dashboard providers
      ref.invalidate(receiptProvider);
      ref.invalidate(totalReceiptAmountProvider);

      state = const AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      rethrow;
    }
  }

  Future<void> deleteReceipt(int id) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(receiptRepositoryProvider);

      await repository.deleteReceipt(id);

      ref.invalidate(receiptProvider);
      ref.invalidate(totalReceiptAmountProvider);

      state = const AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      rethrow;
    }
  }

  Future<void> updateReceipt(Receipt receipt) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(receiptRepositoryProvider);

      await repository.updateReceipt(receipt);

      ref.invalidate(receiptProvider);
      ref.invalidate(totalReceiptAmountProvider);

      state = const AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      rethrow;
    }
  }
}
