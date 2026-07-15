import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'assessment_year_repository_provider.dart';

final activeAssessmentYearProvider = FutureProvider((ref) async {
  final repository = ref.watch(assessmentYearRepositoryProvider);

  return repository.getActiveYear();
});
