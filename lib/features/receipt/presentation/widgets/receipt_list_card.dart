import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/receipt_provider.dart';

class ReceiptListCard extends ConsumerWidget {
  const ReceiptListCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receipts = ref.watch(receiptProvider);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: receipts.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),

          error: (e, _) => Text(
            e.toString(),
            style: const TextStyle(color: Colors.red),
          ),

          data: (items) {
            if (items.isEmpty) {
              return const Text(
                'Tiada resit direkodkan.',
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Resit Terbaru',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                ...items.take(5).map(
                      (receipt) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.receipt_long),
                    title: Text(receipt.merchant),
                    subtitle: Text(receipt.receiptDate.toString()),
                    trailing: Text(
                      'RM ${receipt.amount.toStringAsFixed(2)}',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}