import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/extension/duration_extension.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/workout_session_cubit.dart';
import '../cubit/workout_session_state.dart';
import '../widgets/next_exercise_card.dart';
import '../dialogs/workout_finish_dialogs.dart';

class WorkoutRestPage extends StatefulWidget {
  const WorkoutRestPage({super.key});

  @override
  State<WorkoutRestPage> createState() => _WorkoutRestPageState();
}

class _WorkoutRestPageState extends State<WorkoutRestPage> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<WorkoutSessionCubit>();
    final state = cubit.state;
    cubit.startRestExercisesTimer(state.workout.restTimeBetweenExercises);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkoutSessionCubit, WorkoutSessionState>(
      listenWhen: (prev, current) =>
          prev.isRestExercisesActive != current.isRestExercisesActive,
      listener: (context, state) {
        // Navigate back to main page when rest timer completes automatically
        if (!state.isRestExercisesActive) {
          if (mounted && context.canPop()) {
            _nextExercise(context);
          }
        }
      },
      child: BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
        builder: (context, state) {
          final nextExercise = state.hasNextExercise
              ? state.workout.exercises[state.currentExerciseIndex + 1]
              : null;

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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.totalTime.hhmmss,
                                style: AppTextStyles.h4.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
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
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 290.r,
                                height: 290.r,
                                decoration: BoxDecoration(
                                  color: AppColors.secondary.withValues(
                                    alpha: 0.3,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    width: 270.r,
                                    height: 270.r,
                                    decoration: BoxDecoration(
                                      color: AppColors.secondary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 250.r,
                                        height: 250.r,
                                        padding: EdgeInsets.all(3.r),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: TweenAnimationBuilder<double>(
                                          duration: const Duration(
                                            milliseconds: 1000,
                                          ),
                                          curve: Curves.linear,
                                          tween: Tween<double>(
                                            begin: 1.0,
                                            end:
                                                state
                                                    .restExercisesRemain
                                                    .inMilliseconds /
                                                state
                                                    .workout
                                                    .restTimeBetweenExercises
                                                    .inMilliseconds,
                                          ),
                                          builder: (context, value, _) {
                                            return CircularProgressIndicator(
                                              strokeWidth: 6.r,
                                              backgroundColor: AppColors.primary
                                                  .withValues(alpha: 0.2),
                                              color: AppColors.darkBlack,
                                              value: value,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 250.r,
                                padding: EdgeInsets.all(10.r),
                                child: Text(
                                  state.restExercisesRemain.mmss,
                                  style: AppTextStyles.orbitron.copyWith(
                                    fontSize: 40.sp,
                                    color: AppColors.darkBlack,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Gaps.vGap40,
                          // Time adjustment buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonButton(
                                text: AppConstants.minusTenSecs,
                                backgroundColor: AppColors.grayBlue,
                                textStyle: AppTextStyles.h4.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                isFullWidth: false,
                                onPressed: () {
                                  context
                                      .read<WorkoutSessionCubit>()
                                      .decreaseRestExercises(10);
                                },
                              ),
                              Gaps.hGap16,
                              CommonButton(
                                text: AppConstants.plusTenSecs,
                                backgroundColor: AppColors.grayBlue,
                                textStyle: AppTextStyles.h4.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                isFullWidth: false,
                                onPressed: () {
                                  context
                                      .read<WorkoutSessionCubit>()
                                      .increaseRestExercises(10);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (nextExercise != null)
                    NextExerciseCard(
                      exercise: nextExercise,
                      onSkip: () => _nextExercise(context),
                    ),
                ],
              ),
            ),
            ),
          );
        },
      ),
    );
  }

  void _nextExercise(BuildContext context) {
    context.read<WorkoutSessionCubit>().stopRestExercisesTimer();
    context.read<WorkoutSessionCubit>().goNextExercise();
    context.pop();
  }

  Future<void> _exitWorkout(BuildContext context) async {
    await showWorkoutExitDialog(context);
  }

  Future<void> _finishWorkout(BuildContext context) async {
    await showWorkoutFinishDialog(context);
  }
}
