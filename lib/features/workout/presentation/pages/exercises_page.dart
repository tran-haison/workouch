import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/exercise_filter.dart';
import '../../domain/entities/working_exercise.dart';
import '../cubit/workout_cubit.dart';
import '../cubit/workout_state.dart';
import '../dialogs/exercise_filter_dialog.dart';
import '../widgets/exercise_card_item.dart';
import '../dialogs/exercise_details_dialog.dart';
import '../dialogs/exercise_selected_list_dialog.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    // Setup pagination on scroll
    _scrollController.addListener(_onScroll);

    // Load initial data
    context.read<WorkoutCubit>().getExercises();
    context.read<WorkoutCubit>().getBodyParts();
    context.read<WorkoutCubit>().getEquipments();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchDebounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        top: 20.h,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CommonIconButton(
                                backgroundColor: AppColors.grayBlue,
                                icon: Assets.icons.close,
                                iconColor: AppColors.black,
                                onTap: () {
                                  context.pop();
                                },
                              ),
                              const Spacer(),
                              CommonButton(
                                isFullWidth: false,
                                text: AppConstants.clearAll,
                                onPressed: _clearAll,
                                textStyle: AppTextStyles.h4.copyWith(
                                  color: AppColors.text,
                                  fontWeight: FontWeight.w600,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 8.h,
                                ),
                                backgroundColor: AppColors.transparent,
                              ),
                            ],
                          ),
                          Gaps.vGap20,
                          Row(
                            children: [
                              Text(
                                AppConstants.selectExercises,
                                style: AppTextStyles.h0,
                              ),
                            ],
                          ),
                          Gaps.vGap20,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CommonTextField(
                                  controller: _searchController,
                                  hintText: AppConstants.searchByName,
                                  backgroundColor: AppColors.grayBlue,
                                  prefix: CommonAssetIcon(
                                    Assets.icons.search,
                                    width: 20.r,
                                    height: 20.r,
                                    color: AppColors.black,
                                  ),
                                  onChanged: _onSearchChanged,
                                ),
                              ),
                              Gaps.hGap10,
                              CommonIconButton(
                                icon: Assets.icons.filter,
                                iconColor: AppColors.black,
                                iconSize: 20.r,
                                backgroundColor: state.filter.hasAnyFilter
                                    ? AppColors.secondary
                                    : AppColors.grayBlue,
                                onTap: _showExerciseFilterDialog,
                              ),
                            ],
                          ),
                          Gaps.vGap16,
                        ],
                      ),
                    ),
                    Expanded(child: _buildExerciseList(state)),
                  ],
                ),
                if (state.hasSelectedExercises)
                  Positioned(
                    bottom: 10.h,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary,
                                blurRadius: 10.r,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: CommonButton(
                            isFullWidth: false,
                            text:
                                '${state.selectedWorkout.exercises.length} ${AppConstants.exercises.toLowerCase()}',
                            backgroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            onPressed: () =>
                                showExerciseSelectedListDialog(context),
                            textStyle: AppTextStyles.h5,
                          ),
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

  Widget _buildExerciseList(WorkoutState state) {
    if (state.status == WorkoutStateStatus.initial ||
        state.status == WorkoutStateStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.black),
      );
    }

    if (state.status == WorkoutStateStatus.error) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.error?.message ?? AppConstants.commonError,
              style: AppTextStyles.h4,
              textAlign: TextAlign.center,
            ),
            Gaps.vGap16,
            CommonButton(
              text: AppConstants.retry,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              textStyle: AppTextStyles.h5.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
              isFullWidth: false,
              onPressed: () {
                context.read<WorkoutCubit>().getExercises();
              },
            ),
          ],
        ),
      );
    }

    if (state.exercises.isEmpty) {
      return Center(
        child: Text(
          AppConstants.noExerciseFound,
          style: AppTextStyles.h4.copyWith(color: AppColors.mediumGray),
        ),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 80.h),
      itemBuilder: (context, index) {
        if (index >= state.exercises.length) {
          // Loading more indicator
          if (state.status == WorkoutStateStatus.loadingMore) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: CircularProgressIndicator(color: AppColors.black),
              ),
            );
          }
          return const SizedBox.shrink();
        }

        final exercise = state.exercises[index];
        final isSelected = state.selectedWorkout.exercises.any(
          (e) => e.exerciseId == exercise.exerciseId,
        );
        return ExerciseCardItem(
          exercise: exercise,
          isSelected: isSelected,
          onTap: () => _selectExercise(exercise),
        );
      },
      separatorBuilder: (context, index) => Gaps.vGap10,
      itemCount: state.exercises.length + (state.hasMore ? 1 : 0),
    );
  }

  Future<void> _showExerciseFilterDialog() async {
    final cubit = context.read<WorkoutCubit>();
    final state = cubit.state;
    final filter = await showExerciseFilterDialog(
      context,
      muscles: state.bodyParts,
      equipments: state.equipments,
      initialFilter: state.filter,
    );

    if (mounted && filter is ExerciseFilter) {
      cubit.updateFilter(filter);
      cubit.getExercises();
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Load more when near bottom
      context.read<WorkoutCubit>().getExercises(loadMore: true);
    }
  }

  void _clearAll() {
    _searchController.clear();
    context.read<WorkoutCubit>().clearAll();
    context.read<WorkoutCubit>().getExercises();
  }

  Future<void> _selectExercise(Exercise exercise) async {
    final cubit = context.read<WorkoutCubit>();
    final selectedExercise = cubit.findSelectedExercise(exercise);

    dynamic res;

    // If the exercise is already selected, show the edit dialog
    if (selectedExercise != null) {
      res = await ExerciseDetailsDialog.showToEdit(
        context,
        workingExercise: selectedExercise,
      );
    } else {
      // If the exercise is not selected, show the add dialog
      res = await ExerciseDetailsDialog.showToAdd(
        context,
        workingExercise: WorkingExercise.fromExercise(exercise),
      );
    }

    if (!mounted) return;

    if (res is WorkingExercise) {
      // Add or update exercise
      cubit.selectExercise(res);
      return;
    }

    if (res is String) {
      // Delete exercise (res is the exerciseId)
      cubit.removeExercise(res);
    }
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(
      Duration(milliseconds: AppConstants.timeConst.searchDebounce),
      () {
        // Update search and get exercises with the new search
        context.read<WorkoutCubit>().updateSearch(value);
        context.read<WorkoutCubit>().getExercises();
      },
    );
  }
}
