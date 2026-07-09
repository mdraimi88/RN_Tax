import 'package:flutter/material.dart';

import '../widgets/dashboard_header.dart';
import '../widgets/assessment_year_card.dart';
import '../widgets/receipt_summary_card.dart';
import '../widgets/tax_relief_card.dart';
import '../widgets/database_status_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('<<re^!^Y>> Tax System'),
        centerTitle: true,
      ),
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
