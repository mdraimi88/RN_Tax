import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../receipt/providers/receipt_provider.dart';

class DashboardSummaryCard extends ConsumerWidget {
  const DashboardSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalAmount = ref.watch(totalReceiptAmountProvider);
    final totalCount = ref.watch(totalReceiptCountProvider);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.summarize),
                SizedBox(width: 8),
                Text(
                  'Ringkasan Pelepasan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: totalAmount.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (_, _) => const Text('-'),
                    data: (amount) {
                      return _SummaryItem(
                        title: 'Jumlah Pelepasan',
                        value: 'RM ${amount.toStringAsFixed(2)}',
                        icon: Icons.account_balance_wallet,
                        color: Colors.green,
                      );
                    },
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: totalCount.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (_, _) => const Text('-'),
                    data: (count) {
                      return _SummaryItem(
                        title: 'Jumlah Resit',
                        value: '$count',
                        icon: Icons.receipt_long,
                        color: Colors.blue,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 32,
          ),

          const SizedBox(height: 12),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}