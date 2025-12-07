import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/extension/duration_extension.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_pop_up_dialog.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/workout_cubit.dart';
import '../cubit/workout_state.dart';
import '../widgets/workout_exercise_card.dart';

class WorkoutDetailsPage extends StatelessWidget {
  const WorkoutDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkoutCubit, WorkoutState>(
      listenWhen: (prev, curr) =>
          prev.deleteWorkoutStatus != curr.deleteWorkoutStatus,
      listener: (context, state) {
        if (state.deleteWorkoutStatus == WorkoutStateStatus.success) {
          showCommonToast(AppConstants.workoutDeletedSuccessfully);
          context.read<WorkoutCubit>().getAllWorkouts();
          context.pop();
          return;
        }

        if (state.deleteWorkoutStatus == WorkoutStateStatus.error) {
          showCommonToast(
            state.deleteWorkoutError?.message ??
                AppConstants.workoutDeletedError,
            isError: true,
          );
        }
      },
      child: BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          final workout = state.displayedWorkout;
          return Scaffold(
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
                          onTap: () => context.pop(),
                        ),
                        const Spacer(),
                        CommonIconButton(
                          backgroundColor: AppColors.darkBlack,
                          icon: Assets.icons.edit,
                          iconSize: 20.r,
                          iconColor: AppColors.white,
                          onTap: () => _updateWorkout(context),
                        ),
                        Gaps.hGap10,
                        CommonIconButton(
                          backgroundColor: AppColors.errorDark,
                          icon: Assets.icons.delete,
                          iconSize: 20.r,
                          iconColor: AppColors.white,
                          onTap: () =>
                              _showDeleteConfirmation(context, workout.id),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(workout.name, style: AppTextStyles.h0),
                          ),
                          Gaps.vGap20,
                          Container(
                            width: 1.sw,
                            padding: EdgeInsets.all(20.r),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CommonAssetIcon(
                                  Assets.icons.rest,
                                  width: 20.r,
                                  height: 20.r,
                                  color: AppColors.black,
                                ),
                                Gaps.hGap10,
                                Expanded(
                                  child: Text(
                                    AppConstants.restBetweenExercises,
                                    style: AppTextStyles.h4.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Gaps.hGap10,
                                Text(
                                  workout.restTimeBetweenExercises.mmss,
                                  style: AppTextStyles.h4.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gaps.vGap4,
                          Container(
                            width: 1.sw,
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: AppColors.grayBlue,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Gaps.hGap10,
                                    CommonAssetIcon(
                                      Assets.icons.lineWeight,
                                      width: 20.r,
                                      height: 20.r,
                                      color: AppColors.black,
                                    ),
                                    Gaps.hGap10,
                                    Expanded(
                                      child: Text(
                                        AppConstants.exercises,
                                        style: AppTextStyles.h4.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Gaps.hGap10,
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        '${workout.exercises.length}',
                                        style: AppTextStyles.h5,
                                      ),
                                    ),
                                  ],
                                ),
                                Gaps.vGap10,
                                if (workout.exercises.isEmpty)
                                  Padding(
                                    padding: EdgeInsets.all(20.r),
                                    child: Text(
                                      AppConstants.noExerciseSelected,
                                      style: AppTextStyles.h5.copyWith(
                                        color: AppColors.mediumGray,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                else
                                  ...workout.exercises.map((exercise) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 12.h),
                                      child: WorkoutExerciseCard(
                                        workingExercise: exercise,
                                      ),
                                    );
                                  }),
                              ],
                            ),
                          ),
                          Gaps.vGap4,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    child: CommonButton(
                      text: AppConstants.startWorkout,
                      onPressed: () => _startWorkout(context),
                      trailing: CommonAssetIcon(
                        Assets.icons.rocket,
                        width: 20.r,
                        height: 20.r,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _startWorkout(BuildContext context) {
    final workout = context.read<WorkoutCubit>().state.displayedWorkout;
    context.pushNamed(AppRoute.workoutReady.name, extra: workout);
  }

  Future<void> _updateWorkout(BuildContext context) async {
    final cubit = context.read<WorkoutCubit>();
    final displayedWorkout = cubit.state.displayedWorkout;

    // Set selectedWorkout to displayedWorkout for editing
    cubit.updateSelectedWorkout(
      id: displayedWorkout.id,
      name: displayedWorkout.name,
      exercises: displayedWorkout.exercises,
      restTime: displayedWorkout.restTimeBetweenExercises,
    );

    await context.pushNamed(AppRoute.workoutCreation.name);
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    String workoutId,
  ) async {
    await showCommonPopUpDialog(
      context,
      title: AppConstants.deleteWorkout,
      message: AppConstants.deleteWorkoutConfirmation,
      firstButtonText: AppConstants.cancel,
      secondButtonText: AppConstants.delete,
      onSecondButtonPressed: () {
        context.read<WorkoutCubit>().deleteWorkout(workoutId);
      },
    );
  }
}
