import 'package:flutter/material.dart';

/// Warna standar aplikasi YayVIP.
/// Mengikuti brand guideline dari proposal Vernon Indonesia Pintar.
class AppColors {
  AppColors._();

  // Primary (Red - brand utama VIP)
  static const Color primary = Color(0xFFE53935);
  static const Color primaryLight = Color(0xFFFF6F60);
  static const Color primaryDark = Color(0xFFAB000D);

  // Secondary (Dark Gray)
  static const Color secondary = Color(0xFF424242);
  static const Color secondaryLight = Color(0xFF6D6D6D);
  static const Color secondaryDark = Color(0xFF1B1B1B);

  // Neutral
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFE0E0E0);
  static const Color cardGray = Color(0xFF616161);

  // Text
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnDark = Color(0xFFFFFFFF);

  // Status
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF57F17);
  static const Color error = Color(0xFFB71C1C);
  static const Color info = Color(0xFF0277BD);
}
