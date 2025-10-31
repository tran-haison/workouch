import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workouch/core/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle get anton {
    try {
      return GoogleFonts.anton(fontSize: 32.sp, color: AppColors.text);
    } catch (e) {
      return TextStyle(fontSize: 32.sp, color: AppColors.text);
    }
  }

  static TextStyle get orbitron {
    try {
      return GoogleFonts.orbitron(
        fontSize: 20.sp,
        color: AppColors.text,
        fontWeight: FontWeight.w800,
      );
    } catch (e) {
      return TextStyle(
        fontSize: 20.sp,
        color: AppColors.text,
        fontWeight: FontWeight.w800,
      );
    }
  }

  static TextStyle get h0 => _getStyle(
    fontSize: 24.sp,
    color: AppColors.text,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get h1 => _getStyle(
    fontSize: 20.sp,
    color: AppColors.text,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get h2 => _getStyle(fontSize: 18.sp, color: AppColors.text);

  static TextStyle get h3 => _getStyle(fontSize: 16.sp, color: AppColors.text);

  static TextStyle get h4 => _getStyle(fontSize: 14.sp, color: AppColors.text);

  static TextStyle get h5 => _getStyle(fontSize: 12.sp, color: AppColors.text);

  static TextStyle get h6 => _getStyle(fontSize: 10.sp, color: AppColors.text);

  static TextStyle _getStyle({
    required double fontSize,
    required Color color,
    FontWeight? fontWeight,
  }) {
    try {
      return GoogleFonts.poppins(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      );
    } catch (e) {
      return TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      );
    }
  }
}
