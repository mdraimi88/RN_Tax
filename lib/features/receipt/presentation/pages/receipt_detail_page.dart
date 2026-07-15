import 'package:flutter/material.dart';

import '../../../../core/database/database.dart';

class ReceiptDetailPage extends StatelessWidget {
  final Receipt receipt;

  const ReceiptDetailPage({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maklumat Resit')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Nama Kedai'),
            subtitle: Text(receipt.merchant),
          ),

          ListTile(
            leading: const Icon(Icons.attach_money),
            title: const Text('Jumlah'),
            subtitle: Text('RM ${receipt.amount.toStringAsFixed(2)}'),
          ),

          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Tarikh'),
            subtitle: Text(receipt.receiptDate.toString()),
          ),

          ListTile(
            leading: const Icon(Icons.notes),
            title: const Text('Nota'),
            subtitle: Text(receipt.notes ?? '-'),
          ),

          const SizedBox(height: 30),

          FilledButton.icon(
            onPressed: () {
              // Sprint seterusnya
            },
            icon: const Icon(Icons.edit),
            label: const Text('EDIT'),
          ),

          const SizedBox(height: 16),

          FilledButton.tonalIcon(
            onPressed: () {
              // Sprint seterusnya
            },
            icon: const Icon(Icons.delete),
            label: const Text('PADAM'),
          ),
        ],
      ),
    );
  }
}
