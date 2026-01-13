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
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/onboard_cubit.dart';

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
      content: const _ResponsiveTwoImages(),
    ),
    _Feature(
      title: AppConstants.onboardFeature2Title,
      description: AppConstants.onboardFeature2Description,
      content: const _SampleRoutineCard(),
    ),
    _Feature(
      title: AppConstants.onboardFeature3Title,
      description: AppConstants.onboardFeature3Description,
      content: const _TestimonialsWidget(),
    ),
    _Feature(
      title: AppConstants.onboardFeature4Title,
      description: AppConstants.onboardFeature4Description,
      content: const _AnalyticsWidget(),
    ),
    _Feature(
      title: AppConstants.onboardFeature5Title,
      description: AppConstants.onboardFeature5Description,
      content: const _ExerciseImagesScrollWidget(),
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

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
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

class _ResponsiveTwoImages extends StatelessWidget {
  const _ResponsiveTwoImages();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate available width
        // Padding is 20.r on each side, so 40.r total horizontal padding
        // Gap between images is 20.w
        final screenWidth = MediaQuery.of(context).size.width;
        final horizontalPadding = 40.r;
        final gapWidth = 20.w;
        final availableWidth = screenWidth - horizontalPadding - gapWidth;

        // Split width: left image gets 45%, right image gets 40%
        final leftImageWidth = availableWidth * 0.45;
        final rightImageWidth = availableWidth * 0.4;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.imgPhoneSample1.image(
              width: leftImageWidth,
              fit: BoxFit.contain,
            ),
            Gaps.hGap10,
            CommonAssetIcon(
              Assets.icons.arrowRightWide,
              width: 20.r,
              height: 20.r,
              color: AppColors.black,
            ),
            Gaps.hGap10,
            Assets.images.imgPhoneSample2.image(
              width: rightImageWidth,
              fit: BoxFit.contain,
            ),
          ],
        );
      },
    );
  }
}

class _SampleRoutineCard extends StatelessWidget {
  const _SampleRoutineCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.grayBlue, width: 1.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Routine name
          Text(
            AppConstants.onboardSampleRoutineName,
            style: AppTextStyles.anton.copyWith(fontSize: 24.sp),
          ),
          Gaps.vGap12,
          // Number of exercises
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.grayBlue,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonAssetIcon(
                  Assets.icons.fire,
                  width: 16.r,
                  height: 16.r,
                  useDefaultColor: true,
                ),
                Gaps.hGap6,
                Text(
                  '${AppConstants.onboardSampleRoutineExerciseCount} ${AppConstants.exercises.toLowerCase()}',
                  style: AppTextStyles.h5,
                ),
              ],
            ),
          ),
          Gaps.vGap20,
          // Sample exercises
          _SampleExerciseItem(
            image: Assets.images.imgSampleExercise1,
            exerciseName: AppConstants.onboardSampleExercise1Name,
            exerciseInfo: AppConstants.onboardSampleExercise1Info,
          ),
          Gaps.vGap12,
          _SampleExerciseItem(
            image: Assets.images.imgSampleExercise2,
            exerciseName: AppConstants.onboardSampleExercise2Name,
            exerciseInfo: AppConstants.onboardSampleExercise2Info,
          ),
        ],
      ),
    );
  }
}

class _SampleExerciseItem extends StatelessWidget {
  const _SampleExerciseItem({
    required this.image,
    required this.exerciseName,
    required this.exerciseInfo,
  });

