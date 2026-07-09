// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_category_dao.dart';

// ignore_for_file: type=lint
mixin _$TaxCategoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $TaxCategoriesTable get taxCategories => attachedDatabase.taxCategories;
  TaxCategoryDaoManager get managers => TaxCategoryDaoManager(this);
}

class TaxCategoryDaoManager {
  final _$TaxCategoryDaoMixin _db;
  TaxCategoryDaoManager(this._db);
  $$TaxCategoriesTableTableManager get taxCategories =>
      $$TaxCategoriesTableTableManager(_db.attachedDatabase, _db.taxCategories);
}
