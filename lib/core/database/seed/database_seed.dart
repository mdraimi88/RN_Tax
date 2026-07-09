import 'package:flutter/services.dart';
import 'dart:convert';

import '../database.dart';

class DatabaseSeed {
  final AppDatabase database;

  DatabaseSeed(this.database);

  Future<void> seed() async {
    await _seedAssessmentYears();
    await _seedTaxCategories();
  }

  Future<void> _seedAssessmentYears() async {
    // TODO:
    // 1. Semak jika table kosong
    // 2. Baca assets/seed/assessment_years.json
    // 3. Insert ke database
  }

  Future<void> _seedTaxCategories() async {
    // TODO:
    // 1. Semak jika table kosong
    // 2. Baca assets/seed/tax_categories.json
    // 3. Insert ke database
  }

  Future<List<dynamic>> loadJson(String asset) async {
    final jsonString = await rootBundle.loadString(asset);
    return json.decode(jsonString) as List<dynamic>;
  }
}
