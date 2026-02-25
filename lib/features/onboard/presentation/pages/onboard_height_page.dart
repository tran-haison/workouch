import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/height_spinner.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/domain/entities/user.dart';
import '../cubit/onboard_cubit.dart';
import '../cubit/onboard_state.dart';

class OnboardHeightPage extends StatelessWidget {
  const OnboardHeightPage({super.key});

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
                          AppConstants.onboardHeightTitle,
                          style: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          AppConstants.onboardHeightDescription,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap60,
                        HeightSpinner(
                          height: 200.h,
                          measurementSystem:
                              state.measurementSystem ??
                              MeasurementSystem.metric,
                          initialHeightCm: state.heightCm,
                          textStyle: AppTextStyles.h3.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          onHeightChanged: (heightCm) {
                            context.read<OnboardCubit>().updateHeightCm(
                              heightCm,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  if (state.heightCm > 0)
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
