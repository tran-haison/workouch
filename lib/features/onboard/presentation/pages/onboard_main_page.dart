import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../workout/domain/enums/activity_level.dart';
import '../cubit/onboard_cubit.dart';
import '../cubit/onboard_state.dart';
import 'onboard_introduction_page.dart';

class OnboardMainPage extends StatelessWidget {
  const OnboardMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardCubit(context.read<AuthCubit>()),
      child: BlocBuilder<OnboardCubit, OnboardState>(
        builder: (context, state) {
          // Page 0: Introduction
          if (state.currentPage == 0) {
            return const OnboardIntroductionPage();
          }

          // Page 1: Gender selection
          if (state.currentPage == 1) {
            return _OnboardGenderPage();
          }

          // Page 2: Age input
          if (state.currentPage == 2) {
            return _OnboardAgePage();
          }

          // Page 3: Height input
          if (state.currentPage == 3) {
            return _OnboardHeightPage();
          }

          // Page 4: Weight input
          if (state.currentPage == 4) {
            return _OnboardWeightPage();
          }

          // Page 5: Activity level selection
          if (state.currentPage == 5) {
            return _OnboardActivityLevelPage();
          }

          // Default: Introduction
          return const OnboardIntroductionPage();
        },
      ),
    );
  }
}

// Gender Selection Page
class _OnboardGenderPage extends StatelessWidget {
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
                          'What\'s your gender?',
                          style: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          'This helps us personalize your workout plan',
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap(60.h),
                        Row(
                          children: [
                            Expanded(
                              child: _GenderButton(
                                label: AppConstants.male.toUpperCase(),
                                icon: Assets.icons.male,
                                isSelected: state.gender == Gender.male,
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
                                isSelected: state.gender == Gender.female,
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
                      backgroundGradientColor: AppColors.backgroundGradient,
                      textStyle: AppTextStyles.h3.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
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
  });

  final String label;
  final SvgGenImage icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.grayBlue,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppColors.black : AppColors.grayBlue,
            width: 2.r,
          ),
        ),
        child: Column(
          children: [
            CommonAssetIcon(
              icon,
              width: 60.r,
              height: 60.r,
              color: isSelected ? AppColors.white : AppColors.black,
            ),
            Gaps.vGap16,
            Text(
              label,
              style: AppTextStyles.h4.copyWith(
                color: isSelected ? AppColors.white : AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Age Input Page
class _OnboardAgePage extends StatefulWidget {
  @override
  State<_OnboardAgePage> createState() => _OnboardAgePageState();
}

class _OnboardAgePageState extends State<_OnboardAgePage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        if (state.age != null && _controller.text.isEmpty) {
          _controller.text = state.age.toString();
        }

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
                          'How old are you?',
                          style: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          'This helps us calculate your optimal workout intensity',
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap(60.h),
                        CommonTextField(
                          controller: _controller,
                          hintText: AppConstants.enterYourAge,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            final age = int.tryParse(value);
                            if (age != null && age > 0 && age <= 150) {
                              context.read<OnboardCubit>().updateAge(age);
                            }
                          },
                          isShowBorder: true,
                          borderColor: AppColors.grayBlue,
                          borderFocusColor: AppColors.black,
                          inputTextStyle: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
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
                      backgroundGradientColor: AppColors.backgroundGradient,
                      textStyle: AppTextStyles.h3.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
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

// Height Input Page
class _OnboardHeightPage extends StatefulWidget {
  @override
  State<_OnboardHeightPage> createState() => _OnboardHeightPageState();
}

class _OnboardHeightPageState extends State<_OnboardHeightPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        if (state.height != null && _controller.text.isEmpty) {
          _controller.text = state.height!.toStringAsFixed(0);
        }

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
                          'What\'s your height?',
                          style: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          'Enter your height in centimeters',
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap(60.h),
                        CommonTextField(
                          controller: _controller,
                          hintText:
                              '${AppConstants.enterYourHeight} (${AppConstants.cm})',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            final height = double.tryParse(value);
                            if (height != null && height > 0 && height <= 300) {
                              context.read<OnboardCubit>().updateHeight(height);
                            }
                          },
                          isShowBorder: true,
                          borderColor: AppColors.grayBlue,
                          borderFocusColor: AppColors.black,
                          inputTextStyle: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.height != null && state.height! > 0)
                    CommonButton(
                      text: AppConstants.next,
                      onPressed: () {
                        context.read<OnboardCubit>().nextPage();
                      },
                      backgroundGradientColor: AppColors.backgroundGradient,
                      textStyle: AppTextStyles.h3.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
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

// Weight Input Page
class _OnboardWeightPage extends StatefulWidget {
  @override
  State<_OnboardWeightPage> createState() => _OnboardWeightPageState();
}

class _OnboardWeightPageState extends State<_OnboardWeightPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        if (state.weight != null && _controller.text.isEmpty) {
          _controller.text = state.weight!.toStringAsFixed(1);
        }

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
                          'What\'s your weight?',
                          style: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          'Enter your weight in kilograms',
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap(60.h),
                        CommonTextField(
                          controller: _controller,
                          hintText:
                              '${AppConstants.enterYourWeight} (${AppConstants.kg})',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            final weight = double.tryParse(value);
                            if (weight != null && weight > 0 && weight <= 500) {
                              context.read<OnboardCubit>().updateWeight(weight);
                            }
                          },
                          isShowBorder: true,
                          borderColor: AppColors.grayBlue,
                          borderFocusColor: AppColors.black,
                          inputTextStyle: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.weight != null && state.weight! > 0)
                    CommonButton(
                      text: AppConstants.next,
                      onPressed: () {
                        context.read<OnboardCubit>().nextPage();
                      },
                      backgroundGradientColor: AppColors.backgroundGradient,
                      textStyle: AppTextStyles.h3.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
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

// Activity Level Selection Page
class _OnboardActivityLevelPage extends StatelessWidget {
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
                          'How active are you?',
                          style: AppTextStyles.h0.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          'This helps us calculate your daily calorie needs',
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        Gaps.vGap40,
                        Expanded(
                          child: ListView.separated(
                            itemCount: ActivityLevel.values.length,
                            separatorBuilder: (_, ___) => Gaps.vGap12,
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
                                      width: isSelected ? 2.r : 1.r,
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
                        text: 'Complete Setup',
                        onPressed: () async {
                          await context
                              .read<OnboardCubit>()
                              .completeOnboarding();
                        },
                        backgroundGradientColor: AppColors.backgroundGradient,
                        textStyle: AppTextStyles.h3.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16.h),
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
