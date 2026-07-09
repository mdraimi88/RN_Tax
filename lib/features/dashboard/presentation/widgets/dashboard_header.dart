import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '<<re^!^y>>',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 6),
        Text(
          'Personal Tax System',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
