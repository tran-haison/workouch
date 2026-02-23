import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/features/home/presentation/widgets/history_week_streak.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
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
              const HistoryWeekStreak(),
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
          child: const HistorySummaryStats(),
        ),
        Gaps.vGap40,
      ],
    );
  }
}
