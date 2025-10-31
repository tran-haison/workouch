import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workouch/core/theme/app_colors.dart';

class AppTextStyles {
  static final header = _getStyle(
    fontFamily: _FontFamily.anton,
    fontSize: 32.sp,
    color: AppColors.text,
  );

  static final subHeader = _getStyle(
    fontFamily: _FontFamily.anton,
    fontSize: 24.sp,
    color: AppColors.text,
  );

  static final title = _getStyle(
    fontFamily: _FontFamily.orbitron,
    fontSize: 20.sp,
    color: AppColors.text,
    fontWeight: FontWeight.w800,
  );

  static final subTitle = _getStyle(
    fontFamily: _FontFamily.orbitron,
    fontSize: 16.sp,
    color: AppColors.text,
    fontWeight: FontWeight.w800,
  );

  static TextStyle get h0 => _getStyle(
    fontFamily: _FontFamily.poppins,
    fontSize: 24.sp,
    color: AppColors.text,
  );

  static TextStyle get h1 => _getStyle(
    fontFamily: _FontFamily.poppins,
    fontSize: 20.sp,
    color: AppColors.text,
  );

  static TextStyle get h2 => _getStyle(
    fontFamily: _FontFamily.poppins,
    fontSize: 18.sp,
    color: AppColors.text,
  );

  static TextStyle get h3 => _getStyle(
    fontFamily: _FontFamily.poppins,
    fontSize: 16.sp,
    color: AppColors.text,
  );

  static TextStyle get h4 => _getStyle(
    fontFamily: _FontFamily.poppins,
    fontSize: 14.sp,
    color: AppColors.text,
  );

  static TextStyle get h5 => _getStyle(
    fontFamily: _FontFamily.poppins,
    fontSize: 12.sp,
    color: AppColors.text,
  );

  static TextStyle get h6 => _getStyle(
    fontFamily: _FontFamily.poppins,
    fontSize: 10.sp,
    color: AppColors.text,
  );

  static TextStyle _getStyle({
    required _FontFamily fontFamily,
    required double fontSize,
    required Color color,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    try {
      switch (fontFamily) {
        case _FontFamily.poppins:
          return GoogleFonts.poppins(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          );
        case _FontFamily.anton:
          return GoogleFonts.anton(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          );
        case _FontFamily.orbitron:
          return GoogleFonts.orbitron(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          );
      }
    } catch (e) {
      return TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      );
    }
  }
}

enum _FontFamily { poppins, anton, orbitron }
