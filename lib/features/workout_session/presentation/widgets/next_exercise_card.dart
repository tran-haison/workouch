import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_images.dart';
import '../../../../gen/assets.gen.dart';

class NextExerciseCard extends StatelessWidget {
  const NextExerciseCard({
    super.key,
    required this.exercise,
    required this.onSkip,
  });

  final WorkingExercise exercise;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.darkBlack,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          // Exercise image
          Container(
            width: 60.r,
            height: 60.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CommonNetworkImage(
                url: exercise.gifUrl,
                width: 60.r,
                height: 60.r,
                backgroundColor: AppColors.transparent,
              ),
            ),
          ),
          Gaps.hGap12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppConstants.next,
                  style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
                ),
                Text(
                  exercise.name,
                  style: AppTextStyles.h4.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Gaps.hGap12,
          CommonIconButton(
            backgroundColor: AppColors.secondary,
            icon: Assets.icons.arrowRightWide,
            iconColor: AppColors.black,
            onTap: onSkip,
          ),
        ],
      ),
    );
  }
}
