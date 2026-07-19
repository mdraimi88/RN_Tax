import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/report_summary.dart';
import 'report_repository_provider.dart';

final reportProvider = FutureProvider<ReportSummary>((ref) async {
  final repository = ref.watch(reportRepositoryProvider);

  return repository.getSummary();
});