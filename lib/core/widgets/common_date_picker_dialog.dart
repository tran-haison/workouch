import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';

Future<DateTime?> showCommonDatePickerDialog(
  BuildContext context, {
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  String? helpText,
  String? confirmText,
}) async {
  return await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    initialDatePickerMode: DatePickerMode.year,
    helpText: helpText ?? AppConstants.selectMonthYear,
    confirmText: confirmText ?? AppConstants.select,
    builder: (context, child) {
      return Theme(
        data: AppTheme.lightTheme.copyWith(
          textTheme: TextTheme(
            bodyMedium: AppTextStyles.h5.copyWith(color: AppColors.text),
          ),
          dividerTheme: DividerThemeData(
            color: AppColors.grayBlue,
            thickness: 1.r,
          ),
          datePickerTheme: DatePickerThemeData(
            weekdayStyle: AppTextStyles.h5.copyWith(
              color: AppColors.mediumGray,
            ),
            todayBackgroundColor: WidgetStateProperty.all(AppColors.darkBlack),
            dayStyle: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
            yearStyle: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
            cancelButtonStyle: TextButton.styleFrom(
              textStyle: AppTextStyles.h4.copyWith(color: AppColors.mediumGray),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              foregroundColor: AppColors.mediumGray,
            ),
            confirmButtonStyle: TextButton.styleFrom(
              textStyle: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              foregroundColor: AppColors.darkBlack,
            ),
          ),
        ),
        child: child!,
      );
    },
  );
}
