import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/widgets/common_button.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/workout_card_item.dart';

class WorkoutProPage extends StatelessWidget {
  const WorkoutProPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                children: [
                  CommonIconButton(
                    backgroundColor: AppColors.white,
                    icon: Assets.icons.arrowBack,
                    iconColor: AppColors.black,
                    radius: 30.r,
                    onTap: () {
                      context.pop();
                    },
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          AppConstants.workouts.toUpperCase(),
                          style: AppTextStyles.h0.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          AppConstants.fullControl,
                          style: AppTextStyles.h5.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CommonIconButton(
                    backgroundColor: AppColors.secondary,
                    icon: Assets.icons.add,
                    iconColor: AppColors.black,
                    radius: 30.r,
                    onTap: () {
                      context.pushNamed(AppRoute.workoutCreation.name);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: 1.sw,
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Gaps.vGap16,
                          Container(
                            width: 100.w,
                            height: 3.h,
                            decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                          Gaps.vGap16,
                          Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.only(
                                left: 12.w,
                                right: 12.w,
                                top: 0,
                                bottom: 80.h,
                              ),
                              itemCount: 5,
                              separatorBuilder: (context, index) => Gaps.vGap12,
                              itemBuilder: (context, index) {
                                return WorkoutCardItem(
                                  title: 'Chest Workout',
                                  exercises: 8,
                                  onTap: () {},
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 10.h,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _RoutineIndicator(
                              title: AppConstants.mode,
                              value: AppConstants.pro,
                              icon: Assets.icons.rocket,
                            ),
                            Gaps.hGap10,
                            _RoutineIndicator(
                              title: AppConstants.total,
                              value: '2',
                              icon: Assets.icons.weight,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoutineIndicator extends StatelessWidget {
  const _RoutineIndicator({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.black),
      ),
      child: Row(
        children: [
          CommonAssetIcon(
            icon,
            width: 16.r,
            height: 16.r,
            useDefaultColor: true,
          ),
          Gaps.hGap4,
          Text('$title: $value', style: AppTextStyles.h5),
        ],
      ),
    );
  }
}
