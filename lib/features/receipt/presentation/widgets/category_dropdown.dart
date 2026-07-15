import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../tax/providers/tax_category_list_provider.dart';

class CategoryDropdown extends ConsumerWidget {
  final int? value;
  final ValueChanged<int?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(taxCategoryListProvider);

    return categories.when(
      loading: () => const CircularProgressIndicator(),

      error: (error, stackTrace) {
        return Text(
          error.toString(),
          style: const TextStyle(color: Colors.red),
        );
      },

      data: (items) {
        if (items.isEmpty) {
          return const Text('Tiada kategori');
        }

        return DropdownButtonFormField<int>(
          initialValue: value,
          decoration: const InputDecoration(
            labelText: 'Kategori Pelepasan',
            prefixIcon: Icon(Icons.category),
            border: OutlineInputBorder(),
          ),
          items: items
              .map(
                (category) => DropdownMenuItem<int>(
                  value: category.id,
                  child: Text(category.nameMs),
                ),
              )
              .toList(),
          onChanged: onChanged,
          validator: (value) {
            if (value == null) {
              return 'Sila pilih kategori';
            }
            return null;
          },
        );
      },
    );
  }
}