  final AssetGenImage image;
  final String exerciseName;
  final String exerciseInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Exercise GIF image
        Container(
          width: 60.r,
          height: 60.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.grayBlue, width: 1.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: image.image(width: 60.r, height: 60.r, fit: BoxFit.cover),
          ),
        ),
        Gaps.hGap12,
        // Exercise name and info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exerciseName,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
              Gaps.vGap4,
              Text(
                exerciseInfo,
                style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TestimonialsWidget extends StatelessWidget {
  const _TestimonialsWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _TestimonialItem(
          avatarPath: Assets.images.imgTestimonial1.path,
          userName: AppConstants.onboardTestimonial1UserName,
          feedback: AppConstants.onboardTestimonial1Feedback,
        ),
        Gaps.vGap12,
        _TestimonialItem(
          avatarPath: Assets.images.imgTestimonial2.path,
          userName: AppConstants.onboardTestimonial2UserName,
          feedback: AppConstants.onboardTestimonial2Feedback,
        ),
        Gaps.vGap12,
        _TestimonialItem(
          avatarPath: Assets.images.imgTestimonial3.path,
          userName: AppConstants.onboardTestimonial3UserName,
          feedback: AppConstants.onboardTestimonial3Feedback,
        ),
      ],
    );
  }
}

class _TestimonialItem extends StatelessWidget {
  const _TestimonialItem({
    required this.avatarPath,
    required this.userName,
    required this.feedback,
  });

  final String avatarPath;
  final String userName;
  final String feedback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grayBlue, width: 1.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          ClipOval(
            child: Image.asset(
              avatarPath,
              width: 50.r,
              height: 50.r,
              fit: BoxFit.cover,
            ),
          ),
          Gaps.hGap12,
          // User name and feedback
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
                ),
                Gaps.vGap4,
                Text(
                  feedback,
                  style: AppTextStyles.h5.copyWith(
                    color: AppColors.mediumGray,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnalyticsWidget extends StatelessWidget {
  const _AnalyticsWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.grayBlue, width: 1.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            AppConstants.onboardAnalyticsTitle,
            style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
          ),
          Gaps.vGap20,
          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _AnalyticsStatItem(
                label: AppConstants.weight,
                value: AppConstants.onboardAnalyticsWeightValue,
                change: AppConstants.onboardAnalyticsWeightChange,
                isPositive: true,
              ),
              _AnalyticsStatItem(
                label: AppConstants.bmi,
                value: AppConstants.onboardAnalyticsBmiValue,
                change: AppConstants.onboardAnalyticsBmiChange,
                isPositive: false,
              ),
              _AnalyticsStatItem(
                label: AppConstants.workouts,
                value: AppConstants.onboardAnalyticsWorkoutsValue,
                change: AppConstants.onboardAnalyticsWorkoutsChange,
                isPositive: true,
              ),
            ],
          ),
          Gaps.vGap24,
          // Progress bars
          _ProgressBarItem(
            label: AppConstants.onboardAnalyticsWorkoutFrequency,
            value: 85,
            maxValue: 100,
          ),
          Gaps.vGap12,
          _ProgressBarItem(
            label: AppConstants.onboardAnalyticsGoalProgress,
            value: 68,
            maxValue: 100,
          ),
          Gaps.vGap12,
          _ProgressBarItem(
            label: AppConstants.onboardAnalyticsConsistency,
            value: 92,
            maxValue: 100,
          ),
        ],
      ),
    );
  }
}

class _AnalyticsStatItem extends StatelessWidget {
  const _AnalyticsStatItem({
    required this.label,
    required this.value,
    required this.change,
    required this.isPositive,
  });

