import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_date_picker_dialog.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';

class HistoryCalendar extends StatefulWidget {
  const HistoryCalendar({super.key});

  @override
  State<HistoryCalendar> createState() => _HistoryCalendarState();
}

class _HistoryCalendarState extends State<HistoryCalendar> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();

    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final daysOfMonth = AppDateUtils.getAllDaysInMonth(_selectedDate);
    final daysBefore = AppDateUtils.getDaysBeforeMonthStart(_selectedDate);
    final isCurrentMonth = AppDateUtils.isThisMonth(_selectedDate);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonIconButton(
              onTap: _goToPreviousMonth,
              icon: Assets.icons.arrowLeft,
              iconSize: 20.r,
              iconColor: AppColors.text,
              padding: EdgeInsets.all(8.r),
              backgroundColor: AppColors.grayBlue,
              radius: 8.r,
            ),
            GestureDetector(
              onTap: _selectMonthYear,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppDateUtils.formatMonthYear(_selectedDate),
                      style: AppTextStyles.h3.copyWith(
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
            ),
            CommonIconButton(
              onTap: _goToNextMonth,
              icon: Assets.icons.arrowRight,
              iconSize: 20.r,
              iconColor: AppColors.text,
              padding: EdgeInsets.all(8.r),
              backgroundColor: AppColors.grayBlue,
              radius: 8.r,
            ),
          ],
        ),
        if (!isCurrentMonth) ...[
          Gaps.vGap12,
          CommonButton(
            isFullWidth: false,
            text: AppConstants.today,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            backgroundColor: AppColors.white,
            borderColor: AppColors.darkBlack,
            textStyle: AppTextStyles.h5.copyWith(fontWeight: FontWeight.w600),
            onPressed: _goToCurrentMonth,
          ),
        ],
        Gaps.vGap20,
        Row(
          children: List.generate(AppDateUtils.weekdays.length, (index) {
            return Expanded(
              child: Center(
                child: Text(
                  AppDateUtils.weekdays[index],
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
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.w,
            childAspectRatio: 1.0,
          ),
          itemCount: daysBefore + daysOfMonth.length,
          itemBuilder: (context, index) {
            if (index < daysBefore) {
              return const SizedBox.shrink();
            }

            final dayIndex = index - daysBefore;
            final day = daysOfMonth[dayIndex];
            final hasWorkout = _hasWorkoutForDay(day);

            return _DayCard(
              date: day,
              isToday: AppDateUtils.isToday(day),
              hasWorkout: hasWorkout,
            );
          },
        ),
      ],
    );
  }

  void _goToPreviousMonth() {
    setState(() {
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month - 1,
        _selectedDate.day,
      );
    });
  }

  void _goToNextMonth() {
    setState(() {
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month + 1,
        _selectedDate.day,
      );
    });
  }

  void _goToCurrentMonth() {
    setState(() {
      _selectedDate = DateTime.now();
    });
  }

  Future<void> _selectMonthYear() async {
    final now = DateTime.now();
    final initialDate = _selectedDate;

    final picked = await showCommonDatePickerDialog(
      context,
      initialDate: initialDate,
      firstDate: DateTime(now.year - 100),
      lastDate: DateTime(now.year + 1),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = DateTime(picked.year, picked.month, picked.day);
      });
    }
  }

  // Test method: Check if a day has at least one workout
  // For now, this is just a UI test - checking if workouts list is not empty
  // TODO: Replace with actual date-based workout filtering when workout sessions are implemented
  bool _hasWorkoutForDay(DateTime day) {
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
