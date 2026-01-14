import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';

class OnboardIntroFeature2 extends StatelessWidget {
  const OnboardIntroFeature2({super.key});

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
          // Routine name
          Text(
            AppConstants.onboardSampleRoutineName,
            style: AppTextStyles.anton.copyWith(fontSize: 24.sp),
          ),
          Gaps.vGap12,
          // Number of exercises
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.grayBlue,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonAssetIcon(
                  Assets.icons.fire,
                  width: 16.r,
                  height: 16.r,
                  useDefaultColor: true,
                ),
                Gaps.hGap6,
                Text(
                  '${AppConstants.onboardSampleRoutineExerciseCount} ${AppConstants.exercises.toLowerCase()}',
                  style: AppTextStyles.h5,
                ),
              ],
            ),
          ),
          Gaps.vGap20,
          // Sample exercises
          _SampleExerciseItem(
            image: Assets.images.imgSampleExercise1,
            exerciseName: AppConstants.onboardSampleExercise1Name,
            exerciseInfo: AppConstants.onboardSampleExercise1Info,
          ),
          Gaps.vGap12,
          _SampleExerciseItem(
            image: Assets.images.imgSampleExercise2,
            exerciseName: AppConstants.onboardSampleExercise2Name,
            exerciseInfo: AppConstants.onboardSampleExercise2Info,
          ),
        ],
      ),
    );
  }
}

class _SampleExerciseItem extends StatelessWidget {
  const _SampleExerciseItem({
    required this.image,
    required this.exerciseName,
    required this.exerciseInfo,
  });

  final AssetGenImage image;
  final String exerciseName;
  final String exerciseInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Exercise GIF image
        Container(
          width: 60.r,
          height: 60.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.grayBlue, width: 1.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: image.image(width: 60.r, height: 60.r, fit: BoxFit.cover),
          ),
        ),
        Gaps.hGap12,
        // Exercise name and info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exerciseName,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
              Gaps.vGap4,
              Text(
                exerciseInfo,
                style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
