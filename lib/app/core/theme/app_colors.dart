import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Brand Colors
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF4B45B8);
  static const Color primaryLight = Color(0xFF9B97FF);

  // Secondary Colors
  static const Color secondary = Color(0xFF00D9A3);
  static const Color secondaryDark = Color(0xFF00A17C);
  static const Color secondaryLight = Color(0xFF4DFFCD);

  // Accent Colors
  static const Color accent = Color(0xFFFF6B6B);
  static const Color accentDark = Color(0xFFE85555);
  static const Color accentLight = Color(0xFFFF9999);

  // Success, Warning, Error
  static const Color success = Color(0xFF00D9A3);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFFF5252);
  static const Color info = Color(0xFF42A5F5);

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFFAFAFA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightDivider = Color(0xFFE0E0E0);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCard = Color(0xFF2C2C2C);
  static const Color darkDivider = Color(0xFF3A3A3A);

  // Text Colors - Light Theme
  static const Color lightTextPrimary = Color(0xFF212121);
  static const Color lightTextSecondary = Color(0xFF757575);
  static const Color lightTextHint = Color(0xFFBDBDBD);

  // Text Colors - Dark Theme
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);
  static const Color darkTextHint = Color(0xFF6E6E6E);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF6C63FF),
    Color(0xFF9B97FF),
  ];

  static const List<Color> successGradient = [
    Color(0xFF00D9A3),
    Color(0xFF4DFFCD),
  ];

  static const List<Color> earningsGradient = [
    Color(0xFF667EEA),
    Color(0xFF764BA2),
  ];

  // Shadow Colors
  static const Color lightShadow = Color(0x1A000000);
  static const Color darkShadow = Color(0x3D000000);
}
