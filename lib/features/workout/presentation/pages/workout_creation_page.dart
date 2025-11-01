import 'package:flutter/material.dart';
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
import '../widgets/workout_exercise_card.dart';

class WorkoutCreationPage extends StatefulWidget {
  const WorkoutCreationPage({super.key});

  @override
  State<WorkoutCreationPage> createState() => _WorkoutCreationPageState();
}

class _WorkoutCreationPageState extends State<WorkoutCreationPage> {
  final _restTime = '1m30s';

  // Sample exercises - will be replaced with actual data later
  final List<Map<String, String>> _exercises = [
    {
      'title': 'Barbell bench press',
      'subtitle': 'Chest > Barbell',
      'sets': '3 sets x 10 reps x 80 kg',
      'duration': '1m30s',
    },
    {
      'title': 'Barbell bench press',
      'subtitle': 'Chest > Barbell',
      'sets': '3 sets x 10 reps x 80 kg',
      'duration': '1m30s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                children: [
                  CommonIconButton(
                    backgroundColor: AppColors.grayBlue,
                    icon: Assets.icons.arrowBack,
                    iconColor: AppColors.black,
                    onTap: () {
                      context.pop();
                    },
                  ),
                  const Spacer(),
                  CommonIconButton(
                    backgroundColor: AppColors.black,
                    icon: Assets.icons.check,
                    iconColor: AppColors.white,
                    onTap: () {},
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
                            AppConstants.newWorkout,
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
                        color: AppColors.black,
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
                            hintText: AppConstants.nameHint,
                            onChanged: (value) {},
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
                            text: _restTime,
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
                                padding: EdgeInsets.all(2.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary.withValues(
                                    alpha: 0.5,
                                  ),
                                  border: Border.all(color: AppColors.primary),
                                ),
                                child: CommonIconButton(
                                  backgroundColor: AppColors.primary,
                                  icon: Assets.icons.add,
                                  iconSize: 20.r,
                                  iconColor: AppColors.black,
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                          Gaps.vGap10,
                          ...List.generate(_exercises.length, (index) {
                            final exercise = _exercises[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: WorkoutExerciseCard(
                                title: exercise['title']!,
                                subtitle: exercise['subtitle']!,
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
          ],
        ),
      ),
    );
  }

  void _showRestTimeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text('Rest Time', style: AppTextStyles.h1),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '1m30s',
              style: AppTextStyles.h0.copyWith(fontWeight: FontWeight.w700),
            ),
            Gaps.vGap20,
            // Add your time picker here
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Done', style: AppTextStyles.h3),
          ),
        ],
      ),
    );
  }
}
