import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/app_formatter.dart';
import '../../providers/top_category_provider.dart';

class TopCategoryCard extends ConsumerWidget {
  const TopCategoryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topCategories = ref.watch(topCategoryProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: topCategories.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),

          error: (error, stack) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Spending Categories',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Text(
                'Failed to load categories.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
          ),

          data: (categories) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Spending Categories',
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                const SizedBox(height: 16),

                if (categories.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text('No receipt data available.'),
                    ),
                  )
                else
                  ...categories.map(
                        (category) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        child: Text(category.categoryCode),
                      ),
                      title: Text(category.categoryName),
                      trailing: Text(
                        AppFormatter.currency(category.totalAmount),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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