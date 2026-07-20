import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/app_formatter.dart';
import '../../../tax/providers/tax_summary_provider.dart';
import 'info_card.dart';

class TaxReliefCard extends ConsumerWidget {
  const TaxReliefCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(taxSummaryProvider);

    return summary.when(
      loading: () => const InfoCard(
        title: 'Jumlah Pelepasan',
        value: 'Loading...',
        icon: Icons.savings,
      ),
      error: (_, _) => const InfoCard(
        title: 'Jumlah Pelepasan',
        value: '-',
        icon: Icons.savings,
      ),
      data: (data) => InfoCard(
        title: 'Jumlah Pelepasan',
        value: AppFormatter.currency(data.eligibleRelief),
        icon: Icons.savings,
      ),
    );
  }
}