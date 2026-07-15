import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../tax/providers/assessment_year_list_provider.dart';

class AssessmentYearDropdown extends ConsumerWidget {
  final int? value;
  final ValueChanged<int?> onChanged;

  const AssessmentYearDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final years = ref.watch(assessmentYearListProvider);

    return years.when(
      loading: () => const CircularProgressIndicator(),

      error: (error, stackTrace) {
        return Text(
          error.toString(),
          style: const TextStyle(color: Colors.red),
        );
      },

      data: (items) {
        if (items.isEmpty) {
          return const Text('Tiada Tahun Taksiran');
        }

        return DropdownButtonFormField<int>(
          initialValue: value,
          decoration: const InputDecoration(
            labelText: 'Tahun Taksiran',
            prefixIcon: Icon(Icons.calendar_today),
            border: OutlineInputBorder(),
          ),
          items: items
              .map(
                (year) => DropdownMenuItem<int>(
                  value: year.id,
                  child: Text(year.year.toString()),
                ),
              )
              .toList(),
          onChanged: onChanged,
          validator: (value) {
            if (value == null) {
              return 'Sila pilih tahun taksiran';
            }
            return null;
          },
        );
      },
    );
  }
}
