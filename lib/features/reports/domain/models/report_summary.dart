class ReportSummary {
  const ReportSummary({
    required this.totalReceipts,
    required this.totalAmount,
    required this.topCategory,
  });

  final int totalReceipts;
  final double totalAmount;
  final String topCategory;
}