import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';

class HomeWorkoutCard extends StatelessWidget {
  const HomeWorkoutCard({
    super.key,
    required this.onLazyTap,
    required this.onProTap,
  });

  final VoidCallback onLazyTap;
  final VoidCallback onProTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.r),
          child: _BackgroundLayer(
            hasTopRadius: true,
            hasBottomRadius: false,
            color: AppColors.secondary.withValues(alpha: 0.5),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.r),
          child: _BackgroundLayer(
            hasTopRadius: true,
            hasBottomRadius: false,
            color: AppColors.secondary,
          ),
        ),
        Container(
          width: 1.sw,
          padding: EdgeInsets.symmetric(vertical: 24.r, horizontal: 12.r),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(36.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Row(
                  children: [
                    Text(
                      AppConstants.workout,
                      style: AppTextStyles.anton.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Gaps.hGap12,
                    CommonAssetIcon(
                      Assets.icons.puregym,
                      useDefaultColor: true,
                    ),
                  ],
                ),
              ),
              Gaps.vGap20,
              _HomeWorkoutOption(
                title: AppConstants.lazy,
                description: AppConstants.lazyDescription,
                icon: Assets.icons.userLay,
                textColor: AppColors.text,
                iconColor: AppColors.text,
                backgroundColor: AppColors.white,
                onTap: onLazyTap,
              ),
              Gaps.vGap4,
              _HomeWorkoutOption(
                title: AppConstants.pro,
                description: AppConstants.proDescription,
                icon: Assets.icons.userWalk,
                textColor: AppColors.white,
                iconColor: AppColors.white,
                backgroundColor: AppColors.black,
                onTap: onProTap,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.r),
          child: _BackgroundLayer(
            hasTopRadius: false,
            hasBottomRadius: true,
            color: AppColors.primary,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.r),
          child: _BackgroundLayer(
            hasTopRadius: false,
            hasBottomRadius: true,
            color: AppColors.primary.withValues(alpha: 0.5),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.r),
          child: _BackgroundLayer(
            hasTopRadius: false,
            hasBottomRadius: true,
            color: AppColors.primary.withValues(alpha: 0.3),
          ),
        ),
      ],
    );
  }
}

class _HomeWorkoutOption extends StatelessWidget {
  const _HomeWorkoutOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.textColor,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  });

  final String title;
  final String description;
  final SvgGenImage icon;
  final Color textColor;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(12.r),
              child: CommonAssetIcon(icon, color: iconColor),
            ),
            Gaps.hGap10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.orbitron.copyWith(
                      color: textColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    description,
                    style: AppTextStyles.h5.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.hGap10,
            CommonAssetIcon(Assets.icons.arrowTopRight, color: iconColor),
          ],
        ),
      ),
    );
  }
}

class _BackgroundLayer extends StatelessWidget {
  const _BackgroundLayer({
    required this.hasTopRadius,
    required this.hasBottomRadius,
    required this.color,
  });

  final bool hasTopRadius;
  final bool hasBottomRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 10.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: hasTopRadius ? Radius.circular(20.r) : Radius.zero,
          topRight: hasTopRadius ? Radius.circular(20.r) : Radius.zero,
          bottomLeft: hasBottomRadius ? Radius.circular(20.r) : Radius.zero,
          bottomRight: hasBottomRadius ? Radius.circular(20.r) : Radius.zero,
        ),
      ),
    );
  }
}
