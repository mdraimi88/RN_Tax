import 'package:flutter/material.dart';

class MerchantTextField extends StatelessWidget {
  final TextEditingController controller;

  const MerchantTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        labelText: 'Nama Institusi',
        hintText: 'Contoh: KPJ, JMC, Zurich Takaful',
        prefixIcon: Icon(Icons.store),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Sila masukkan nama kedai';
        }
        return null;
      },
    );
  }
}
