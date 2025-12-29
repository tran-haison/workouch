import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.titleColor,
    this.trailing,
  });

  final SvgGenImage icon;
  final String title;
  final VoidCallback onTap;
  final Color? titleColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.grayBlue,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CommonAssetIcon(
                icon,
                width: 20.r,
                height: 20.r,
                color: titleColor ?? AppColors.black,
              ),
            ),
            Gaps.hGap16,
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.h4.copyWith(
                  color: titleColor ?? AppColors.text,
                ),
              ),
            ),
            if (trailing != null) ...[
              Gaps.hGap12,
              trailing!,
            ] else ...[
              CommonAssetIcon(
                Assets.icons.arrowTopRight,
                width: 16.r,
                height: 16.r,
                color: AppColors.mediumGray,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
