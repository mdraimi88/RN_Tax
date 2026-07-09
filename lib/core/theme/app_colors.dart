import 'package:flutter/material.dart';

/// Centralized color definitions for RN_Tax.
///
/// All application colors must be defined here.
/// Do not use hardcoded colors elsewhere in the project.
class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFF1565C0);
  static const Color secondary = Color(0xFF00897B);

  // Background
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Colors.white;

  // Text
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF616161);

  // Status
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFED6C02);
  static const Color error = Color(0xFFD32F2F);
  static const Color info = Color(0xFF0288D1);

  // Border
  static const Color border = Color(0xFFE0E0E0);
}
