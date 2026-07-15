// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_dao.dart';

// ignore_for_file: type=lint
mixin _$ReceiptDaoMixin on DatabaseAccessor<AppDatabase> {
  $AssessmentYearsTable get assessmentYears => attachedDatabase.assessmentYears;
  $TaxCategoriesTable get taxCategories => attachedDatabase.taxCategories;
  $ReceiptsTable get receipts => attachedDatabase.receipts;
  ReceiptDaoManager get managers => ReceiptDaoManager(this);
}

class ReceiptDaoManager {
  final _$ReceiptDaoMixin _db;
  ReceiptDaoManager(this._db);
  $$AssessmentYearsTableTableManager get assessmentYears =>
      $$AssessmentYearsTableTableManager(
        _db.attachedDatabase,
        _db.assessmentYears,
      );
  $$TaxCategoriesTableTableManager get taxCategories =>
      $$TaxCategoriesTableTableManager(_db.attachedDatabase, _db.taxCategories);
  $$ReceiptsTableTableManager get receipts =>
      $$ReceiptsTableTableManager(_db.attachedDatabase, _db.receipts);
}
