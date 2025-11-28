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
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/workout_session_cubit.dart';
import '../cubit/workout_session_state.dart';

class WorkoutReadyPage extends StatelessWidget {
  const WorkoutReadyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
      builder: (context, state) {
        final workout = state.workout;
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
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Gaps.vGap40,
                        Text(
                          AppConstants.workout,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          workout.name,
                          style: AppTextStyles.anton.copyWith(fontSize: 32.sp),
                          textAlign: TextAlign.center,
                        ),
                        Gaps.vGap40,
                        Text(
                          AppConstants.readyToStart,
                          style: AppTextStyles.h3.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gaps.vGap8,
                        Text(
                          AppConstants.readyToStartDescription,
                          style: AppTextStyles.h4.copyWith(
                            color: AppColors.mediumGray,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gaps.vGap40,
                        Container(
                          width: 1.sw,
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CommonAssetIcon(
                                    Assets.icons.lineWeight,
                                    width: 20.r,
                                    height: 20.r,
                                    color: AppColors.black,
                                  ),
                                  Gaps.hGap12,
                                  Expanded(
                                    child: Text(
                                      AppConstants.exercises,
                                      style: AppTextStyles.h4.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${workout.exercises.length}',
                                    style: AppTextStyles.h3.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap20,
                              Divider(color: AppColors.grayBlue, height: 1.h),
                              Gaps.vGap20,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CommonAssetIcon(
                                    Assets.icons.rest,
                                    width: 20.r,
                                    height: 20.r,
                                    color: AppColors.black,
                                  ),
                                  Gaps.hGap12,
                                  Expanded(
                                    child: Text(
                                      AppConstants.restBetweenExercises,
                                      style: AppTextStyles.h4.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    workout.restTimeBetweenExercises.mmss,
                                    style: AppTextStyles.h3.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Gaps.vGap40,
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
                    text: AppConstants.letsGo,
                    onPressed: () => _startWorkout(context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _startWorkout(BuildContext context) {
    // TODO: Navigate to actual workout page
    showCommonToast('Workout starting soon...');
  }
}
