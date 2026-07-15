import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/receipts.dart';

part 'receipt_dao.g.dart';

@DriftAccessor(tables: [Receipts])
class ReceiptDao extends DatabaseAccessor<AppDatabase> with _$ReceiptDaoMixin {
  ReceiptDao(super.db);

  Future<List<Receipt>> getAllReceipts() {
    return select(receipts).get();
  }

  Future<Receipt?> getReceiptById(int id) {
    return (select(
      receipts,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertReceipt(ReceiptsCompanion receipt) {
    return into(receipts).insert(receipt);
  }

  Future<bool> updateReceipt(Receipt receipt) {
    return update(receipts).replace(receipt);
  }

  Future<int> deleteReceipt(int id) {
    return (delete(receipts)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<double> getTotalAmount() async {
    final amountSum = receipts.amount.sum();

    final query = selectOnly(receipts)..addColumns([amountSum]);

    final result = await query.getSingle();

    return result.read(amountSum) ?? 0.0;
  }
}
