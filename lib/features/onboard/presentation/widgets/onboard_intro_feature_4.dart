import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';

class OnboardIntroFeature4 extends StatelessWidget {
  const OnboardIntroFeature4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.grayBlue, width: 1.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            AppConstants.onboardAnalyticsTitle,
            style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
          ),
          Gaps.vGap20,
          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _AnalyticsStatItem(
                label: AppConstants.weight,
                value: AppConstants.onboardAnalyticsWeightValue,
                change: AppConstants.onboardAnalyticsWeightChange,
                isPositive: true,
              ),
              _AnalyticsStatItem(
                label: AppConstants.bmi,
                value: AppConstants.onboardAnalyticsBmiValue,
                change: AppConstants.onboardAnalyticsBmiChange,
                isPositive: false,
              ),
              _AnalyticsStatItem(
                label: AppConstants.workouts,
                value: AppConstants.onboardAnalyticsWorkoutsValue,
                change: AppConstants.onboardAnalyticsWorkoutsChange,
                isPositive: true,
              ),
            ],
          ),
          Gaps.vGap24,
          // Progress bars
          _ProgressBarItem(
            label: AppConstants.onboardAnalyticsWorkoutFrequency,
            value: 75,
            maxValue: 100,
          ),
          Gaps.vGap12,
          _ProgressBarItem(
            label: AppConstants.onboardAnalyticsGoalProgress,
            value: 42,
            maxValue: 100,
          ),
          Gaps.vGap12,
          _ProgressBarItem(
            label: AppConstants.onboardAnalyticsConsistency,
            value: 92,
            maxValue: 100,
          ),
        ],
      ),
    );
  }
}

class _AnalyticsStatItem extends StatelessWidget {
  const _AnalyticsStatItem({
    required this.label,
    required this.value,
    required this.change,
    required this.isPositive,
  });

  final String label;
  final String value;
  final String change;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.h6.copyWith(color: AppColors.mediumGray),
        ),
        Gaps.vGap4,
        Text(
          value,
          style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
        ),
        Gaps.vGap4,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isPositive ? Icons.arrow_upward : Icons.arrow_downward,
              size: 12.r,
              color: isPositive ? AppColors.success : AppColors.error,
            ),
            Gaps.hGap4,
            Text(
              change,
              style: AppTextStyles.h6.copyWith(
                color: isPositive ? AppColors.success : AppColors.error,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProgressBarItem extends StatelessWidget {
  const _ProgressBarItem({
    required this.label,
    required this.value,
    required this.maxValue,
  });

  final String label;
  final int value;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    final percentage = (value / maxValue).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.h5),
            Text(
              '$value%',
              style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Gaps.vGap8,
        Container(
          height: 8.h,
          decoration: BoxDecoration(
            color: AppColors.grayBlue,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.backgroundGradient,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
