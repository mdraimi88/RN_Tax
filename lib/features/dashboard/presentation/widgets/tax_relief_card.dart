import 'package:flutter/material.dart';

import 'info_card.dart';

class TaxReliefCard extends StatelessWidget {
  const TaxReliefCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoCard(
      title: 'Jumlah Pelepasan',
      value: 'RM0.00',
      icon: Icons.savings,
    );
  }
}
