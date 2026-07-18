import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../receipt/providers/receipt_provider.dart';
import '../domain/models/relief_summary.dart';
import '../services/tax_calculator.dart';

final taxSummaryProvider = FutureProvider<ReliefSummary>((ref) async {
  final totalSpent = await ref.watch(totalReceiptAmountProvider.future);

  // TODO:
  // Ambil daripada TaxRuleRepository mengikut Tahun Taksiran.
  // Sementara Sprint ini gunakan default RM14,000.

  const maxRelief = 14000.0;

  const calculator = TaxCalculator();

  return calculator.calculate(
    totalSpent: totalSpent,
    maxRelief: maxRelief,
  );
});