import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';

class OnboardIntroFeature3 extends StatelessWidget {
  const OnboardIntroFeature3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _BenefitItem(
          icon: Icons.auto_awesome_outlined,
          title: 'Personalized planning',
          description: 'Build workouts around your goals and available time.',
        ),
        Gaps.vGap12,
        const _BenefitItem(
          icon: Icons.calendar_month_outlined,
          title: 'A routine you can follow',
          description: 'Save workouts and return to them whenever you train.',
        ),
        Gaps.vGap12,
        const _BenefitItem(
          icon: Icons.insights_outlined,
          title: 'Progress you can see',
          description: 'Track sessions and personal records over time.',
        ),
      ],
    );
  }
}

class _BenefitItem extends StatelessWidget {
  const _BenefitItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grayBlue, width: 1.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: const BoxDecoration(
              color: AppColors.grayBlue,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.black, size: 24.r),
          ),
          Gaps.hGap12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
                ),
                Gaps.vGap4,
                Text(
                  description,
                  style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
