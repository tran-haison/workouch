import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'settings_item.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key, required this.title, required this.items});

  final String title;
  final List<SettingsItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
          child: Text(
            title.toUpperCase(),
            style: AppTextStyles.h5.copyWith(
              color: AppColors.mediumGray,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
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
          child: Column(
            children: [
              for (int i = 0; i < items.length; i++) ...[
                items[i],
                if (i < items.length - 1)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Divider(
                      height: 1.h,
                      thickness: 1.h,
                      color: AppColors.grayBlue,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
