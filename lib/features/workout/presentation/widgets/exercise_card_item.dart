import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/widgets/common_images.dart';
import 'package:workouch/features/workout/domain/entities/exercise.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';

class ExerciseCardItem extends StatelessWidget {
  const ExerciseCardItem({
    super.key,
    required this.exercise,
    this.isSelected = false,
    this.onTap,
  });

  final Exercise exercise;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppColors.black : AppColors.grayBlue,
            width: 1.r,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.grayBlue, width: 1.r),
              ),
              child: CommonNetworkImage(
                url: exercise.gifUrl,
                width: 60.r,
                height: 60.r,
                backgroundColor: AppColors.transparent,
              ),
            ),
            Gaps.hGap12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise.name,
                    style: AppTextStyles.h4.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.vGap4,
                  Text(
                    exercise.type,
                    style: AppTextStyles.h5.copyWith(
                      color: AppColors.mediumGray,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected) ...[
              Gaps.hGap12,
              CommonAssetIcon(
                Assets.icons.check,
                width: 20.r,
                height: 20.r,
                color: AppColors.black,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
