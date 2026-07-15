import 'package:flutter/material.dart';

class NotesTextField extends StatelessWidget {
  final TextEditingController controller;

  const NotesTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 4,
      decoration: const InputDecoration(
        labelText: 'Nota',
        hintText: 'Maklumat tambahan...',
        prefixIcon: Icon(Icons.notes),
        border: OutlineInputBorder(),
      ),
    );
  }
}
