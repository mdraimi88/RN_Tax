import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../receipt/providers/receipt_repository_provider.dart';
import '../data/repositories/report_repository.dart';

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  final receiptRepository = ref.watch(receiptRepositoryProvider);

  return ReportRepository(receiptRepository);
});