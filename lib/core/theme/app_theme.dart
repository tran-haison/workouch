import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryLight,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondaryLight,
        tertiary: AppColors.accent,
        tertiaryContainer: AppColors.accentLight,
        error: AppColors.error,
        errorContainer: AppColors.errorLight,
        surface: AppColors.surfaceLight,
        surfaceContainerHighest: AppColors.surfaceVariantLight,
        onPrimary: Colors.white,
        onPrimaryContainer: AppColors.onBackgroundLight,
        onSecondary: Colors.white,
        onSecondaryContainer: AppColors.onBackgroundLight,
        onTertiary: Colors.white,
        onTertiaryContainer: AppColors.onBackgroundLight,
        onError: Colors.white,
        onErrorContainer: AppColors.onBackgroundLight,
        onSurface: AppColors.onSurfaceLight,
        onSurfaceVariant: AppColors.onSurfaceVariantLight,
        outline: AppColors.onSurfaceVariantLight,
        shadow: Colors.black26,
        scrim: Colors.black54,
        inverseSurface: AppColors.surfaceDark,
        onInverseSurface: AppColors.onSurfaceDark,
        inversePrimary: AppColors.primaryLight,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.h1.copyWith(
          color: AppColors.text,
        ),
        headlineMedium: AppTextStyles.h2.copyWith(
          color: AppColors.text,
        ),
        headlineSmall: AppTextStyles.h3.copyWith(
          color: AppColors.text,
        ),
        titleLarge: AppTextStyles.h4.copyWith(
          color: AppColors.text,
        ),
        titleMedium: AppTextStyles.h5.copyWith(
          color: AppColors.text,
        ),
        titleSmall: AppTextStyles.h6.copyWith(
          color: AppColors.text,
        ),
        bodyLarge: AppTextStyles.h1.copyWith(
          color: AppColors.text,
        ),
        bodyMedium: AppTextStyles.h2.copyWith(
          color: AppColors.text,
        ),
        bodySmall: AppTextStyles.h3.copyWith(
          color: AppColors.text,
        ),
        labelLarge: AppTextStyles.h4.copyWith(
          color: AppColors.text,
        ),
        labelMedium: AppTextStyles.h5.copyWith(
          color: AppColors.text,
        ),
        labelSmall: AppTextStyles.h6.copyWith(
          color: AppColors.text,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surfaceLight,
        foregroundColor: AppColors.onSurfaceLight,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.h4.copyWith(
          color: AppColors.onSurfaceLight,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: AppColors.primary.withValues(alpha: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: AppTextStyles.h5.copyWith(
            color: AppColors.onBackgroundLight,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: AppTextStyles.h5.copyWith(
            color: AppColors.onBackgroundLight,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: AppTextStyles.h5.copyWith(
            color: AppColors.onBackgroundLight,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceLight,
        elevation: 2,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariantLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: AppTextStyles.h2.copyWith(
          color: AppColors.onSurfaceVariantLight,
        ),
        labelStyle: AppTextStyles.h5.copyWith(
          color: AppColors.onSurfaceVariantLight,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceLight,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.onSurfaceVariantLight,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: AppTextStyles.h6,
        unselectedLabelStyle: AppTextStyles.h6,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryLight,
        primaryContainer: AppColors.primary,
        secondary: AppColors.secondaryLight,
        secondaryContainer: AppColors.secondary,
        tertiary: AppColors.accentLight,
        tertiaryContainer: AppColors.accent,
        error: AppColors.errorLight,
        errorContainer: AppColors.error,
        surface: AppColors.surfaceDark,
        surfaceContainerHighest: AppColors.surfaceVariantDark,
        onPrimary: AppColors.onBackgroundDark,
        onPrimaryContainer: AppColors.onBackgroundDark,
        onSecondary: AppColors.onBackgroundDark,
        onSecondaryContainer: AppColors.onBackgroundDark,
        onTertiary: AppColors.onBackgroundDark,
        onTertiaryContainer: AppColors.onBackgroundDark,
        onError: AppColors.onBackgroundDark,
        onErrorContainer: AppColors.onBackgroundDark,
        onSurface: AppColors.onSurfaceDark,
        onSurfaceVariant: AppColors.onSurfaceVariantDark,
        outline: AppColors.onSurfaceVariantDark,
        shadow: Colors.black54,
        scrim: Colors.black87,
        inverseSurface: AppColors.surfaceLight,
        onInverseSurface: AppColors.onSurfaceLight,
        inversePrimary: AppColors.primaryDark,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.h1.copyWith(
          color: AppColors.onBackgroundDark,
        ),
        headlineMedium: AppTextStyles.h2.copyWith(
          color: AppColors.onBackgroundDark,
        ),
        headlineSmall: AppTextStyles.h3.copyWith(
          color: AppColors.onBackgroundDark,
        ),
        titleLarge: AppTextStyles.h4.copyWith(
          color: AppColors.onBackgroundDark,
        ),
        titleMedium: AppTextStyles.h5.copyWith(
          color: AppColors.onBackgroundDark,
        ),
        titleSmall: AppTextStyles.h6.copyWith(
          color: AppColors.onBackgroundDark,
        ),
        bodyLarge: AppTextStyles.h1.copyWith(color: AppColors.onBackgroundDark),
        bodyMedium: AppTextStyles.h2.copyWith(
          color: AppColors.onBackgroundDark,
        ),
        bodySmall: AppTextStyles.h3.copyWith(color: AppColors.onBackgroundDark),
        labelLarge: AppTextStyles.h4.copyWith(
          color: AppColors.onBackgroundDark,
        ),
        labelMedium: AppTextStyles.h5.copyWith(
          color: AppColors.onBackgroundDark,
        ),
        labelSmall: AppTextStyles.h6.copyWith(
          color: AppColors.onBackgroundDark,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.onSurfaceDark,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.h4.copyWith(
          color: AppColors.onSurfaceDark,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: AppColors.onBackgroundDark,
          elevation: 2,
          shadowColor: AppColors.primaryLight.withValues(alpha: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: AppTextStyles.h5.copyWith(
            color: AppColors.onBackgroundDark,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          side: const BorderSide(color: AppColors.primaryLight, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: AppTextStyles.h5.copyWith(
            color: AppColors.onBackgroundDark,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: AppTextStyles.h5.copyWith(
            color: AppColors.onBackgroundDark,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark,
        elevation: 2,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariantDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.errorLight, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: AppTextStyles.h2.copyWith(
          color: AppColors.onSurfaceVariantDark,
        ),
        labelStyle: AppTextStyles.h5.copyWith(
          color: AppColors.onSurfaceVariantDark,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceDark,
        selectedItemColor: AppColors.primaryLight,
        unselectedItemColor: AppColors.onSurfaceVariantDark,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: AppTextStyles.h6,
        unselectedLabelStyle: AppTextStyles.h6,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.onBackgroundDark,
        elevation: 4,
      ),
    );
  }
}
