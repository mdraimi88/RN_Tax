import 'package:drift/drift.dart';

class TaxReliefs extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique()();

  TextColumn get category => text()();

  TextColumn get titleBm => text()();

  TextColumn get titleEn => text()();

  RealColumn get maxAmount => real()();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  IntColumn get assessmentYear => integer()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();
}
