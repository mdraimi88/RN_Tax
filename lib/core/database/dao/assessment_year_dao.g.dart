// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_year_dao.dart';

// ignore_for_file: type=lint
mixin _$AssessmentYearDaoMixin on DatabaseAccessor<AppDatabase> {
  $AssessmentYearsTable get assessmentYears => attachedDatabase.assessmentYears;
  AssessmentYearDaoManager get managers => AssessmentYearDaoManager(this);
}

class AssessmentYearDaoManager {
  final _$AssessmentYearDaoMixin _db;
  AssessmentYearDaoManager(this._db);
  $$AssessmentYearsTableTableManager get assessmentYears =>
      $$AssessmentYearsTableTableManager(
        _db.attachedDatabase,
        _db.assessmentYears,
      );
}
