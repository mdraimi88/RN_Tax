class TaxReport {
  final int assessmentYear;

  final double totalSpent;

  final double totalEligibleRelief;

  final double remainingRelief;

  final double maximumRelief;

  const TaxReport({
    required this.assessmentYear,
    required this.totalSpent,
    required this.totalEligibleRelief,
    required this.remainingRelief,
    required this.maximumRelief,
  });
}