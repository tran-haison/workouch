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
import '../../../../core/widgets/common_images.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../dialogs/profile_update_dialog.dart';

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
                        backgroundColor: AppColors.grayBlue,
                        icon: Assets.icons.edit,
                        iconColor: AppColors.black,
                        onTap: () =>
                            showProfileUpdateDialog(context, user: user),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
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
                            ),
                          ),
                        ),
                        Gaps.vGap20,
                        Text(
                          user.fullName,
                          style: AppTextStyles.h1.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gaps.vGap4,
                        Text(
                          user.email,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gaps.vGap30,
                        _ProfileSectionCard(
                          title: AppConstants.personalInformation,
                          children: [
                            _ProfileInfoRow(
                              label: AppConstants.age,
                              value: '${user.age}',
                              icon: Assets.icons.user,
                            ),
                            Gaps.vGap16,
                            _ProfileInfoRow(
                              label: AppConstants.gender,
                              value: user.gender.name.toUpperCase(),
                              icon: user.gender == Gender.male
                                  ? Assets.icons.male
                                  : Assets.icons.female,
                            ),
                          ],
                        ),
                        Gaps.vGap20,
                        _ProfileSectionCard(
                          title: AppConstants.healthMetrics,
                          children: [
                            _ProfileInfoRow(
                              label: AppConstants.height,
                              value:
                                  '${user.height.toStringAsFixed(0)} ${AppConstants.cm.toLowerCase()}',
                              icon: Assets.icons.height,
                            ),
                            Gaps.vGap16,
                            _ProfileInfoRow(
                              label: AppConstants.weight,
                              value:
                                  '${user.weight.toStringAsFixed(1)} ${AppConstants.kg.toLowerCase()}',
                              icon: Assets.icons.weight,
                            ),
                            Gaps.vGap16,
                            _ProfileInfoRow(
                              label: AppConstants.bmi,
                              value: user.bmi.toStringAsFixed(1),
                              icon: Assets.icons.heart,
                            ),
                            Gaps.vGap16,
                            _ProfileInfoRow(
                              label: AppConstants.calories,
                              value: '${user.calories.toStringAsFixed(0)} kcal',
                              icon: Assets.icons.fire,
                            ),
                          ],
                        ),
                        Gaps.vGap40,
                        // Sign Out Button
                        CommonButton(
                          text: AppConstants.signOut,
                          backgroundColor: AppColors.errorDark,
                          onPressed: () => _signOut(context),
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

  Future<void> _signOut(BuildContext context) async {
    await context.read<AuthCubit>().signOut();
    if (context.mounted) {
      context.goNamed(AppRoute.signIn.name);
    }
  }
}

class _ProfileSectionCard extends StatelessWidget {
  const _ProfileSectionCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.grayBlue, width: 1.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grayBlue,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
          ),
          Gaps.vGap16,
          ...children,
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isMale = state.currentUser?.gender == Gender.male;
            return Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: isMale ? AppColors.secondary : AppColors.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CommonAssetIcon(
                icon,
                width: 20.r,
                height: 20.r,
                color: AppColors.black,
              ),
            );
          },
        ),
        Gaps.hGap16,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
              ),
              Text(
                value,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
