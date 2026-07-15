class CreateReceiptRequest {
  final int assessmentYearId;
  final int categoryId;
  final String merchant;
  final DateTime receiptDate;
  final double amount;
  final String imagePath;
  final String? notes;

  const CreateReceiptRequest({
    required this.assessmentYearId,
    required this.categoryId,
    required this.merchant,
    required this.receiptDate,
    required this.amount,
    this.imagePath = '',
    this.notes,
  });
}
