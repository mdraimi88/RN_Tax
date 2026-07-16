import '../domain/models/relief_summary.dart';

class TaxCalculator {
  const TaxCalculator();

  ReliefSummary calculate({
    required double totalSpent,
    required double maxRelief,
  }) {
    final eligible = totalSpent > maxRelief
        ? maxRelief
        : totalSpent;

    final remaining =
    (maxRelief - eligible).clamp(0.0, maxRelief).toDouble();

    final progress = maxRelief == 0
        ? 0.0
        : (eligible / maxRelief).toDouble();

    return ReliefSummary(
      totalSpent: totalSpent,
      eligibleRelief: eligible,
      remainingRelief: remaining,
      maxRelief: maxRelief,
      progress: progress,
    );
  }
}