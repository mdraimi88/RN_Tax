import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../receipt/presentation/widgets/receipt_list_card.dart';
import '../widgets/assessment_year_card.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_summary_card.dart';
import '../widgets/tax_progress_card.dart';
import '../widgets/tax_relief_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'add_receipt',
        tooltip: 'Tambah Resit',
        onPressed: () => context.push('/receipts/add'),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DashboardHeader(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AssessmentYearCard(),
                  const SizedBox(height: 16),

                  const DashboardSummaryCard(),
                  const SizedBox(height: 16),

                  const TaxProgressCard(),
                  const SizedBox(height: 16),

                  const TaxReliefCard(),
                  const SizedBox(height: 16),

                  const ReceiptListCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}