/// Represents the total spending for a tax relief category.
///
/// Used by:
/// - Dashboard
/// - Reports
/// - PDF Export
/// - Future AI Tax Assistant
class TopCategorySummary {
  final int categoryId;
  final String categoryCode;
  final String categoryName;
  final double totalAmount;

  const TopCategorySummary({
    required this.categoryId,
    required this.categoryCode,
    required this.categoryName,
    required this.totalAmount,
  });
}