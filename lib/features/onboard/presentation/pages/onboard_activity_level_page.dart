import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../../workout/domain/enums/activity_level.dart';
import '../cubit/onboard_cubit.dart';
import '../cubit/onboard_state.dart';

class OnboardActivityLevelPage extends StatelessWidget {
  const OnboardActivityLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.vGap40,
                  CommonIconButton(
                    icon: Assets.icons.arrowBack,
                    iconColor: AppColors.black,
                    backgroundColor: AppColors.transparent,
                    onTap: () => context.read<OnboardCubit>().previousPage(),
                  ),
                  Gaps.vGap40,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConstants.onboardActivityLevelTitle,
                          style: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          AppConstants.onboardActivityLevelDescription,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap40,
                        Expanded(
                          child: ListView.separated(
                            itemCount: ActivityLevel.values.length,
                            separatorBuilder: (_, _) => Gaps.vGap12,
                            padding: EdgeInsets.only(bottom: 20.h),
                            itemBuilder: (context, index) {
                              final level = ActivityLevel.values[index];
                              final isSelected = state.activityLevel == level;

                              return InkWell(
                                onTap: () {
                                  context
                                      .read<OnboardCubit>()
                                      .updateActivityLevel(level);
                                },
                                borderRadius: BorderRadius.circular(12.r),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 16.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.secondary
                                        : AppColors.transparent,
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColors.secondary
                                          : AppColors.grayBlue,
                                      width: 1.r,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              level.title,
                                              style: AppTextStyles.h4.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Gaps.vGap4,
                                            Text(
                                              level.description,
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
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.activityLevel != null)
                    BlocListener<OnboardCubit, OnboardState>(
                      listenWhen: (prev, curr) =>
                          prev.status != curr.status &&
                          curr.status == OnboardStateStatus.success,
                      listener: (context, state) {
                        context.goNamed(AppRoute.home.name);
                      },
                      child: CommonButton(
                        text: AppConstants.completeSetup,
                        onPressed: () async {
                          await context
                              .read<OnboardCubit>()
                              .completeOnboarding();
                        },
                        textStyle: AppTextStyles.h3.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.w,
                          vertical: 16.h,
                        ),
                      ),
                    ),
                  Gaps.vGap40,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
