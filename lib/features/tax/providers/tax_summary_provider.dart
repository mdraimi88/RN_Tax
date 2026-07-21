import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/repository_provider.dart';
import '../../receipt/providers/receipt_provider.dart';
import 'assessment_year_provider.dart';

import '../domain/models/relief_summary.dart';
import '../services/tax_calculator.dart';

final taxSummaryProvider = FutureProvider<ReliefSummary>((ref) async {
  final totalSpent = await ref.watch(totalReceiptAmountProvider.future);

  final assessmentYear =
  await ref.watch(activeAssessmentYearProvider.future);

  if (assessmentYear == null) {
    return const ReliefSummary(
      totalSpent: 0,
      eligibleRelief: 0,
      remainingRelief: 0,
      maxRelief: 0,
      progress: 0,
    );
  }

  final repository = ref.watch(taxRuleRepositoryProvider);

  final maxRelief =
  await repository.getMaximumRelief(assessmentYear.id);

  const calculator = TaxCalculator();

  return calculator.calculate(
    totalSpent: totalSpent,
    maxRelief: maxRelief,
  );
});