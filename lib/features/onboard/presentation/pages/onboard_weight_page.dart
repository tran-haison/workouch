import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruler_slider/ruler_slider.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/onboard_cubit.dart';
import '../cubit/onboard_state.dart';
import '../../utils/onboard_utils.dart';

class OnboardWeightPage extends StatelessWidget {
  const OnboardWeightPage({super.key});

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
                          AppConstants.onboardWeightTitle,
                          style: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          AppConstants.onboardWeightDescription,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap60,
                        Center(
                          child: Text(
                            '${state.weight.toStringAsFixed(1)} ${AppConstants.kg.toLowerCase()}',
                            style: AppTextStyles.h1,
                          ),
                        ),
                        RulerSlider(
                          minValue: OnboardUtils.minWeight,
                          maxValue: OnboardUtils.maxWeight,
                          initialValue: state.weight,
                          rulerHeight: 100.h,
                          selectedBarColor: AppColors.black,
                          unselectedBarColor: AppColors.grayBlue,
                          tickSpacing: 14.w,
                          onChanged: (double value) {
                            context.read<OnboardCubit>().updateWeight(value);
                          },
                          showFixedBar: true,
                          showFixedLabel: false,
                          showBottomLabels: false,
                          fixedBarColor: AppColors.secondaryDark,
                          fixedBarWidth: 3.w,
                          fixedBarHeight: 50.h,
                          scrollSensitivity: 1.5,
                          enableSnapping: true,
                          majorTickInterval: 5,
                          labelInterval: 1,
                          labelVerticalOffset: 40.h,
                          labelTextStyle: AppTextStyles.h5,
                          majorTickHeight: 16.h,
                          minorTickHeight: 10.h,
                        ),
                      ],
                    ),
                  ),
                  if (state.weight > 0)
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
