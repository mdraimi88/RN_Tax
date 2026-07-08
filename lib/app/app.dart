import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'router.dart';

class RNTaxApp extends StatelessWidget {
  const RNTaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '<<re^!^Y>> Tax',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.light,
    );
  }
}