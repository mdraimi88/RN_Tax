import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_provider.dart';
import '../data/repositories/assessment_year_repository.dart';

final assessmentYearRepositoryProvider = Provider<AssessmentYearRepository>((
  ref,
) {
  final db = ref.watch(appDatabaseProvider);

  return AssessmentYearRepository(db.assessmentYearDao);
});
