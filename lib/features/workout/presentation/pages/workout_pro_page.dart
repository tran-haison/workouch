import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/widgets/common_button.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/workout.dart';
import '../cubit/workout_cubit.dart';
import '../cubit/workout_state.dart';
import '../widgets/workout_card_item.dart';

class WorkoutProPage extends StatefulWidget {
  const WorkoutProPage({super.key});

  @override
  State<WorkoutProPage> createState() => _WorkoutProPageState();
}

class _WorkoutProPageState extends State<WorkoutProPage> {
  @override
  void initState() {
    super.initState();
    context.read<WorkoutCubit>().getAllWorkouts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlack,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                children: [
                  CommonIconButton(
                    backgroundColor: AppColors.white,
                    icon: Assets.icons.arrowBack,
                    iconColor: AppColors.black,
                    radius: 30.r,
                    onTap: () {
                      context.pop();
                    },
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          AppConstants.workouts.toUpperCase(),
                          style: AppTextStyles.h0.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CommonIconButton(
                    backgroundColor: AppColors.secondary,
                    icon: Assets.icons.add,
                    iconColor: AppColors.black,
                    radius: 30.r,
                    onTap: _addWorkout,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: 1.sw,
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: SafeArea(
                  top: false,
                  child: BlocBuilder<WorkoutCubit, WorkoutState>(
                    builder: (context, state) {
                      final workouts = state.workouts;

                      if (state.getWorkoutsStatus ==
                          WorkoutStateStatus.loading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.black,
                          ),
                        );
                      }

                      if (workouts.isEmpty) {
                        return Center(
                          child: Text(
                            AppConstants.buildFirstWorkout,
                            style: AppTextStyles.h4.copyWith(
                              color: AppColors.mediumGray,
                            ),
                          ),
                        );
                      }

                      return Stack(
                        children: [
                          Column(
                            children: [
                              Gaps.vGap16,
                              Container(
                                width: 100.w,
                                height: 3.h,
                                decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              ),
                              Gaps.vGap16,
                              Expanded(
                                child: ListView.separated(
                                  padding: EdgeInsets.only(
                                    left: 12.w,
                                    right: 12.w,
                                    top: 0,
                                    bottom: 80.h,
                                  ),
                                  itemCount: workouts.length,
                                  separatorBuilder: (context, index) =>
                                      Gaps.vGap12,
                                  itemBuilder: (context, index) {
                                    final workout = workouts[index];
                                    return WorkoutCardItem(
                                      workout: workout,
                                      onTap: () => _viewWorkout(workout),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 10.h,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _RoutineIndicator(
                                  title: AppConstants.total,
                                  value: '${workouts.length}',
                                  icon: Assets.icons.dumbbell,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addWorkout() async {
    context.read<WorkoutCubit>().updateSelectedWorkout(
      id: '',
      name: '',
      exercises: [],
      restTime: Duration.zero,
    );

    await context.pushNamed(AppRoute.workoutCreation.name);
  }

  Future<void> _viewWorkout(Workout workout) async {
    context.read<WorkoutCubit>().updateDisplayedWorkout(workout);
    await context.pushNamed(AppRoute.workoutDetails.name);
  }
}

class _RoutineIndicator extends StatelessWidget {
  const _RoutineIndicator({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.primary.withValues(alpha: 0.1),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary,
            blurRadius: 10.r,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(children: [Text('$title: $value', style: AppTextStyles.h5)]),
    );
  }
}
