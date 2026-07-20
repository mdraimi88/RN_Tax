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

  /// Raw OCR result for future processing
  TextColumn get ocrText => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();
}