import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

void showCommonToast(
  String message, {
  bool isError = false,
  int? duration,
  ToastPosition? position,
  double? radius,
  EdgeInsetsGeometry? textPadding,
  TextStyle? textStyle,
  Color? textColor,
  Color? backgroundColor,
}) {
  showToast(
    message,
    duration: Duration(milliseconds: duration ?? 3000),
    dismissOtherToast: true,
    position: position ?? ToastPosition.bottom,
    backgroundColor:
        backgroundColor ?? (isError ? AppColors.errorDark : AppColors.white),
    radius: radius ?? 30.r,
    textPadding:
        textPadding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
    textStyle:
        textStyle ??
        AppTextStyles.h4.copyWith(
          fontWeight: FontWeight.bold,
          color: textColor ?? (isError ? AppColors.white : AppColors.text),
        ),
  );
}
