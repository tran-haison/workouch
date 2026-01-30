import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/widgets/common_icons.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../gen/assets.gen.dart';
import 'exercises_personal_record.dart';
import 'history_calendar.dart';
import 'history_summary_stats.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 20.h, bottom: 120.h),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppConstants.history,
                style: AppTextStyles.anton.copyWith(fontSize: 24.sp),
              ),
              const Spacer(),
              Text(
                '100',
                style: AppTextStyles.h4.copyWith(
                  color: AppColors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.hGap8,
              CommonAssetIcon(
                Assets.icons.fire,
                width: 20.r,
                height: 20.r,
                color: AppColors.orange,
              ),
            ],
          ),
        ),
        Gaps.vGap12,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const HistoryCalendar(),
        ),
        Gaps.vGap24,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  AppConstants.thisMonth,
                  style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Gaps.vGap12,
              const HistorySummaryStats(),
            ],
          ),
        ),
        Gaps.vGap40,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const ExercisesPersonalRecord(),
        ),
      ],
    );
  }
}
