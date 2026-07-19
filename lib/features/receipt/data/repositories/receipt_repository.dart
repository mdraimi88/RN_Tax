import '../../../../core/database/dao/receipt_dao.dart';
import '../../../../core/database/database.dart';
import '../../../tax/domain/models/top_category_summary.dart';

class ReceiptRepository {
  final ReceiptDao _dao;

  ReceiptRepository(this._dao);


  Future<List<Receipt>> getAllReceipts() {
    return _dao.getAllReceipts();
  }

  Future<Receipt?> getReceiptById(int id) {
    return _dao.getReceiptById(id);
  }

  Future<int> insertReceipt(ReceiptsCompanion receipt) {
    return _dao.insertReceipt(receipt);
  }

  Future<bool> updateReceipt(Receipt receipt) {
    return _dao.updateReceipt(receipt);
  }

  Future<int> deleteReceipt(int id) {
    return _dao.deleteReceipt(id);
  }

  Future<double> getTotalAmount() {
    return _dao.getTotalAmount();
  }
  Future<List<TopCategorySummary>> getTopCategories() {
    return _dao.getTopCategories();
  }
}
