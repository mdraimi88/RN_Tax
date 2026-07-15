import 'package:drift/drift.dart';

import 'assessment_years.dart';
import 'tax_categories.dart';

class Receipts extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get assessmentYearId =>
      integer().references(AssessmentYears, #id)();

  IntColumn get categoryId => integer().references(TaxCategories, #id)();

  TextColumn get merchant => text()();

  DateTimeColumn get receiptDate => dateTime()();

  RealColumn get amount => real()();

  TextColumn get imagePath => text()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();
}
