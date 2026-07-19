import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/app_formatter.dart';
import '../../providers/report_provider.dart';

class ReportPage extends ConsumerWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(reportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: reportAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        data: (report) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: ListTile(
                  leading: const Icon(Icons.payments_outlined),
                  title: const Text('Total Spending'),
                  subtitle: Text(
                    AppFormatter.currency(report.totalAmount),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.receipt_long),
                  title: const Text('Total Receipts'),
                  subtitle: Text(
                    report.totalReceipts.toString(),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.category_outlined),
                  title: const Text('Top Category'),
                  subtitle: Text(report.topCategory),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Export',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.picture_as_pdf),
                  title: const Text('Generate Tax Report'),
                  subtitle: const Text(
                    'Generate a PDF tax summary',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Sprint 14.5
                  },
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.folder_zip_outlined),
                  title: const Text('Evidence Pack'),
                  subtitle: const Text('Coming Soon'),
                  enabled: false,
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.backup_outlined),
                  title: const Text('Export & Backup'),
                  subtitle: const Text('Coming Soon'),
                  enabled: false,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}