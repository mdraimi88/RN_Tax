import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/app_formatter.dart';
import '../../../tax/providers/tax_summary_provider.dart';

class TaxProgressCard extends ConsumerWidget {
  const TaxProgressCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(taxSummaryProvider);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: summary.when(
          loading: () => const SizedBox(
            height: 120,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, _) => SizedBox(
            height: 120,
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
                    Icon(Icons.trending_up),
                    SizedBox(width: 8),
                    Text(
                      'Progress Pelepasan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                LinearProgressIndicator(
                  value: data.progress,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(8),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppFormatter.percentage(data.progress),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${AppFormatter.currency(data.eligibleRelief)} / ${AppFormatter.currency(data.maxRelief)}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}