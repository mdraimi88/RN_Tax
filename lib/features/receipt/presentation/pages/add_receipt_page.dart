import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/image_picker_provider.dart';
import '../widgets/receipt_form.dart';

class AddReceiptPage extends ConsumerStatefulWidget {
  const AddReceiptPage({super.key});

  @override
  ConsumerState<AddReceiptPage> createState() => _AddReceiptPageState();
}

class _AddReceiptPageState extends ConsumerState<AddReceiptPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _merchantController;
  late final TextEditingController _amountController;
  late final TextEditingController _notesController;

  int? _selectedAssessmentYear;
  int? _selectedCategoryId;

  DateTime _receiptDate = DateTime.now();

  String? _imagePath;

  final bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    _merchantController = TextEditingController();
    _amountController = TextEditingController();
    _notesController = TextEditingController();
  }

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
    );

    if (picked == null) return;

    setState(() {
      _receiptDate = picked;
    });
  }

  Future<void> _pickImageFromCamera() async {
    final picker = ref.read(imagePickerProvider);

    final image = await picker.pickFromCamera();

    if (image == null) return;

    setState(() {
      _imagePath = image.path;
    });
  }

  Future<void> _pickImageFromGallery() async {
    final picker = ref.read(imagePickerProvider);

    final image = await picker.pickFromGallery();

    if (image == null) return;

    setState(() {
      _imagePath = image.path;
    });
  }

  Future<void> _saveReceipt() async {
    // Implement pada Sprint berikutnya.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Resit'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ReceiptForm(
              formKey: _formKey,
              merchantController: _merchantController,
              amountController: _amountController,
              notesController: _notesController,
              assessmentYearId: _selectedAssessmentYear,
              categoryId: _selectedCategoryId,
              receiptDate: _receiptDate,
              imagePath: _imagePath,
              onAssessmentYearChanged: (value) {
                setState(() {
                  _selectedAssessmentYear = value;
                });
              },
              onCategoryChanged: (value) {
                setState(() {
                  _selectedCategoryId = value;
                });
              },
              onPickReceiptDate: _pickReceiptDate,
              onCameraPressed: _pickImageFromCamera,
              onGalleryPressed: _pickImageFromGallery,
              footer: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: _isSaving ? null : _saveReceipt,
                  icon: _isSaving
                      ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : const Icon(Icons.save),
                  label: Text(
                    _isSaving ? 'MENYIMPAN...' : 'SIMPAN RESIT',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}