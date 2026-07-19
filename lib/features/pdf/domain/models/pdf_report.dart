class PdfReport {
  final int assessmentYear;
  final DateTime generatedAt;

  final int totalReceipts;
  final double totalAmount;
  final double totalTaxRelief;

  final String topCategory;

  const PdfReport({
    required this.assessmentYear,
    required this.generatedAt,
    required this.totalReceipts,
    required this.totalAmount,
    required this.totalTaxRelief,
    required this.topCategory,
  });
}