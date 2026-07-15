import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../config/app_constants.dart';

import 'tables/assessment_years.dart';
import 'tables/tax_categories.dart';
import 'tables/tax_rules.dart';
import 'tables/tax_reliefs.dart';
import 'dao/receipt_dao.dart';
import 'dao/assessment_year_dao.dart';
import 'dao/tax_category_dao.dart';
import 'dao/tax_rule_dao.dart';
import 'tables/receipts.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [AssessmentYears, TaxCategories, TaxRules, TaxReliefs, Receipts],
  daos: [AssessmentYearDao, TaxCategoryDao, TaxRuleDao, ReceiptDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => AppConstants.databaseVersion;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();

    final file = File(p.join(directory.path, AppConstants.databaseName));

    return NativeDatabase.createInBackground(file);
  });
}
