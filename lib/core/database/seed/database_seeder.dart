import 'package:drift/drift.dart';

import '../database.dart';
import 'assessment_year_seed.dart';
import 'tax_category_seed.dart';

class DatabaseSeeder {
  final AppDatabase database;

  DatabaseSeeder(this.database);

  Future<void> seed() async {
    await _seedAssessmentYears();
    await _seedTaxCategories();
  }

  Future<void> _seedAssessmentYears() async {
    final total = await database
        .select(database.assessmentYears)
        .get()
        .then((e) => e.length);

    if (total > 0) return;

    for (final year in AssessmentYearSeed.years) {
      await database.into(database.assessmentYears).insert(
        AssessmentYearsCompanion.insert(
          year: year,
          isActive: Value(year == 2026),
          isLocked: const Value(false),
        ),
      );
    }
  }

  Future<void> _seedTaxCategories() async {
    final total = await database
        .select(database.taxCategories)
        .get()
        .then((e) => e.length);

    if (total > 0) return;

    for (final category in TaxCategorySeed.categories) {
      await database.into(database.taxCategories).insert(
        TaxCategoriesCompanion.insert(
          code: category['code']!,
          nameMs: category['nameMs']!,
          nameEn: category['nameEn']!,
          descriptionMs: const Value(null),
          descriptionEn: const Value(null),
          isActive: const Value(true),
        ),
      );
    }
  }
}