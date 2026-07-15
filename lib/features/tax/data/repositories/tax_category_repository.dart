import '../../../../core/database/database.dart';
import '../../../../core/database/dao/tax_category_dao.dart';

class TaxCategoryRepository {
  final TaxCategoryDao dao;

  TaxCategoryRepository(this.dao);

  Future<List<TaxCategory>> getAllCategories() {
    return dao.getAll();
  }
}
