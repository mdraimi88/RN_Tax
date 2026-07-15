import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountTextField extends StatelessWidget {
  final TextEditingController controller;

  const AmountTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      decoration: const InputDecoration(
        labelText: 'Jumlah (RM)',
        prefixIcon: Icon(Icons.attach_money),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Sila masukkan jumlah';
        }

        final amount = double.tryParse(value);

        if (amount == null || amount <= 0) {
          return 'Jumlah tidak sah';
        }

        return null;
      },
    );
  }
}
