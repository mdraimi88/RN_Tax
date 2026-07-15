import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/assessment_year_card.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/database_status_card.dart';
import '../widgets/receipt_summary_card.dart';
import '../widgets/tax_relief_card.dart';

import '../../../receipt/presentation/pages/add_receipt_page.dart';
import '../../../receipt/presentation/widgets/receipt_list_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'add_receipt',
        tooltip: 'Tambah Resit',
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const AddReceiptPage()));
        },
      ),

      body: const SingleChildScrollView(
        child: Column(
          children: [
            DashboardHeader(),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  AssessmentYearCard(),

                  SizedBox(height: 16),

                  ReceiptSummaryCard(),

                  SizedBox(height: 16),

                  TaxReliefCard(),

                  SizedBox(height: 16),

                  DatabaseStatusCard(),
                  SizedBox(height: 16),

                  ReceiptListCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
