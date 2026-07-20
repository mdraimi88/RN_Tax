import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../receipt/providers/receipt_provider.dart';
import 'info_card.dart';

class ReceiptSummaryCard extends ConsumerWidget {
  const ReceiptSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receipts = ref.watch(receiptListProvider);
    final totalAmount = ref.watch(totalReceiptAmountProvider);

    return receipts.when(
      loading: () => const InfoCard(
        title: 'Ringkasan Resit',
        value: 'Loading...',
        icon: Icons.receipt_long,
      ),

      error: (error, stackTrace) {
        debugPrint('====================================');
        debugPrint('Receipt Provider Error');
        debugPrint(error.toString());
        debugPrint(stackTrace.toString());
        debugPrint('====================================');

        return InfoCard(
          title: 'Ringkasan Resit',
          value: error.toString(),
          icon: Icons.error_outline,
        );
      },

      data: (receiptList) {
        return totalAmount.when(
          loading: () => InfoCard(
            title: 'Ringkasan Resit',
            value: '${receiptList.length} Resit',
            icon: Icons.receipt_long,
          ),

          error: (error, stackTrace) {
            debugPrint('====================================');
            debugPrint('Total Amount Error');
            debugPrint(error.toString());
            debugPrint(stackTrace.toString());
            debugPrint('====================================');

            return InfoCard(
              title: 'Ringkasan Resit',
              value: error.toString(),
              icon: Icons.error_outline,
            );
          },

          data: (amount) {
            return InfoCard(
              title: 'Ringkasan Resit',
              value:
                  '${receiptList.length} Resit\nRM ${amount.toStringAsFixed(2)}',
              icon: Icons.receipt_long,
            );
          },
        );
      },
    );
  }
}
