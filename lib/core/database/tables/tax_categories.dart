import 'package:drift/drift.dart';

class TaxCategories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique()();

  TextColumn get nameMs => text()();

  TextColumn get nameEn => text()();

  TextColumn get descriptionMs => text().nullable()();

  TextColumn get descriptionEn => text().nullable()();

  BoolColumn get isActive =>
      boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt =>
      dateTime().nullable()();
}