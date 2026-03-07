import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';

import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'common_bottom_dialog.dart';
import 'common_button.dart';
import 'common_gaps.dart';
import 'common_images.dart';
import '../../gen/assets.gen.dart';

Future<void> showExerciseInfoDialog(
  BuildContext context, {
  required WorkingExercise exercise,
}) async {
  return await showCommonBottomDialog(
    context,
    child: _ExerciseInfoDialog(exercise: exercise),
  );
}

class _ExerciseInfoDialog extends StatelessWidget {
  const _ExerciseInfoDialog({required this.exercise});

  final WorkingExercise exercise;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  exercise.name,
                  style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Gaps.hGap10,
              CommonIconButton(
                icon: Assets.icons.close,
                iconSize: 20.r,
                padding: EdgeInsets.all(8.r),
                iconColor: AppColors.black,
                backgroundColor: AppColors.grayBlue,
                onTap: () => context.pop(),
              ),
            ],
          ),
          Gaps.vGap20,
          Center(
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.grayBlue),
              ),
              child: CommonNetworkImage(
                url: exercise.gifUrl,
                width: 150.r,
                height: 150.r,
                fit: BoxFit.contain,
                backgroundColor: AppColors.transparent,
              ),
            ),
          ),
          Gaps.vGap20,
          // Description
          if (exercise.description.isNotEmpty) ...[
            Text(
              AppConstants.description,
              style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
            ),
            Gaps.vGap8,
            Text(
              exercise.description,
              style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
            ),
            Gaps.vGap20,
          ],
          // Body Parts
          if (exercise.bodyParts.isNotEmpty) ...[
            Text(
              AppConstants.bodyParts,
              style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
            ),
            Gaps.vGap8,
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: exercise.bodyParts
                  .map(
                    (part) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(part, style: AppTextStyles.h5),
                    ),
                  )
                  .toList(),
            ),
            Gaps.vGap20,
          ],
          // Equipment
          if (exercise.equipments.isNotEmpty) ...[
            Text(
              AppConstants.equipment,
              style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
            ),
            Gaps.vGap8,
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: exercise.equipments
                  .map(
                    (equipment) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.darkBlack,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        equipment,
                        style: AppTextStyles.h5.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Gaps.vGap20,
          ],
          // Target Muscles
          if (exercise.targetMuscles.isNotEmpty) ...[
            Text(
              AppConstants.targetMuscles,
              style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
            ),
            Gaps.vGap8,
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: exercise.targetMuscles
                  .map(
                    (muscle) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grayBlue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(muscle, style: AppTextStyles.h5),
                    ),
                  )
                  .toList(),
            ),
            Gaps.vGap20,
          ],
          // Secondary Muscles
          if (exercise.secondaryMuscles.isNotEmpty) ...[
            Text(
              AppConstants.secondaryMuscles,
              style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
            ),
            Gaps.vGap8,
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: exercise.secondaryMuscles
                  .map(
                    (muscle) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grayBlue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(muscle, style: AppTextStyles.h5),
                    ),
                  )
                  .toList(),
            ),
            Gaps.vGap20,
          ],
          // Instructions
          if (exercise.instructions.isNotEmpty) ...[
            Text(
              AppConstants.instructions,
              style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
            ),
            Gaps.vGap8,
            ...exercise.instructions.asMap().entries.map(
              (entry) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24.r,
                      height: 24.r,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${entry.key + 1}',
                          style: AppTextStyles.h5.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Gaps.hGap12,
                    Expanded(
                      child: Text(
                        entry.value,
                        style: AppTextStyles.h5.copyWith(
                          color: AppColors.mediumGray,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
