import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors - Now using pastel colors
  static const primary = Color(0xFFE9C1F0); // Pastel purple
  static const primaryLight = Color(0xFFF3E5F5);
  static const primaryDark = Color(0xFFCE93D8);

  // Secondary Colors - Pastel blue
  static const secondary = Color(0xFFC3E6D8); // Pastel blue
  static const secondaryLight = Color(0xFFE1F5FE);
  static const secondaryDark = Color.fromARGB(255, 157, 201, 183);

  // Accent Colors - Pastel yellow
  static const accent = Color(0xFFFFF9C4); // Pastel yellow
  static const accentLight = Color(0xFFFFFDE7);
  static const accentDark = Color(0xFFFFF176);

  // Text Colors
  static const text = Color(0xFF2B3031);
  static const textLight = Color(0xFF6B7280);
  static const textDark = Color(0xFFB0B0B0);

  // Error Colors - Pastel red
  static const error = Colors.red; // Pastel red
  static const errorLight = Color(0xFFFCE4EC);
  static const errorDark = Color(0xFFCA3535);

  // Success Colors - Pastel green
  static const success = Colors.green; // Pastel green
  static const successLight = Color(0xFFE8F5E8);
  static const successDark = Color(0xFFA5D6A7);

  // Warning Colors - Pastel orange
  static const warning = Color(0xFFFFE0B2); // Pastel orange
  static const warningLight = Color(0xFFFFF3E0);
  static const warningDark = Color(0xFFFFCC80);

  // Neutral Colors - Light Theme
  static const backgroundLight = Color(0xFFFAFAFA);
  static const surfaceLight = Color(0xFFFFFFFF);
  static const surfaceVariantLight = Color(0xFFF8F9FA);
  static const onBackgroundLight = Color(0xFF1A1A1A);
  static const onSurfaceLight = Color(0xFF1A1A1A);
  static const Color onSurfaceVariantLight = Color(0xFF6B7280);

  // Neutral Colors - Dark Theme
  static const backgroundDark = Color(0xFF0F0F0F);
  static const surfaceDark = Color(0xFF1A1A1A);
  static const surfaceVariantDark = Color(0xFF2A2A2A);
  static const onBackgroundDark = Color(0xFFFFFFFF);
  static const onSurfaceDark = Color(0xFFFFFFFF);
  static const onSurfaceVariantDark = Color(0xFFB0B0B0);

  // Neutral Colors for main design
  static const darkBlack = Color(0xFF121212);
  static const black = Color(0xFF2B3031);
  static const white = Color(0xFFFFFFFF);
  static const lightGray = Color(0xFFFAFAFA);
  static const mediumGray = Color(0xFF9E9E9E);
  static const darkGray = Color(0xFF424242);
  static const grayBlue = Color(0xFFEEF0F4);
  static const transparent = Colors.transparent;
  static const overlay = Color.fromARGB(49, 200, 200, 200);

  // Gradient Background - Mix of primary and secondary colors
  static const backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, primary],
    stops: [0.0, 1.0],
  );
}
