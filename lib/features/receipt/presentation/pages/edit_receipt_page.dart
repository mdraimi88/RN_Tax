import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/database.dart';

import '../../providers/image_picker_provider.dart';
import '../../providers/receipt_notifier.dart';

import '../widgets/receipt_form.dart';

import '../../../tax/providers/assessment_year_list_provider.dart';

class EditReceiptPage extends ConsumerStatefulWidget {
  final Receipt receipt;

  const EditReceiptPage({
    super.key,
    required this.receipt,
  });

  @override
  ConsumerState<EditReceiptPage> createState() => _EditReceiptPageState();
}

class _EditReceiptPageState extends ConsumerState<EditReceiptPage> {
final _formKey = GlobalKey<FormState>();

late final TextEditingController _merchantController;
late final TextEditingController _amountController;
late final TextEditingController _notesController;

int? _selectedAssessmentYear;
int? _selectedCategoryId;

late DateTime _receiptDate;

String? _imagePath;

bool _isSaving = false;

@override
void initState() {
super.initState();

final receipt = widget.receipt;

_merchantController = TextEditingController(
text: receipt.merchant,
);

_amountController = TextEditingController(
text: receipt.amount.toStringAsFixed(2),
);

_notesController = TextEditingController(
text: receipt.notes ?? '',
);

_selectedAssessmentYear = receipt.assessmentYearId;
_selectedCategoryId = receipt.categoryId;

_receiptDate = receipt.receiptDate;

_imagePath = receipt.imagePath;

WidgetsBinding.instance.addPostFrameCallback((_) async {
await ref.read(assessmentYearListProvider.future);

if (!mounted) return;

setState(() {});
});
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
helpText: 'Pilih Tarikh Resit',
cancelText: 'Batal',
confirmText: 'Pilih',
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

Future<void> _updateReceipt() async {
if (!_formKey.currentState!.validate()) {
return;
}

if (_selectedAssessmentYear == null) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Sila pilih Tahun Taksiran',
),
),
);
return;
}

if (_selectedCategoryId == null) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Sila pilih Kategori',
),
),
);
return;
}

setState(() {
_isSaving = true;
});

try {
final updatedReceipt = widget.receipt.copyWith(
assessmentYearId: _selectedAssessmentYear!,
categoryId: _selectedCategoryId!,
merchant: _merchantController.text.trim(),
receiptDate: _receiptDate,
amount: double.parse(_amountController.text),
imagePath: _imagePath ?? '',
notes: Value(
_notesController.text.trim().isEmpty
? null
: _notesController.text.trim(),
),
updatedAt: Value(DateTime.now()),
);
await ref
    .read(receiptNotifierProvider.notifier)
    .updateReceipt(updatedReceipt);

if (!mounted) return;

ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text('Resit berjaya dikemaskini'),
  ),
);

Navigator.pop(context, true);
} catch (e) {
  if (!mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Ralat: $e'),
    ),
  );
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
    appBar: AppBar(
      title: const Text('Kemaskini Resit'),
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
                onPressed: _isSaving ? null : _updateReceipt,
                icon: _isSaving
                    ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
                    : const Icon(Icons.save),
                label: Text(
                  _isSaving
                      ? 'MENGEMASKINI...'
                      : 'KEMASKINI RESIT',
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