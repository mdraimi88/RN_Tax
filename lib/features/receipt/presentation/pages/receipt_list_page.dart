import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/receipt_list_card.dart';

class ReceiptListPage extends StatelessWidget {
  const ReceiptListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Resit'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Future enhancement:
          // Trigger provider refresh here if needed.
          await Future<void>.delayed(const Duration(milliseconds: 300));
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            ReceiptListCard(
              limit: null,
              showHeader: false,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/receipts/add');
        },
        icon: const Icon(Icons.add),
        label: const Text('Tambah Resit'),
      ),
    );
  }
}