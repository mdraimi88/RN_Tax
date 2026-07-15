import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/create_receipt_request.dart';
import '../../providers/receipt_notifier.dart';

import '../widgets/amount_text_field.dart';
import '../widgets/assessment_year_dropdown.dart';
import '../widgets/category_dropdown.dart';
import '../widgets/merchant_text_field.dart';
import '../widgets/notes_text_field.dart';
import '../widgets/receipt_date_field.dart';

class AddReceiptPage extends ConsumerStatefulWidget {
  const AddReceiptPage({super.key});

  @override
  ConsumerState<AddReceiptPage> createState() => _AddReceiptPageState();
}

class _AddReceiptPageState extends ConsumerState<AddReceiptPage> {
  final _formKey = GlobalKey<FormState>();

  final _merchantController = TextEditingController();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();

  int? _selectedAssessmentYear = 1;
  int? _selectedCategoryId;

  DateTime _receiptDate = DateTime.now();

  bool _isSaving = false;

  @override
  void dispose() {
    _merchantController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickReceiptDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _receiptDate,
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
      helpText: 'Pilih Tarikh Resit',
      cancelText: 'Batal',
      confirmText: 'Pilih',
    );

    if (picked != null) {
      setState(() {
        _receiptDate = picked;
      });
    }
  }

  Future<void> _saveReceipt() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedAssessmentYear == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sila pilih Tahun Taksiran')),
      );
      return;
    }

    if (_selectedCategoryId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Sila pilih Kategori')));
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      await ref
          .read(receiptNotifierProvider.notifier)
          .addReceipt(
            CreateReceiptRequest(
              assessmentYearId: _selectedAssessmentYear!,
              categoryId: _selectedCategoryId!,
              merchant: _merchantController.text.trim(),
              receiptDate: _receiptDate,
              amount: double.parse(_amountController.text),
              notes: _notesController.text.trim().isEmpty
                  ? null
                  : _notesController.text.trim(),
            ),
          );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Resit berjaya disimpan')));

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ralat: $e')));
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Resit')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              MerchantTextField(controller: _merchantController),

              const SizedBox(height: 16),

              AssessmentYearDropdown(
                value: _selectedAssessmentYear,
                onChanged: (value) {
                  setState(() {
                    _selectedAssessmentYear = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              CategoryDropdown(
                value: _selectedCategoryId,
                onChanged: (value) {
                  setState(() {
                    _selectedCategoryId = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              ReceiptDateField(
                selectedDate: _receiptDate,
                onTap: _pickReceiptDate,
              ),

              const SizedBox(height: 16),

              AmountTextField(controller: _amountController),

              const SizedBox(height: 16),

              NotesTextField(controller: _notesController),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _isSaving ? null : _saveReceipt,
                  icon: _isSaving
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.save),
                  label: Text(_isSaving ? 'MENYIMPAN...' : 'SIMPAN RESIT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
