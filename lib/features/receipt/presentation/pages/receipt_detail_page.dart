import 'package:flutter/material.dart';

import '../../../../core/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/receipt_notifier.dart';

class ReceiptDetailPage extends ConsumerWidget {
  final Receipt receipt;

  const ReceiptDetailPage({super.key, required this.receipt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Padam Resit'),
                    content: const Text(
                      'Adakah anda pasti mahu memadam resit ini?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('BATAL'),
                      ),
                      FilledButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const Text('PADAM'),
                      ),
                    ],
                  );
                },
              );

              if (confirm != true) return;

              try {
                await ref
                    .read(receiptNotifierProvider.notifier)
                    .deleteReceipt(receipt.id);

                if (!context.mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Resit berjaya dipadam')),
                );

                Navigator.pop(context);
              } catch (e) {
                if (!context.mounted) return;

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Ralat: $e')));
              }
            },
            icon: const Icon(Icons.delete),
            label: const Text('PADAM'),
          ),
        ],
      ),
    );
  }
}
