import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_spinner.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/onboard_cubit.dart';
import '../cubit/onboard_state.dart';

class OnboardAgePage extends StatelessWidget {
  const OnboardAgePage({super.key});

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
                          AppConstants.onboardAgeTitle,
                          style: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          AppConstants.onboardAgeDescription,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap60,
                        Center(
                          child: CommonSpinner<int>(
                            height: 200.h,
                            initialItem: AppConstants.humanMetrics.getAgeIndex(
                              state.age ?? 18,
                            ),
                            items: AppConstants.humanMetrics.availableAges
                                .map(
                                  (age) =>
                                      SpinnerItem(label: '$age', item: age),
                                )
                                .toList(),
                            onSelected: (index) {
                              final selectedAge = AppConstants
                                  .humanMetrics
                                  .availableAges[index];
                              context.read<OnboardCubit>().updateAge(
                                selectedAge,
                              );
                            },
                            textStyle: AppTextStyles.h3.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.age != null && state.age! > 0)
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
