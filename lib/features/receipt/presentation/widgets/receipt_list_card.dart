import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../pages/receipt_detail_page.dart';
import '../../providers/filtered_receipt_provider.dart';

class ReceiptListCard extends ConsumerWidget {
  const ReceiptListCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiptAsync = ref.watch(filteredReceiptProvider);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: receiptAsync.when(
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          ),

          error: (error, stackTrace) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Resit Terbaru',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              Text(error.toString(), style: const TextStyle(color: Colors.red)),
            ],
          ),

          data: (receipts) {
            if (receipts.isEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Resit Terbaru',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 16),

                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Tiada resit direkodkan.'),
                    ),
                  ),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Resit Terbaru',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                ...receipts
                    .take(5)
                    .map(
                      (receipt) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const CircleAvatar(
                          child: Icon(Icons.receipt_long),
                        ),

                        title: Text(receipt.merchant),

                        subtitle: Text(
                          DateFormat('dd/MM/yyyy').format(receipt.receiptDate),
                        ),

                        trailing: Text(
                          'RM ${receipt.amount.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ReceiptDetailPage(receipt: receipt),
                            ),
                          );
                        },
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
