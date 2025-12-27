import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/extension/duration_extension.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_images.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/workout_session_cubit.dart';
import '../cubit/workout_session_state.dart';
import '../dialogs/exercise_info_dialog.dart';
import '../dialogs/workout_finish_dialogs.dart';
import '../widgets/workout_set_list.dart';
import '../widgets/rest_timer_overlay.dart';

class WorkoutExecutionPage extends StatelessWidget {
  const WorkoutExecutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
      builder: (context, state) {
        final currentExercise = state.currentExercise;

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            _exitWorkout(context);
          },
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  // Header with progress and back button
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
                          onTap: () => _exitWorkout(context),
                        ),
                        Gaps.hGap12,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppConstants.workout,
                                style: AppTextStyles.h5.copyWith(
                                  color: AppColors.mediumGray,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                state.workout.name,
                                style: AppTextStyles.h3.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Gaps.hGap12,
                        CommonIconButton(
                          backgroundColor: AppColors.darkBlack,
                          icon: Assets.icons.check,
                          iconColor: AppColors.white,
                          onTap: () => _finishWorkout(context),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1.sw,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: AppColors.grayBlue,
                                  width: 1.r,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: CommonNetworkImage(
                                  url: currentExercise.gifUrl,
                                  width: 60.r,
                                  height: 60.r,
                                  fit: BoxFit.contain,
                                  backgroundColor: AppColors.transparent,
                                ),
                              ),
                            ),
                            Gaps.hGap16,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentExercise.name,
                                    style: AppTextStyles.h4.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    currentExercise.displayMainInfo,
                                    style: AppTextStyles.h5.copyWith(
                                      color: AppColors.mediumGray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gaps.hGap16,
                            CommonIconButton(
                              backgroundColor: AppColors.transparent,
                              icon: Assets.icons.info,
                              iconSize: 20.r,
                              padding: EdgeInsets.all(4.r),
                              iconColor: AppColors.black,
                              onTap: () => showExerciseInfoDialog(
                                context,
                                exercise: currentExercise,
                              ),
                            ),
                          ],
                        ),
                        Gaps.vGap16,
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    AppConstants.exercise,
                                    style: AppTextStyles.h5.copyWith(
                                      color: AppColors.mediumGray,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '${state.currentExerciseIndex + 1}/${state.workout.exercises.length}',
                                    style: AppTextStyles.h4.copyWith(
                                      color: AppColors.text,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            _VerticalDivider(),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    AppConstants.sets,
                                    style: AppTextStyles.h5.copyWith(
                                      color: AppColors.mediumGray,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    state.currentExercise.separatedSets.length
                                        .toString(),
                                    style: AppTextStyles.h4.copyWith(
                                      color: AppColors.text,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            _VerticalDivider(),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    AppConstants.duration,
                                    style: AppTextStyles.h5.copyWith(
                                      color: AppColors.mediumGray,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    state.totalTime.hhmmss,
                                    style: AppTextStyles.h4.copyWith(
                                      color: AppColors.text,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Stack(
                        children: [
                          WorkoutSetList(
                            onCompleteCurrentSet: () => _nextSet(context),
                          ),
                          RestTimerOverlay(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonIconButton(
                          icon: Assets.icons.arrowLeft,
                          iconColor: AppColors.white,
                          backgroundColor: state.isFirstExercise
                              ? AppColors.mediumGray
                              : AppColors.darkBlack,
                          onTap: () => _prevExercise(context),
                        ),
                        Gaps.hGap8,
                        CommonIconButton(
                          icon: Assets.icons.arrowRight,
                          iconColor: AppColors.white,
                          backgroundColor: state.isLastExercise
                              ? AppColors.mediumGray
                              : AppColors.darkBlack,
                          onTap: () => _nextExercise(context, state),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _prevExercise(BuildContext context) {
    context.read<WorkoutSessionCubit>().goPrevExercise();
  }

  void _nextExercise(BuildContext context, WorkoutSessionState state) {
    if (state.hasNextExercise) {
      if (state.hasRestExercises) {
        // Navigate to rest page before advancing to next exercise
        context.pushNamed(AppRoute.workoutRest.name);
      } else {
        // No rest needed, advance directly
        context.read<WorkoutSessionCubit>().goNextExercise();
      }
    }
  }

  void _nextSet(BuildContext context) {
    context.read<WorkoutSessionCubit>().goNextSet();

    // Check if all sets of current exercise are completed
    final state = context.read<WorkoutSessionCubit>().state;
    // If not, start rest timer and return
    if (!state.allSetsCompleted) {
      // Start rest timer if rest time is configured
      if (state.hasRestSets) {
        context.read<WorkoutSessionCubit>().startRestSetsTimer(
          state.currentExercise.restTimeBetweenSets,
        );
      }
      return;
    }

    // If all sets are completed, move to next exercise
    _nextExercise(context, state);
  }

  Future<void> _exitWorkout(BuildContext context) async {
    await showWorkoutExitDialog(context);
  }

  Future<void> _finishWorkout(BuildContext context) async {
    await showWorkoutFinishDialog(context);
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.5.w,
      height: 16.h,
      decoration: BoxDecoration(
        color: AppColors.mediumGray.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
