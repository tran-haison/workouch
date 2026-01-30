import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/widgets/common_button.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../../workout/domain/entities/working_set.dart';

class WorkoutSetItem extends StatelessWidget {
  const WorkoutSetItem({
    required this.set,
    required this.isCompleted,
    required this.isCurrent,
    required this.setIndex,
    required this.onComplete,
    super.key,
  });

  final WorkingSet set;
  final bool isCompleted;
  final bool isCurrent;
  final int setIndex;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCurrent ? onComplete : null,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: isCompleted ? AppColors.lightGray : AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isCurrent ? AppColors.darkBlack : AppColors.grayBlue,
            width: isCurrent ? 1.5.r : 1.r,
          ),
          boxShadow: isCompleted
              ? null
              : [
                  BoxShadow(
                    color: AppColors.grayBlue,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                color: isCurrent
                    ? AppColors.secondaryDark.withValues(alpha: 0.7)
                    : isCompleted
                    ? AppColors.grayBlue
                    : AppColors.black,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Text(
                  '${setIndex + 1}',
                  style: AppTextStyles.h4.copyWith(
                    color: isCurrent
                        ? AppColors.darkBlack
                        : isCompleted
                        ? AppColors.text
                        : AppColors.white,
                  ),
                ),
              ),
            ),
            Gaps.hGap16,
            ...set.displayInfoMap?.entries.map(
                  (entry) => Expanded(
                    child: Column(
                      children: [
                        Text(
                          entry.key,
                          style: AppTextStyles.h5.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap4,
                        Text(
                          entry.value,
                          style: AppTextStyles.h4.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                ) ??
                [],
            Gaps.hGap16,
            if (isCurrent)
              Container(
                padding: EdgeInsets.all(2.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.black, width: 1.5.r),
                ),
                child: CommonAssetIcon(
                  Assets.icons.check,
                  width: 16.r,
                  height: 16.r,
                  color: AppColors.black,
                ),
              )
            else if (isCompleted)
              CommonAssetIcon(
                Assets.icons.check,
                width: 20.r,
                height: 20.r,
                color: AppColors.mediumGray,
              )
            else
              Gaps.hGap20,
          ],
        ),
      ),
    );
  }
}