  final String label;
  final String value;
  final String change;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.h6.copyWith(color: AppColors.mediumGray),
        ),
        Gaps.vGap4,
        Text(
          value,
          style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
        ),
        Gaps.vGap4,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isPositive ? Icons.arrow_upward : Icons.arrow_downward,
              size: 12.r,
              color: isPositive ? AppColors.success : AppColors.error,
            ),
            Gaps.hGap4,
            Text(
              change,
              style: AppTextStyles.h6.copyWith(
                color: isPositive ? AppColors.success : AppColors.error,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProgressBarItem extends StatelessWidget {
  const _ProgressBarItem({
    required this.label,
    required this.value,
    required this.maxValue,
  });

  final String label;
  final int value;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    final percentage = (value / maxValue).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.h5),
            Text(
              '$value%',
              style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Gaps.vGap8,
        Container(
          height: 8.h,
          decoration: BoxDecoration(
            color: AppColors.grayBlue,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.backgroundGradient,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ExerciseImagesScrollWidget extends StatefulWidget {
  const _ExerciseImagesScrollWidget();

  @override
  State<_ExerciseImagesScrollWidget> createState() =>
      _ExerciseImagesScrollWidgetState();
}

class _ExerciseImagesScrollWidgetState
    extends State<_ExerciseImagesScrollWidget> {
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;
  Timer? _scrollTimer1;
  Timer? _scrollTimer2;
  Timer? _scrollTimer3;

  // 9 exercise images divided into 3 lists
  final List<String> _list1Images = [
    Assets.images.imgSampleExercise1.path,
    Assets.images.imgSampleExercise2.path,
    Assets.images.imgSampleExercise3.path,
  ];
  final List<String> _list2Images = [
    Assets.images.imgSampleExercise4.path,
    Assets.images.imgSampleExercise5.path,
    Assets.images.imgSampleExercise6.path,
  ];
  final List<String> _list3Images = [
    Assets.images.imgSampleExercise7.path,
    Assets.images.imgSampleExercise8.path,
    Assets.images.imgSampleExercise9.path,
  ];

  @override
  void initState() {
    super.initState();
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController3 = ScrollController();

    // Start auto-scrolling after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    // List 1: Scroll right to left (forward)
    _scrollTimer1 = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!mounted || !_scrollController1.hasClients) return;
      final currentScroll = _scrollController1.position.pixels;
      final itemWidth = 80.r + 12.w; // width + margin
      final listWidth = itemWidth * 3; // 3 items per list

      if (currentScroll >= listWidth) {
        // Reset to start of first set when reaching end of second set
        _scrollController1.jumpTo(currentScroll - listWidth);
      } else {
        _scrollController1.jumpTo(currentScroll + 0.5);
      }
    });

    // List 2: Scroll left to right (backwards scrolling)
    _scrollTimer2 = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!mounted || !_scrollController2.hasClients) return;
      final currentScroll = _scrollController2.position.pixels;
      final maxScroll = _scrollController2.position.maxScrollExtent;

      // Scroll backwards (decrease pixels) to achieve left-to-right visual effect
      // Start at maxScrollExtent (rightmost) and scroll backwards (decrease) to move left-to-right
      if (currentScroll <= 0) {
        // Reset to rightmost position when reaching leftmost
        _scrollController2.jumpTo(maxScroll);
      } else {
        // Decrease pixels to scroll backwards (left-to-right visually)
        _scrollController2.jumpTo(currentScroll - 0.5);
      }
    });

    // List 3: Scroll right to left (forward)
    _scrollTimer3 = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (!mounted || !_scrollController3.hasClients) return;
      final currentScroll = _scrollController3.position.pixels;
      final itemWidth = 80.r + 12.w; // width + margin
      final listWidth = itemWidth * 3; // 3 items per list

      if (currentScroll >= listWidth) {
        // Reset to start of first set when reaching end of second set
        _scrollController3.jumpTo(currentScroll - listWidth);
      } else {
        _scrollController3.jumpTo(currentScroll + 0.5);
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer1?.cancel();
    _scrollTimer2?.cancel();
    _scrollTimer3?.cancel();
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildScrollableList(
          controller: _scrollController1,
          images: _list1Images,
        ),
        Gaps.vGap12,
        _buildScrollableList(
          controller: _scrollController2,
          images: _list2Images,
        ),
        Gaps.vGap12,
        _buildScrollableList(
          controller: _scrollController3,
          images: _list3Images,
        ),
      ],
    );
  }

  Widget _buildScrollableList({
    required ScrollController controller,
    required List<String> images,
  }) {
    // Duplicate images for infinite scroll effect
    final duplicatedImages = [...images, ...images, ...images];

    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemCount: duplicatedImages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 12.w),
            width: 80.r,
            height: 80.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.grayBlue, width: 1.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                duplicatedImages[index],
                width: 80.r,
                height: 80.r,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
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

class _KeywordStyle {
  const _KeywordStyle({required this.text, required this.color});

  final String text;
  final Color color;
}
