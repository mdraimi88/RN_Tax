class TaxRule {
  final int id;
  final int assessmentYearId;
  final String code;
  final String name;
  final double maxAmount;
  final bool isEnabled;
  final int sortOrder;

  const TaxRule({
    required this.id,
    required this.assessmentYearId,
    required this.code,
    required this.name,
    required this.maxAmount,
    required this.isEnabled,
    required this.sortOrder,
  });
}