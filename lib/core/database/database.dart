import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/assessment_years.dart';
import 'tables/tax_categories.dart';
import 'tables/tax_rules.dart';

import 'dao/assessment_year_dao.dart';
import 'dao/tax_category_dao.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [AssessmentYears, TaxCategories, TaxRules],
  daos: [AssessmentYearDao, TaxCategoryDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();

    final file = File(p.join(directory.path, 'remy_tax.db'));

    return NativeDatabase.createInBackground(file);
  });
}
