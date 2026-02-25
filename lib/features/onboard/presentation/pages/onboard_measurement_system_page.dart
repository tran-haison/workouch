import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/domain/entities/user.dart';
import '../cubit/onboard_cubit.dart';
import '../cubit/onboard_state.dart';

class OnboardMeasurementSystemPage extends StatelessWidget {
  const OnboardMeasurementSystemPage({super.key});

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
                          AppConstants.onboardMeasurementSystemTitle,
                          style: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          AppConstants.onboardMeasurementSystemDescription,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap60,
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: _MeasurementSystemButton(
                                  label: AppConstants.metric,
                                  subtitle: AppConstants.metricDescription,
                                  isSelected:
                                      state.measurementSystem?.isMetric ??
                                      false,
                                  onTap: () {
                                    context
                                        .read<OnboardCubit>()
                                        .updateMeasurementSystem(
                                          MeasurementSystem.metric,
                                        );
                                  },
                                ),
                              ),
                              Gaps.hGap16,
                              Expanded(
                                child: _MeasurementSystemButton(
                                  label: AppConstants.imperial,
                                  subtitle: AppConstants.imperialDescription,
                                  isSelected:
                                      state.measurementSystem?.isImperial ??
                                      false,
                                  onTap: () {
                                    context
                                        .read<OnboardCubit>()
                                        .updateMeasurementSystem(
                                          MeasurementSystem.imperial,
                                        );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.measurementSystem != null)
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

class _MeasurementSystemButton extends StatelessWidget {
  const _MeasurementSystemButton({
    required this.label,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.darkBlack : AppColors.grayBlue,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: AppTextStyles.h3.copyWith(
                color: isSelected ? AppColors.white : AppColors.text,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.vGap4,
            Text(
              subtitle,
              style: AppTextStyles.h4.copyWith(
                color: isSelected ? AppColors.grayBlue : AppColors.mediumGray,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
