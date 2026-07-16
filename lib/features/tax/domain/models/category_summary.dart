class CategorySummary {
  final int categoryId;

  final String categoryName;

  final double spent;

  final double eligible;

  final double limit;

  const CategorySummary({
    required this.categoryId,
    required this.categoryName,
    required this.spent,
    required this.eligible,
    required this.limit,
  });
}