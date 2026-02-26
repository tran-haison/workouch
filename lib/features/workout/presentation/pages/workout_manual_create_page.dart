import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/extension/duration_extension.dart';
import 'package:workouch/core/widgets/common_loading_dialog.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_dismissible.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/working_exercise.dart';
import '../cubit/workout_cubit.dart';
import '../cubit/workout_state.dart';
import '../dialogs/rest_time_dialog.dart';
import '../dialogs/exercise_details_dialog.dart';
import '../widgets/workout_exercise_card.dart';

class WorkoutManualCreatePage extends StatefulWidget {
  const WorkoutManualCreatePage({super.key});

  @override
  State<WorkoutManualCreatePage> createState() =>
      _WorkoutManualCreatePageState();
}

class _WorkoutManualCreatePageState extends State<WorkoutManualCreatePage> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkoutCubit, WorkoutState>(
      listenWhen: (prev, curr) =>
          prev.saveWorkoutStatus != curr.saveWorkoutStatus,
      listener: (context, state) {
        if (state.saveWorkoutStatus == WorkoutStateStatus.loading) {
          context.showLoadingDialog(message: AppConstants.savingWorkout);
        } else {
          context.hideLoadingDialog();
        }

        if (state.saveWorkoutStatus == WorkoutStateStatus.success) {
          showCommonToast(AppConstants.workoutSavedSuccessfully);
          context.read<WorkoutCubit>().updateDisplayedWorkout(
            state.selectedWorkout,
          ); // update the displayed workout to the new one
          context.read<WorkoutCubit>().getAllWorkouts();

          final prevPage = navObserver.prevRoute;
          if (prevPage == AppRoute.workoutDetails.name) {
            context.pop();
          } else {
            context.pushReplacementNamed(AppRoute.workoutDetails.name);
          }

          return;
        }

        if (state.saveWorkoutStatus == WorkoutStateStatus.error) {
          showCommonToast(
            state.saveWorkoutError?.message ?? AppConstants.workoutSavedError,
            isError: true,
          );
        }
      },
      child: BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          final workout = state.selectedWorkout;
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
                          icon: Assets.icons.check,
                          iconColor: AppColors.white,
                          onTap: _saveWorkout,
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
                            child: Row(
                              children: [
                                Text(
                                  state.selectedWorkout.id.isEmpty
                                      ? AppConstants.newWorkout
                                      : AppConstants.updateWorkout,
                                  style: AppTextStyles.h0,
                                ),
                              ],
                            ),
                          ),
                          Gaps.vGap20,
                          Container(
                            width: 1.sw,
                            padding: EdgeInsets.all(20.r),
                            decoration: BoxDecoration(
                              color: AppColors.darkBlack,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CommonAssetIcon(
                                      Assets.icons.namespace,
                                      width: 20.r,
                                      height: 20.r,
                                      color: AppColors.white,
                                    ),
                                    Gaps.hGap10,
                                    Text(
                                      AppConstants.name,
                                      style: AppTextStyles.h4.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Gaps.vGap10,
                                CommonTextField(
                                  controller: _nameController,
                                  hintText: AppConstants.nameHint,
                                  initialValue: workout.name,
                                  onChanged: _onNameChanged,
                                ),
                              ],
                            ),
                          ),
                          Gaps.vGap4,
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
                                CommonButton(
                                  text: workout.restTimeBetweenExercises.mmss,
                                  onPressed: _showRestTimeDialog,
                                  isFullWidth: false,
                                  textStyle: AppTextStyles.h5,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 6.h,
                                  ),
                                  radius: 12.r,
                                  borderColor: AppColors.black,
                                  backgroundColor: AppColors.transparent,
                                  spaceWithTrailing: 4.w,
                                  trailing: CommonAssetIcon(
                                    Assets.icons.arrowDown,
                                    width: 16.r,
                                    height: 16.r,
                                    color: AppColors.black,
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
                                      padding: EdgeInsets.all(3.r),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primary.withValues(
                                          alpha: 0.5,
                                        ),
                                        border: Border.all(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      child: CommonIconButton(
                                        backgroundColor: AppColors.primary,
                                        icon: Assets.icons.add,
                                        iconSize: 20.r,
                                        iconColor: AppColors.black,
                                        onTap: () {
                                          context.pushNamed(
                                            AppRoute.exercises.name,
                                          );
                                        },
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
                                  ReorderableListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    proxyDecorator: (child, _, _) => child,
                                    itemCount: workout.exercises.length,
                                    itemBuilder: (context, index) {
                                      final exercise = workout.exercises[index];
                                      return Padding(
                                        key: ValueKey(exercise.exerciseId),
                                        padding: EdgeInsets.only(bottom: 12.h),
                                        child: CommonDismissible(
                                          id: exercise.exerciseId,
                                          onDismissed: () =>
                                              _removeExercise(exercise),
                                          child: WorkoutExerciseCard(
                                            workingExercise: exercise,
                                            onSelected: () =>
                                                _editExercise(exercise),
                                          ),
                                        ),
                                      );
                                    },
                                    onReorder: (oldIndex, newIndex) =>
                                        _reorderExercise(oldIndex, newIndex),
                                  ),
                              ],
                            ),
                          ),
                          Gaps.vGap4,
                        ],
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

  void _onNameChanged(String value) {
    context.read<WorkoutCubit>().updateSelectedWorkout(name: value.trim());
  }

  Future<void> _editExercise(WorkingExercise exercise) async {
    final res = await ExerciseDetailsDialog.showToEdit(
      context,
      workingExercise: exercise,
    );

    if (!mounted) return;

    if (res is WorkingExercise) {
      context.read<WorkoutCubit>().selectExercise(res);
    } else if (res is String) {
      context.read<WorkoutCubit>().removeExercise(res);
    }
  }

  void _removeExercise(WorkingExercise exercise) {
    context.read<WorkoutCubit>().removeExercise(exercise.exerciseId);
  }

  void _reorderExercise(int oldIndex, int newIndex) {
    context.read<WorkoutCubit>().reorderExercise(oldIndex, newIndex);
  }

  Future<void> _showRestTimeDialog() async {
    final cubit = context.read<WorkoutCubit>();
    final initialValue = cubit.state.selectedWorkout.restTimeBetweenExercises;

    final res = await showRestTimeDialog(
      context,
      title: AppConstants.restBetweenExercises,
      initialValue: initialValue,
    );

    if (mounted && res is Duration) {
      cubit.updateSelectedWorkout(restTime: res);
    }
  }

  Future<void> _saveWorkout() async {
    final cubit = context.read<WorkoutCubit>();
    final workout = cubit.state.selectedWorkout;

    // Validate workout name
    if (workout.name.trim().isEmpty) {
      showCommonToast(AppConstants.pleaseEnterAWorkoutName, isError: true);
      return;
    }

    // Validate exercises
    if (workout.exercises.isEmpty) {
      showCommonToast(AppConstants.pleaseAddAtLeastOneExercise, isError: true);
      return;
    }

    // Save workout
    await cubit.saveWorkout(workout);
  }
}
