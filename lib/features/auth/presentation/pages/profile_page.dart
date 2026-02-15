import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/extension/string_extension.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_images.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/user.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/avatar_placeholder.dart';
import '../widgets/bmi_card.dart';
import '../widgets/calories_card.dart';
import '../dialogs/profile_update_dialog.dart';
import '../widgets/subscription_badge.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = state.currentUser;
        if (user == null) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Text(AppConstants.userNotFound, style: AppTextStyles.h3),
              ),
            ),
          );
        }

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Row(
                    children: [
                      CommonIconButton(
                        backgroundColor: AppColors.grayBlue,
                        icon: Assets.icons.arrowBack,
                        iconColor: AppColors.black,
                        onTap: () => context.pop(),
                      ),
                      const Spacer(),
                      CommonIconButton(
                        backgroundColor: AppColors.darkBlack,
                        icon: Assets.icons.settings,
                        iconColor: AppColors.white,
                        onTap: () => context.pushNamed(AppRoute.settings.name),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              showProfileUpdateDialog(context, user: user),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.grayBlue,
                                    width: 4.r,
                                  ),
                                ),
                                child: ClipOval(
                                  child: CommonNetworkImage(
                                    url: user.avatarUrl,
                                    width: 80.r,
                                    height: 80.r,
                                    radius: 40.r,
                                    fit: BoxFit.contain,
                                    errorWidget: AvatarPlaceholder(
                                      user: user,
                                      containerSize: 80.r,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -6.r,
                                right: -6.r,
                                child: Container(
                                  padding: EdgeInsets.all(8.r),
                                  decoration: BoxDecoration(
                                    color: AppColors.grayBlue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: CommonAssetIcon(
                                    Assets.icons.edit,
                                    width: 18.r,
                                    height: 18.r,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gaps.vGap20,
                        if (user.fullName.isNotEmpty) ...[
                          Text(
                            user.fullName,
                            style: AppTextStyles.h1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Gaps.vGap4,
                        ],
                        Text(
                          user.email,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gaps.vGap10,
                        const SubscriptionBadge(),
                        Gaps.vGap30,
                        Row(
                          children: [
                            Expanded(
                              child: _HealthMetricCard(
                                label: AppConstants.height,
                                value:
                                    '${user.height.toStringAsFixed(0)} ${AppConstants.cm.toLowerCase()}',
                                icon: Assets.icons.height,
                              ),
                            ),
                            Gaps.hGap10,
                            Expanded(
                              child: _HealthMetricCard(
                                label: AppConstants.weight,
                                value:
                                    '${user.weight.toStringAsFixed(1)} ${AppConstants.kg.toLowerCase()}',
                                icon: Assets.icons.weight,
                              ),
                            ),
                          ],
                        ),
                        Gaps.vGap10,
                        Row(
                          children: [
                            Expanded(
                              child: _HealthMetricCard(
                                label: AppConstants.age,
                                value: '${user.age}',
                                icon: Assets.icons.calendar,
                              ),
                            ),
                            Gaps.hGap10,
                            Expanded(
                              child: _HealthMetricCard(
                                label: AppConstants.gender,
                                value: user.gender.name.capitalized,
                                icon: user.gender.isMale
                                    ? Assets.icons.male
                                    : Assets.icons.female,
                              ),
                            ),
                          ],
                        ),
                        Gaps.vGap20,
                        Row(
                          children: [
                            Text(
                              AppConstants.bodyMetrics,
                              style: AppTextStyles.h4.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Gaps.vGap10,
                        Row(
                          children: [Expanded(child: BmiCard(bmi: user.bmi))],
                        ),
                        Gaps.vGap10,
                        Row(
                          children: [
                            Expanded(
                              child: CaloriesCard(totalCalories: user.calories),
                            ),
                          ],
                        ),
                        Gaps.vGap20,
                        Row(
                          children: [
                            Text(
                              AppConstants.fitnessMetrics,
                              style: AppTextStyles.h4.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Gaps.vGap10,
                        Row(
                          children: [
                            Expanded(
                              child: _HealthMetricCard(
                                label: AppConstants.activityLevel,
                                value: user.activityLevel.title,
                                icon: Assets.icons.dumbbell,
                              ),
                            ),
                          ],
                        ),
                        Gaps.vGap40,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _HealthMetricCard extends StatelessWidget {
  const _HealthMetricCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
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
          CommonAssetIcon(
            icon,
            width: 20.r,
            height: 20.r,
            color: AppColors.black,
          ),
          Gaps.hGap20,
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.h4.copyWith(color: AppColors.mediumGray),
              ),
              Gaps.vGap4,
              Text(
                value,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
