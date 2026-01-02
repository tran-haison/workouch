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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: isCompleted
            ? AppColors.lightGray
            : isCurrent
            ? AppColors.secondary
            : AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.grayBlue, width: 1.r),
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
              color: AppColors.grayBlue,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Center(
              child: Text('${setIndex + 1}', style: AppTextStyles.h4),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ) ??
              [],
          Gaps.hGap16,
          if (isCurrent)
            CommonIconButton(
              icon: Assets.icons.check,
              iconColor: Colors.green,
              iconSize: 16.r,
              padding: EdgeInsets.all(1.r),
              borderColor: Colors.green,
              borderWidth: 1.5.r,
              radius: 8.r,
              backgroundColor: AppColors.transparent,
              onTap: onComplete,
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
    );
  }
}
