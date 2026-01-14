import 'dart:async';

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
import '../cubit/onboard_cubit.dart';
import '../widgets/onboard_intro_feature_1.dart';
import '../widgets/onboard_intro_feature_2.dart';
import '../widgets/onboard_intro_feature_3.dart';
import '../widgets/onboard_intro_feature_4.dart';
import '../widgets/onboard_intro_feature_5.dart';

class OnboardIntroductionPage extends StatefulWidget {
  const OnboardIntroductionPage({super.key});

  @override
  State<OnboardIntroductionPage> createState() =>
      _OnboardIntroductionPageState();
}

class _OnboardIntroductionPageState extends State<OnboardIntroductionPage>
    with SingleTickerProviderStateMixin {
  int _currentFeatureIndex = 0;
  Timer? _timer;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<_Feature> _features = [
    _Feature(
      title: AppConstants.onboardFeature1Title,
      description: AppConstants.onboardFeature1Description,
      content: const OnboardIntroFeature1(),
    ),
    _Feature(
      title: AppConstants.onboardFeature2Title,
      description: AppConstants.onboardFeature2Description,
      content: const OnboardIntroFeature2(),
    ),
    _Feature(
      title: AppConstants.onboardFeature3Title,
      description: AppConstants.onboardFeature3Description,
      content: const OnboardIntroFeature3(),
    ),
    _Feature(
      title: AppConstants.onboardFeature4Title,
      description: AppConstants.onboardFeature4Description,
      content: const OnboardIntroFeature4(),
    ),
    _Feature(
      title: AppConstants.onboardFeature5Title,
      description: AppConstants.onboardFeature5Description,
      content: const OnboardIntroFeature5(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted) {
        setState(() {
          _currentFeatureIndex = (_currentFeatureIndex + 1) % _features.length;
        });
        _controller.reset();
        _controller.forward();
      }
    });
  }

  void _onGetStarted() {
    if (mounted) {
      context.read<OnboardCubit>().nextPage();
    }
  }

  void _onSkip() {
    if (mounted) {
      context.goNamed(AppRoute.home.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentFeature = _features[_currentFeatureIndex];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Invisible button to balance layout
                  Opacity(
                    opacity: 0,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppConstants.skip,
                        style: AppTextStyles.h4.copyWith(
                          color: AppColors.mediumGray,
                        ),
                      ),
                    ),
                  ),
                  // Feature indicator dots - centered
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      _features.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: index == _currentFeatureIndex ? 24.w : 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: index == _currentFeatureIndex
                                ? AppColors.darkBlack
                                : AppColors.grayBlue,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Skip button
                  TextButton(
                    onPressed: _onSkip,
                    child: Text(
                      AppConstants.skip,
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.mediumGray,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _StyledFeatureTitle(title: currentFeature.title),
                            Gaps.vGap16,
                            Text(
                              currentFeature.description,
                              style: AppTextStyles.h4.copyWith(
                                color: AppColors.mediumGray,
                              ),
                            ),
                            Gaps.vGap40,
                            currentFeature.content,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.vGap40,
              CommonButton(
                text: AppConstants.getStarted,
                onPressed: _onGetStarted,
                textStyle: AppTextStyles.h3.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),
              ),
              Gaps.vGap20,
            ],
          ),
        ),
      ),
    );
  }
}

class _StyledFeatureTitle extends StatelessWidget {
  const _StyledFeatureTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // Feature 1: "Stop spending hours planning your workouts"
    if (title == AppConstants.onboardFeature1Title) {
      return _buildRichText([
        _KeywordStyle(text: 'Stop spending ', color: AppColors.text),
        _KeywordStyle(text: 'hours ', color: AppColors.secondaryDark),
        _KeywordStyle(text: 'planning your workouts', color: AppColors.text),
      ]);
    }

    // Feature 2: "Get personalized routines, tailored for you"
    if (title == AppConstants.onboardFeature2Title) {
      return _buildRichText([
        _KeywordStyle(text: 'Get ', color: AppColors.text),
        _KeywordStyle(text: 'personalized', color: AppColors.secondaryDark),
        _KeywordStyle(
          text: ' routines tailored just for you',
          color: AppColors.text,
        ),
      ]);
    }

    // Feature 3: "Be the best version of yourself"
    if (title == AppConstants.onboardFeature3Title) {
      return _buildRichText([
        _KeywordStyle(text: 'Be the ', color: AppColors.text),
        _KeywordStyle(text: 'best', color: AppColors.secondaryDark),
        _KeywordStyle(text: ' version of yourself', color: AppColors.text),
      ]);
    }

    // Feature 4: "Know your data, track your progress"
    if (title == AppConstants.onboardFeature4Title) {
      return _buildRichText([
        _KeywordStyle(text: 'Know your ', color: AppColors.text),
        _KeywordStyle(text: 'data', color: AppColors.secondaryDark),
        _KeywordStyle(text: ', track your ', color: AppColors.text),
        _KeywordStyle(text: 'progress', color: AppColors.secondaryDark),
      ]);
    }

    // Feature 5: "Full list of exercises"
    if (title == AppConstants.onboardFeature5Title) {
      return _buildRichText([
        _KeywordStyle(text: 'Full list of ', color: AppColors.text),
        _KeywordStyle(text: 'exercises', color: AppColors.secondaryDark),
      ]);
    }

    // Fallback to default styling
    return Text(
      title,
      style: AppTextStyles.anton.copyWith(fontSize: 24.sp),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildRichText(List<_KeywordStyle> styles) {
    final textSpans = styles
        .map(
          (style) => TextSpan(
            text: style.text,
            style: AppTextStyles.anton.copyWith(
              fontSize: 32.sp,
              color: style.color,
            ),
          ),
        )
        .toList();

    return RichText(text: TextSpan(children: textSpans));
  }
}

class _Feature {
  const _Feature({
    required this.title,
    required this.description,
    required this.content,
  });

  final String title;
  final String description;
  final Widget content;
}

class _KeywordStyle {
  const _KeywordStyle({required this.text, required this.color});

  final String text;
  final Color color;
}
