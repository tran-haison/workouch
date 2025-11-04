import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';

class ExerciseListItem extends StatelessWidget {
  const ExerciseListItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: isSelected
              ? Border.all(color: AppColors.black, width: 1.r)
              : null,
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
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CommonAssetIcon(
                Assets.icons.weight,
                width: 28.r,
                height: 28.r,
                useDefaultColor: true,
              ),
            ),
            Gaps.hGap12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.h4.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.vGap4,
                  Text(
                    subtitle,
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
