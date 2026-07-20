import 'package:drift/drift.dart';

import 'assessment_years.dart';
import 'tax_categories.dart';

class Receipts extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get assessmentYearId =>
      integer().references(AssessmentYears, #id)();

  IntColumn get categoryId =>
      integer().references(TaxCategories, #id)();

  TextColumn get merchant => text()();

  /// Receipt / Invoice Number
  TextColumn get receiptNumber => text().nullable()();

  DateTimeColumn get receiptDate => dateTime()();

  RealColumn get amount => real()();

  /// Local image path
  TextColumn get imagePath => text()();

  /// Optional user notes
  TextColumn get notes => text().nullable()();

  /// Raw OCR result
  TextColumn get ocrText => text().nullable()();

  /// Has the user verified the OCR result?
  BoolColumn get isVerified =>
      boolean().withDefault(const Constant(false))();

  /// manual | camera | gallery | ocr | import
  TextColumn get source =>
      text().withDefault(const Constant('manual'))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();
}