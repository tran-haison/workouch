import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/widgets/common_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../workout/presentation/cubit/workout_cubit.dart';
import '../../../workout/presentation/cubit/workout_state.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  late DateTime _selectedMonth;

  @override
  void initState() {
    super.initState();
    _selectedMonth = DateTime.now();
  }

  void _goToPreviousMonth() {
    setState(() {
      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month - 1);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1);
    });
  }

  void _goToCurrentMonth() {
    setState(() {
      _selectedMonth = DateTime.now();
    });
  }

  Future<void> _selectMonthYear() async {
    final now = DateTime.now();
    final initialDate = _selectedMonth;

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(now.year + 1),
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Month & Year',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.black,
              surface: AppColors.white,
              onSurface: AppColors.text,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedMonth = DateTime(picked.year, picked.month);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          final monthDays = AppDateUtils.getDaysInMonth(_selectedMonth);
          final daysBefore = AppDateUtils.getDaysBeforeMonthStart(
            _selectedMonth,
          );
          final isCurrentMonth =
              _selectedMonth.year == DateTime.now().year &&
              _selectedMonth.month == DateTime.now().month;

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
                // Month/Year header with navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Previous month button
                    GestureDetector(
                      onTap: _goToPreviousMonth,
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: AppColors.grayBlue,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: CommonAssetIcon(
                          Assets.icons.arrowLeft,
                          width: 20.r,
                          height: 20.r,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                    // Month/Year display with picker
                    GestureDetector(
                      onTap: _selectMonthYear,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppDateUtils.formatMonthYear(_selectedMonth),
                            style: AppTextStyles.h2.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.hGap8,
                          CommonAssetIcon(
                            Assets.icons.arrowDown,
                            width: 16.r,
                            height: 16.r,
                            color: AppColors.text,
                          ),
                        ],
                      ),
                    ),
                    // Next month button
                    GestureDetector(
                      onTap: _goToNextMonth,
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: AppColors.grayBlue,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: CommonAssetIcon(
                          Assets.icons.arrowRight,
                          width: 20.r,
                          height: 20.r,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  ],
                ),
                // "Today" button if not current month
                if (!isCurrentMonth) ...[
                  Gaps.vGap12,
                  CommonButton(
                    isFullWidth: false,
                    text: 'Today',
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    backgroundColor: AppColors.primary,
                    textStyle: AppTextStyles.h5.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed: _goToCurrentMonth,
                  ),
                ],
                Gaps.vGap20,
                // Weekday headers
                Row(
                  children: List.generate(7, (index) {
                    final weekdays = [
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat',
                      'Sun',
                    ];
                    return Expanded(
                      child: Center(
                        child: Text(
                          weekdays[index],
                          style: AppTextStyles.h6.copyWith(
                            color: AppColors.mediumGray,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Gaps.vGap12,
                // Calendar grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 8.h,
                    crossAxisSpacing: 8.w,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: daysBefore + monthDays.length,
                  itemBuilder: (context, index) {
                    if (index < daysBefore) {
                      // Empty cell before month starts
                      return const SizedBox.shrink();
                    }

                    final dayIndex = index - daysBefore;
                    final day = monthDays[dayIndex];
                    final hasWorkout = _hasWorkoutForDay(state, day);

                    return _DayCard(
                      date: day,
                      isToday: AppDateUtils.isToday(day),
                      hasWorkout: hasWorkout,
                    );
                  },
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
    final dayNumber = date.day;

    return GestureDetector(
      onTap: () {
        // TODO: Navigate to day detail or show workouts for this day
      },
      child: Container(
        width: 40.r,
        height: 40.r,
        decoration: BoxDecoration(
          color: isToday
              ? AppColors.darkBlack
              : hasWorkout
              ? AppColors.grayBlue
              : AppColors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            dayNumber.toString(),
            style: AppTextStyles.h4.copyWith(
              color: isToday ? AppColors.white : AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
