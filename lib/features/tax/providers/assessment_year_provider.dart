import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database.dart';
import '../../../core/providers/repository_provider.dart';

final activeAssessmentYearProvider =
FutureProvider<AssessmentYear?>((ref) async {
  final repository = ref.watch(assessmentYearRepositoryProvider);

  return repository.getActive();
});