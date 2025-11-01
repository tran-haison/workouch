import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';

class WorkoutCardItem extends StatelessWidget {
  const WorkoutCardItem({
    super.key,
    required this.title,
    required this.exercises,
    required this.onTap,
  });

  final String title;
  final int exercises;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grayBlue,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.anton.copyWith(fontSize: 20.sp),
                ),
                Gaps.vGap10,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
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
                        '$exercises ${AppConstants.exercises.toLowerCase()}',
                        style: AppTextStyles.h5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CommonAssetIcon(Assets.icons.arrowRightWide, useDefaultColor: true),
        ],
      ),
    );
  }
}
