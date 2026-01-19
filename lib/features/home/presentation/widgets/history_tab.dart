import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../workout/presentation/cubit/workout_cubit.dart';
import '../../../workout/presentation/cubit/workout_state.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          final currentWeek = AppDateUtils.getCurrentWeekDays();

          return SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 20.h,
              bottom: 100.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppConstants.thisWeek,
                  style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
                ),
                Gaps.vGap20,
                // Horizontal week view
                SizedBox(
                  height:
                      120.h, // Increased height to accommodate indicator below
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: currentWeek.length,
                    separatorBuilder: (context, index) => Gaps.hGap10,
                    itemBuilder: (context, index) {
                      final day = currentWeek[index];
                      final hasWorkout = _hasWorkoutForDay(state, day);
                      return _DayCard(
                        date: day,
                        isToday: AppDateUtils.isToday(day),
                        hasWorkout: hasWorkout,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Test method: Check if a day has at least one workout
  // For now, this is just a UI test - checking if workouts list is not empty
  // TODO: Replace with actual date-based workout filtering when workout sessions are implemented
  bool _hasWorkoutForDay(WorkoutState state, DateTime day) {
    // For UI testing: randomly show some days with workouts
    // This will be replaced with actual workout session data later
    // if (state.workouts.isEmpty) return false;

    // Test logic: Show workouts on even days of the week (for visual testing)
    // This is temporary until workout sessions are implemented
    return day.weekday % 2 == 0;
  }
}

class _DayCard extends StatelessWidget {
  const _DayCard({
    required this.date,
    required this.isToday,
    required this.hasWorkout,
  });

  final DateTime date;
  final bool isToday;
  final bool hasWorkout;

  @override
  Widget build(BuildContext context) {
    final dayAbbreviation = DateFormat('EEE').format(date);
    final dayNumber = date.day;
    final monthAbbreviation = DateFormat('MMM').format(date);

    return GestureDetector(
      onTap: () {
        // TODO: Navigate to day detail or show workouts for this day
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70.w,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: isToday ? AppColors.darkBlack : AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isToday ? AppColors.transparent : AppColors.grayBlue,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Day abbreviation
                Text(
                  dayAbbreviation,
                  style: AppTextStyles.h5.copyWith(
                    color: isToday ? AppColors.white : AppColors.text,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.vGap4,
                // Day number
                Text(
                  dayNumber.toString(),
                  style: AppTextStyles.h2.copyWith(
                    color: isToday ? AppColors.white : AppColors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.vGap4,
                // Month abbreviation
                Text(
                  monthAbbreviation,
                  style: AppTextStyles.h6.copyWith(
                    color: isToday
                        ? AppColors.mediumGray
                        : AppColors.mediumGray,
                  ),
                ),
                if (hasWorkout) ...[
                  Gaps.vGap10,
                  Container(
                    width: 6.r,
                    height: 6.r,
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
