import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceiptDateField extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onTap;

  const ReceiptDateField({
    super.key,
    required this.selectedDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Tarikh Resit',
          prefixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(),
        ),
        child: Text(
          DateFormat('dd/MM/yyyy').format(selectedDate),
        ),
      ),
    );
  }
}