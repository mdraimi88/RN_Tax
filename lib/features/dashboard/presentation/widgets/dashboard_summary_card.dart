import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/app_formatter.dart';
import '../../../tax/providers/tax_summary_provider.dart';

class DashboardSummaryCard extends ConsumerWidget {
  const DashboardSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(taxSummaryProvider);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: summary.when(
          loading: () => const SizedBox(
            height: 160,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, _) => SizedBox(
            height: 160,
            child: Center(
              child: Text(error.toString()),
            ),
          ),
          data: (data) {
            return Column(
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

                _SummaryTile(
                  title: 'Jumlah Perbelanjaan',
                  value: AppFormatter.currency(data.totalSpent),
                  icon: Icons.receipt_long,
                  color: Colors.blue,
                ),

                const SizedBox(height: 12),

                _SummaryTile(
                  title: 'Pelepasan Layak',
                  value: AppFormatter.currency(data.eligibleRelief),
                  icon: Icons.account_balance_wallet,
                  color: Colors.green,
                ),

                const SizedBox(height: 12),

                _SummaryTile(
                  title: 'Baki Pelepasan',
                  value: AppFormatter.currency(data.remainingRelief),
                  icon: Icons.savings,
                  color: Colors.orange,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SummaryTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryTile({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.15),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}