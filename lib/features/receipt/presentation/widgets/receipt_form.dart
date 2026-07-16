import 'package:flutter/material.dart';

import 'amount_text_field.dart';
import 'assessment_year_dropdown.dart';
import 'category_dropdown.dart';
import 'merchant_text_field.dart';
import 'notes_text_field.dart';
import 'receipt_date_field.dart';
import 'receipt_image_card.dart';

class ReceiptForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController merchantController;
  final TextEditingController amountController;
  final TextEditingController notesController;

  final int? assessmentYearId;
  final int? categoryId;

  final DateTime receiptDate;

  final String? imagePath;

  final ValueChanged<int?> onAssessmentYearChanged;
  final ValueChanged<int?> onCategoryChanged;

  final VoidCallback onPickReceiptDate;
  final VoidCallback onCameraPressed;
  final VoidCallback onGalleryPressed;

  /// Widget di bahagian bawah form.
  /// Contoh:
  /// - Add Receipt -> Butang SIMPAN
  /// - Edit Receipt -> Butang KEMASKINI
  final Widget footer;

  const ReceiptForm({
    super.key,
    required this.formKey,
    required this.merchantController,
    required this.amountController,
    required this.notesController,
    required this.assessmentYearId,
    required this.categoryId,
    required this.receiptDate,
    required this.imagePath,
    required this.onAssessmentYearChanged,
    required this.onCategoryChanged,
    required this.onPickReceiptDate,
    required this.onCameraPressed,
    required this.onGalleryPressed,
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MerchantTextField(
            controller: merchantController,
          ),

          const SizedBox(height: 16),

          AssessmentYearDropdown(
            value: assessmentYearId,
            onChanged: onAssessmentYearChanged,
          ),

          const SizedBox(height: 16),

          CategoryDropdown(
            value: categoryId,
            onChanged: onCategoryChanged,
          ),

          const SizedBox(height: 16),

          ReceiptDateField(
            selectedDate: receiptDate,
            onTap: onPickReceiptDate,
          ),

          const SizedBox(height: 16),

          AmountTextField(
            controller: amountController,
          ),

          const SizedBox(height: 16),

          NotesTextField(
            controller: notesController,
          ),

          const SizedBox(height: 24),

          ReceiptImageCard(
            imagePath: imagePath,
            onCameraPressed: onCameraPressed,
            onGalleryPressed: onGalleryPressed,
          ),

          const SizedBox(height: 30),

          footer,
        ],
      ),
    );
  }
}