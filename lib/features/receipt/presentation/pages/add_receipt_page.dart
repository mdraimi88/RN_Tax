import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/receipt_notifier.dart';
import '../widgets/amount_text_field.dart';
import '../widgets/merchant_text_field.dart';
import '../widgets/notes_text_field.dart';
import '../../domain/models/create_receipt_request.dart';

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

  bool _isSaving = false;

  @override
  void dispose() {
    _merchantController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _saveReceipt() async {
    if (!_formKey.currentState!.validate()) {
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
              assessmentYearId: 1,
              categoryId: 1,
              merchant: _merchantController.text.trim(),
              receiptDate: DateTime.now(),
              amount: double.parse(_amountController.text),
              notes: _notesController.text.trim(),
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

              AmountTextField(controller: _amountController),

              const SizedBox(height: 16),

              NotesTextField(controller: _notesController),

              const SizedBox(height: 30),

              SizedBox(
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
