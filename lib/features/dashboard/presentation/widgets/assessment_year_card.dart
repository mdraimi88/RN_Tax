import 'package:flutter/material.dart';

import 'info_card.dart';

class AssessmentYearCard extends StatelessWidget {
  const AssessmentYearCard({super.key});

  @override
  Widget build(BuildContext context) {
    final assessmentYear = DateTime.now().year - 1;

    return InfoCard(
      title: 'Tahun Taksiran',
      value: assessmentYear.toString(),
      icon: Icons.calendar_today,
    );
  }
}