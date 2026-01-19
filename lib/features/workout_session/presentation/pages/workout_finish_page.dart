import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/extension/duration_extension.dart';
import 'package:workouch/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/posthog_analytics_service.dart';
import '../../../../core/services/review_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/health_utils.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/review_dialog.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../cubit/workout_session_cubit.dart';
import '../cubit/workout_session_state.dart';

class WorkoutFinishPage extends StatefulWidget {
  const WorkoutFinishPage({super.key});

  @override
  State<WorkoutFinishPage> createState() => _WorkoutFinishPageState();
}

class _WorkoutFinishPageState extends State<WorkoutFinishPage> {
  @override
  void initState() {
    super.initState();
    context.read<WorkoutSessionCubit>().stopAllTimers();

    // Show review dialog after page is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showReviewDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
          builder: (context, state) {
            // Calculate calories (placeholder calculation)
            final calories = HealthUtils.calculateCalories(
              weight: authState.currentUser?.weight ?? 0.0,
              minutes: state.totalTime.minutes,
            );

            return PopScope(
              canPop: false,
              child: Scaffold(
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppConstants.youHaveCompleted,
                        style: AppTextStyles.h4.copyWith(
                          color: AppColors.mediumGray,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        state.workout.name,
                        style: AppTextStyles.anton.copyWith(fontSize: 32.sp),
                        textAlign: TextAlign.center,
                      ),
                      Gaps.vGap30,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: _SummaryCard(
                                icon: Assets.icons.dumbbell,
                                iconColor: AppColors.white,
                                value: state.totalExercisesCompleted.toString(),
                                label: AppConstants.exercises,
                                backgroundColor: AppColors.darkBlack,
                                textColor: AppColors.white,
                              ),
                            ),
                            Gaps.hGap8,
                            Expanded(
                              child: _SummaryCard(
                                icon: Assets.icons.lineWeight,
                                iconColor: AppColors.black,
                                value: state.totalSetsCompleted.toString(),
                                label: AppConstants.sets,
                                backgroundColor: AppColors.primary,
                                textColor: AppColors.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.vGap8,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: _SummaryCard(
                                icon: Assets.icons.clock,
                                iconColor: AppColors.black,
                                value: state.totalTime.hhmmss,
                                label: AppConstants.duration,
                                backgroundColor: AppColors.secondary,
                                textColor: AppColors.text,
                              ),
                            ),
                            Gaps.hGap8,
                            Expanded(
                              child: _SummaryCard(
                                icon: Assets.icons.fire,
                                iconColor: AppColors.black,
                                value: '$calories',
                                label: AppConstants.calories,
                                backgroundColor: AppColors.grayBlue,
                                textColor: AppColors.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.vGap40,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: CommonButton(
                          text: AppConstants.backToHome,
                          backgroundColor: AppColors.darkBlack,
                          onPressed: () {
                            // Analytics: workout completed
                            PosthogService.logWorkoutCompleted();

                            // Navigate to home
                            context.goNamed(AppRoute.home.name);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _showReviewDialog(BuildContext context) async {
    final reviewService = getIt<ReviewService>();
    final shouldShow = await reviewService.shouldShowReviewDialog();
    if (shouldShow && context.mounted) {
      context.showReviewDialog();
    }
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  final dynamic icon;
  final Color iconColor;
  final String value;
  final String label;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CommonAssetIcon(
                icon,
                width: 20.r,
                height: 20.r,
                color: iconColor,
              ),
              Gaps.hGap12,
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.h4.copyWith(
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
          Gaps.vGap40,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  value,
                  style: AppTextStyles.orbitron.copyWith(
                    fontSize: 24.sp,
                    color: textColor,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
