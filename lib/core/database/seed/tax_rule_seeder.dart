import 'dart:convert';

import 'package:flutter/services.dart';

import '../database.dart';

class TaxRuleSeeder {
  final AppDatabase database;

  TaxRuleSeeder(this.database);

  Future<void> seed() async {
    final existing = await database.select(database.taxRules).get();

    if (existing.isNotEmpty) return;

    final jsonString =
    await rootBundle.loadString('assets/json/tax_reliefs.json');

    final Map<String, dynamic> data = json.decode(jsonString);

    for (final entry in data.entries) {
      final assessmentYear = int.parse(entry.key);

      final assessmentYearRecord =
      await (database.select(database.assessmentYears)
        ..where((t) => t.year.equals(assessmentYear)))
          .getSingleOrNull();

      if (assessmentYearRecord == null) {
        continue;
      }

      final rules = entry.value as List<dynamic>;

      for (final item in rules) {
        final map = item as Map<String, dynamic>;

        final category =
        await (database.select(database.taxCategories)
          ..where((t) => t.code.equals(map['code'])))
            .getSingleOrNull();

        if (category == null) {
          continue;
        }

        await database.into(database.taxRules).insert(
          TaxRulesCompanion.insert(
            assessmentYearId: assessmentYearRecord.id,
            categoryId: category.id,
            code: map['code'],
            titleMs: map['titleBm'],
            titleEn: map['titleEn'],
            sortOrder: map['sortOrder'],
            maximumAmount: (map['maxAmount'] as num).toDouble(),
          ),
        );
      }
    }
  }
}