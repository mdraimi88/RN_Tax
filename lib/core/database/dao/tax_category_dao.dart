import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/tax_categories.dart';

part 'tax_category_dao.g.dart';

@DriftAccessor(tables: [TaxCategories])
class TaxCategoryDao extends DatabaseAccessor<AppDatabase>
    with _$TaxCategoryDaoMixin {
  TaxCategoryDao(super.db);

  Future<List<TaxCategory>> getAll() {
    return select(taxCategories).get();
  }

  Future<int> insertCategory(TaxCategoriesCompanion data) {
    return into(taxCategories).insert(data);
  }

  Future<void> deleteAll() {
    return delete(taxCategories).go();
  }
}
