import 'package:drift/drift.dart';

class AssessmentYears extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get year => integer().unique()();

  BoolColumn get isActive => boolean().withDefault(const Constant(false))();

  BoolColumn get isLocked => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable()();
}
