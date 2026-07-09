import 'package:flutter/material.dart';

import 'info_card.dart';

class ReceiptSummaryCard extends StatelessWidget {
  const ReceiptSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoCard(
      title: 'Jumlah Resit',
      value: '0',
      icon: Icons.receipt_long,
    );
  }
}
