import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main_navigation.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final FloatingActionButton? floatingActionButton;

  const AppShell({
    super.key,
    required this.child,
    required this.currentIndex,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: MainNavigation(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/receipts');
              break;
            case 2:
              context.go('/reports');
              break;
            case 3:
              context.go('/settings');
              break;
          }
        },
      ),
    );
  }
}