import 'package:flutter/material.dart';

import 'info_card.dart';

class DatabaseStatusCard extends StatelessWidget {
  const DatabaseStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoCard(
      title: 'Database',
      value: 'READY',
      icon: Icons.storage,
    );
  }
}
