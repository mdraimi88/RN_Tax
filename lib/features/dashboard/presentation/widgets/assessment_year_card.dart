import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../tax/providers/assessment_year_provider.dart';
import 'info_card.dart';

class AssessmentYearCard extends ConsumerWidget {
  const AssessmentYearCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeYear = ref.watch(activeAssessmentYearProvider);

    return activeYear.when(
      loading: () => const InfoCard(
        title: 'Tahun Taksiran',
        value: 'Loading...',
        icon: Icons.calendar_today,
      ),

      error: (_, _) => const InfoCard(
        title: 'Tahun Taksiran',
        value: 'Error',
        icon: Icons.calendar_today,
      ),

      data: (year) => InfoCard(
        title: 'Tahun Taksiran',
        value: year?.year.toString() ?? '-',
        icon: Icons.calendar_today,
      ),
    );
  }
}
