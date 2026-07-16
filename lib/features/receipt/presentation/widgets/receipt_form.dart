import 'dart:io';

import 'package:flutter/material.dart';

import 'amount_text_field.dart';
import 'assessment_year_dropdown.dart';
import 'category_dropdown.dart';
import 'merchant_text_field.dart';
import 'notes_text_field.dart';
import 'receipt_date_field.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
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

          OutlinedButton.icon(
            onPressed: onCameraPressed,
            icon: const Icon(Icons.camera_alt),
            label: const Text('Ambil Gambar'),
          ),

          const SizedBox(height: 12),

          OutlinedButton.icon(
            onPressed: onGalleryPressed,
            icon: const Icon(Icons.photo_library),
            label: const Text('Pilih Dari Galeri'),
          ),

          if (imagePath != null && imagePath!.isNotEmpty) ...[
            const SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(imagePath!),
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ],
      ),
    );
  }
}