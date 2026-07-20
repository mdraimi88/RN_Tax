import 'package:flutter/material.dart';

Future<bool?> showDeleteReceiptDialog(
    BuildContext context, {
      required String merchant,
    }) {
  return showDialog<bool>(
    context: context,
    builder: (_) {
      return AlertDialog(
        icon: const Icon(
          Icons.delete_outline,
          color: Colors.red,
        ),
        title: const Text('Padam Resit'),
        content: Text(
          'Adakah anda pasti mahu memadam resit "$merchant"?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Padam'),
          ),
        ],
      );
    },
  );
}