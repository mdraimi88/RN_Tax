import 'package:drift/drift.dart';

import '../../../features/tax/domain/models/top_category_summary.dart';
import '../database.dart';
import '../tables/receipts.dart';

part 'receipt_dao.g.dart';

@DriftAccessor(tables: [Receipts])
class ReceiptDao extends DatabaseAccessor<AppDatabase>
    with _$ReceiptDaoMixin {
  ReceiptDao(super.db);

  // ===========================================================================
  // Watch
  // ===========================================================================

  Stream<List<Receipt>> watchAllReceipts() {
    return (select(receipts)
      ..orderBy([
            (t) => OrderingTerm(
          expression: t.receiptDate,
          mode: OrderingMode.desc,
        ),
      ]))
        .watch();
  }

  Stream<Receipt?> watchReceiptById(int id) {
    return (select(receipts)
      ..where((tbl) => tbl.id.equals(id)))
        .watchSingleOrNull();
  }

  // ===========================================================================
  // CRUD
  // ===========================================================================

  Future<List<Receipt>> getAllReceipts() {
    return (select(receipts)
      ..orderBy([
            (t) => OrderingTerm(
          expression: t.receiptDate,
          mode: OrderingMode.desc,
        ),
      ]))
        .get();
  }

  Future<Receipt?> getReceiptById(int id) {
    return (select(receipts)
      ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertReceipt(ReceiptsCompanion receipt) {
    return into(receipts).insert(receipt);
  }

  Future<bool> updateReceipt(Receipt receipt) {
    return update(receipts).replace(receipt);
  }

  Future<int> deleteReceipt(int id) {
    return (delete(receipts)
      ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  // ===========================================================================
  // Aggregate
  // ===========================================================================

  Future<double> getTotalAmount() async {
    final amountSum = receipts.amount.sum();

    final query = selectOnly(receipts)..addColumns([amountSum]);

    final result = await query.getSingle();

    return result.read(amountSum) ?? 0.0;
  }

  Future<int> getTotalReceiptCount() async {
    final countExpression = receipts.id.count();

    final query = selectOnly(receipts)
      ..addColumns([countExpression]);

    final result = await query.getSingle();

    return result.read(countExpression) ?? 0;
  }

  Future<List<TopCategorySummary>> getTopCategories() async {
    final totalAmount = receipts.amount.sum();

    final query = select(receipts).join([
      innerJoin(
        taxCategories,
        taxCategories.id.equalsExp(receipts.categoryId),
      ),
    ]);

    query
      ..addColumns([totalAmount])
      ..groupBy([receipts.categoryId])
      ..orderBy([
        OrderingTerm(
          expression: totalAmount,
          mode: OrderingMode.desc,
        ),
      ]);

    final rows = await query.get();

    return rows.map((row) {
      final category = row.readTable(taxCategories);

      return TopCategorySummary(
        categoryId: category.id,
        categoryCode: category.code,
        categoryName: category.nameMs,
        totalAmount: row.read(totalAmount) ?? 0,
      );
    }).toList();
  }
}