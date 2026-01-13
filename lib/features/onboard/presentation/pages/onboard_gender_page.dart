import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/domain/entities/user.dart';
import '../cubit/onboard_cubit.dart';
import '../cubit/onboard_state.dart';

class OnboardGenderPage extends StatelessWidget {
  const OnboardGenderPage({super.key});

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
                          AppConstants.onboardGenderTitle,
                          style: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          AppConstants.onboardGenderDescription,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap60,
                        Row(
                          children: [
                            Expanded(
                              child: _GenderButton(
                                label: AppConstants.male.toUpperCase(),
                                icon: Assets.icons.male,
                                isSelected: state.gender?.isMale ?? false,
                                selectedBackgroundColor: AppColors.secondary,
                                onTap: () {
                                  context.read<OnboardCubit>().updateGender(
                                    Gender.male,
                                  );
                                },
                              ),
                            ),
                            Gaps.hGap16,
                            Expanded(
                              child: _GenderButton(
                                label: AppConstants.female.toUpperCase(),
                                icon: Assets.icons.female,
                                isSelected: state.gender?.isFemale ?? false,
                                selectedBackgroundColor: AppColors.primary,
                                onTap: () {
                                  context.read<OnboardCubit>().updateGender(
                                    Gender.female,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (state.gender != null)
                    CommonButton(
                      text: AppConstants.next,
                      onPressed: () {
                        context.read<OnboardCubit>().nextPage();
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

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.selectedBackgroundColor,
  });

  final String label;
  final SvgGenImage icon;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        decoration: BoxDecoration(
          color: isSelected ? selectedBackgroundColor : AppColors.grayBlue,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            CommonAssetIcon(
              icon,
              width: 60.r,
              height: 60.r,
              color: AppColors.black,
            ),
            Gaps.vGap16,
            Text(
              label,
              style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
