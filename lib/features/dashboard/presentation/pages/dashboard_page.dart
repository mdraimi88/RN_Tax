import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/assessment_year_card.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/database_status_card.dart';
import '../widgets/tax_relief_card.dart';

import '../../../receipt/presentation/pages/add_receipt_page.dart';
import '../../../receipt/presentation/widgets/receipt_list_card.dart';
import '../../../receipt/presentation/widgets/search_receipt_card.dart';
import '../widgets/dashboard_summary_card.dart';
import '../widgets/tax_progress_card.dart';

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

      body: SingleChildScrollView(
        child: Column(
          children: [
            DashboardHeader(),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  AssessmentYearCard(),

                  SizedBox(height: 16),

                  DashboardSummaryCard(),
                  const SizedBox(height: 16),

                  TaxProgressCard(),

                  const SizedBox(height: 16),


                  TaxReliefCard(),

                  SizedBox(height: 16),

                  DatabaseStatusCard(),
                  SizedBox(height: 16),
                  SearchReceiptCard(),

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
