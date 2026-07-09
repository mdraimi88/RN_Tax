import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/assessment_year_card.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/database_status_card.dart';
import '../widgets/receipt_summary_card.dart';
import '../widgets/tax_relief_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('<<re^!^y>>')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DashboardHeader(),

            SizedBox(height: 20),

            AssessmentYearCard(),

            SizedBox(height: 16),

            ReceiptSummaryCard(),

            SizedBox(height: 16),

            TaxReliefCard(),

            SizedBox(height: 16),

            DatabaseStatusCard(),
          ],
        ),
      ),
    );
  }
}
