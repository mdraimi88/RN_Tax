import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '<<re^!^Y>> Tax System',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 6),
        Text(
          'Malaysia Personal Tax Assistant',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
