import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/search_query_provider.dart';

class SearchReceiptCard extends ConsumerWidget {
  const SearchReceiptCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Cari resit...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            ref.read(receiptSearchProvider.notifier).state = value;
          },
        ),
      ),
    );
  }
}