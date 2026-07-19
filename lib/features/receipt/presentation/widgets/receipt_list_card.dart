import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/app_formatter.dart';
import '../../providers/filtered_receipt_provider.dart';
import '../pages/receipt_detail_page.dart';

class ReceiptListCard extends ConsumerWidget {
  const ReceiptListCard({
    super.key,
    this.limit = 5,
    this.showHeader = true,
  });

  final int? limit;
  final bool showHeader;

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
              if (showHeader) ...[
                const Text(
                  'Resit Terbaru',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
              ],

              Text(
                error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),

          data: (receipts) {
            final displayReceipts =
            limit == null ? receipts : receipts.take(limit!).toList();

            if (displayReceipts.isEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showHeader) ...[
                    const Text(
                      'Resit Terbaru',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  const Center(
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
                if (showHeader) ...[
                  const Text(
                    'Resit Terbaru',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                ...displayReceipts.map(
                      (receipt) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(
                      child: Icon(Icons.receipt_long),
                    ),
                    title: Text(receipt.merchant),
                    subtitle: Text(
                      AppFormatter.date(receipt.receiptDate),
                    ),
                    trailing: Text(
                      AppFormatter.currency(receipt.amount),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
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