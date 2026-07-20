import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/assessment_year_provider.dart';

class AssessmentYearCard extends ConsumerWidget {
  const AssessmentYearCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedYear = ref.watch(assessmentYearProvider);
    final notifier = ref.read(assessmentYearProvider.notifier);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.calendar_month, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: DropdownButtonFormField<int>(
                initialValue: selectedYear,
                decoration: const InputDecoration(
                  labelText: 'Tahun Taksiran',
                  border: InputBorder.none,
                ),
                items: notifier.availableYears.map((year) {
                  return DropdownMenuItem(
                    value: year,
                    child: Text(year.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    notifier.setYear(value);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}