import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'assessment_year_repository_provider.dart';

final assessmentYearListProvider = FutureProvider<List>((ref) async {
  final repository = ref.watch(assessmentYearRepositoryProvider);

  return repository.getAllYears();
});
