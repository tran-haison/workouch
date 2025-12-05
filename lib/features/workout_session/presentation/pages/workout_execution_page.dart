import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/widgets/common_pop_up_dialog.dart';
import 'package:workouch/features/workout_session/presentation/widgets/workout_total_timer.dart';

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
import '../widgets/workout_set_list.dart';
import '../widgets/rest_timer_overlay.dart';

class WorkoutExecutionPage extends StatelessWidget {
  const WorkoutExecutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutSessionCubit, WorkoutSessionState>(
      listenWhen: (prev, current) =>
          prev.currentSetIndex != current.currentSetIndex,
      listener: (context, state) {
        // Handle next set of current exercise
        if (!state.allSetsCompleted) {
          // Start rest timer if rest time is configured
          if (state.hasRestSets) {
            context.read<WorkoutSessionCubit>().startRestSetsTimer(
              state.currentExercise.restTimeBetweenSets,
            );
          }
          return;
        }

        _nextExercise(context, state);
      },
      builder: (context, state) {
        final currentExercise = state.currentExercise;

        return Scaffold(
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
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: AppColors.grayBlue, width: 1.r),
                  ),
                  child: CommonNetworkImage(
                    url: currentExercise.gifUrl,
                    width: 120.r,
                    height: 120.r,
                    backgroundColor: AppColors.transparent,
                  ),
                ),
                Gaps.vGap20,
                Text(
                  currentExercise.name,
                  style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Gaps.vGap4,
                Text(
                  '${state.currentExerciseIndex + 1}/${state.workout.exercises.length}',
                  style: AppTextStyles.h4.copyWith(color: AppColors.mediumGray),
                  textAlign: TextAlign.center,
                ),
                Gaps.vGap10,
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                          vertical: 10.h,
                        ),
                        child: WorkoutSetList(),
                      ),
                      RestTimerOverlay(),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.grayBlue,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonIconButton(
                        icon: Assets.icons.arrowLeft,
                        iconColor: AppColors.white,
                        backgroundColor: state.isFirstExercise
                            ? AppColors.mediumGray
                            : AppColors.black,
                        radius: 16.r,
                        onTap: () => _prevExercise(context),
                      ),
                      Gaps.hGap12,
                      Flexible(child: WorkoutTotalTimer()),
                      Gaps.hGap12,
                      CommonIconButton(
                        icon: Assets.icons.arrowRight,
                        iconColor: AppColors.white,
                        backgroundColor: state.isLastExercise
                            ? AppColors.mediumGray
                            : AppColors.black,
                        radius: 16.r,
                        onTap: () => _nextExercise(context, state),
                      ),
                    ],
                  ),
                ),
              ],
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

  Future<void> _exitWorkout(BuildContext context) async {
    await showCommonPopUpDialog(
      context,
      title: AppConstants.exitWorkout,
      message: AppConstants.exitWorkoutMessage,
      onFirstButtonPressed: () {
        context.pop();
      },
    );
  }

  Future<void> _finishWorkout(BuildContext context) async {
    await showCommonPopUpDialog(
      context,
      title: AppConstants.finishWorkout,
      message: AppConstants.finishWorkoutMessage,
      onFirstButtonPressed: () {
        // TODO: Implement finish workout logic
      },
    );
  }
}
