import 'package:drift/drift.dart';

import 'assessment_years.dart';
import 'tax_categories.dart';

class TaxRules extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get assessmentYearId =>
      integer().references(AssessmentYears, #id)();

  IntColumn get categoryId =>
      integer().references(TaxCategories, #id)();

  RealColumn get maximumAmount => real()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();
}