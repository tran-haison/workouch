import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/widgets/common_button.dart';

import '../../../../core/constants/app_constants.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status indicator
          if (isCurrent)
            Container(
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green, width: 2.r),
              ),
              child: Center(
                child: Container(
                  width: 6.r,
                  height: 6.r,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
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
            Gaps.hGap(20.r),
          Gaps.hGap20,
          // Set information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AppConstants.set} ${setIndex + 1}',
                  style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
                ),
                Gaps.vGap4,
                Text(set.displayInfo ?? '', style: AppTextStyles.h4),
              ],
            ),
          ),
          // Complete button (only for current set)
          if (isCurrent)
            Center(
              child: CommonIconButton(
                icon: Assets.icons.check,
                iconColor: AppColors.mediumGray,
                iconSize: 18.r,
                padding: EdgeInsets.all(1.r),
                borderColor: AppColors.mediumGray,
                borderWidth: 1.5.r,
                radius: 8.r,
                backgroundColor: AppColors.transparent,
                onTap: onComplete,
              ),
            ),
        ],
      ),
    );
  }
}
