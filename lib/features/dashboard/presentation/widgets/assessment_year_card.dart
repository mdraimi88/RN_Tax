import 'package:flutter/material.dart';

import 'info_card.dart';

class AssessmentYearCard extends StatelessWidget {
  const AssessmentYearCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoCard(
      title: 'Tahun Taksiran',
      value: '2026',
      icon: Icons.calendar_today,
    );
  }
}
