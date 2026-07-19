import '../../../receipt/data/repositories/receipt_repository.dart';
import '../../domain/models/report_summary.dart';

class ReportRepository {
  const ReportRepository(this._receiptRepository);

  final ReceiptRepository _receiptRepository;

  Future<ReportSummary> getSummary() async {
    final totalReceipts =
    await _receiptRepository.getTotalReceiptCount();

    final totalAmount =
    await _receiptRepository.getTotalAmount();

    final topCategories =
    await _receiptRepository.getTopCategories();

    final topCategory = topCategories.isEmpty
        ? '-'
        : topCategories.first.categoryName;

    return ReportSummary(
      totalReceipts: totalReceipts,
      totalAmount: totalAmount,
      topCategory: topCategory,
    );
  }
}