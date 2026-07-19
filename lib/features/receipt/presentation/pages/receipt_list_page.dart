import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/receipt_list_card.dart';
import '../widgets/receipt_search_bar.dart';

class ReceiptListPage extends StatefulWidget {
  const ReceiptListPage({super.key});

  @override
  State<ReceiptListPage> createState() => _ReceiptListPageState();
}

class _ReceiptListPageState extends State<ReceiptListPage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Resit'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future<void>.delayed(
            const Duration(milliseconds: 300),
          );
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ReceiptSearchBar(
              controller: _searchController,
              onChanged: (value) {
                // Akan disambungkan kepada provider
                // dalam sprint seterusnya.
                setState(() {});
              },
            ),
            const SizedBox(height: 16),
            const ReceiptListCard(
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