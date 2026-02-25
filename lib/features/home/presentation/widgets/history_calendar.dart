import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/common_month_year_picker_dialog.dart';
import '../../../../gen/assets.gen.dart';
import '../../../workout_session/domain/entities/workout_session.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HistoryCalendar extends StatefulWidget {
  const HistoryCalendar({super.key});

  @override
  State<HistoryCalendar> createState() => _HistoryCalendarState();
}

class _HistoryCalendarState extends State<HistoryCalendar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) =>
          prev.sessionsByMonth != curr.sessionsByMonth ||
          prev.viewingMonth != curr.viewingMonth,
      builder: (context, state) {
        final viewingMonth = state.currentViewingMonth;
        final sessionsForMonth = state.sessionsForViewingMonth;
        final daysOfMonth = AppDateUtils.getAllDaysInMonth(viewingMonth);
        final daysBefore = AppDateUtils.getDaysBeforeMonthStart(viewingMonth);
        final isCurrentMonth = AppDateUtils.isThisMonth(viewingMonth);

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
                  onTap: _pickMonthAndYear,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.h,
                      horizontal: 16.w,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppDateUtils.formatMonthYear(viewingMonth),
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
                textStyle: AppTextStyles.h5.copyWith(
                  fontWeight: FontWeight.w600,
                ),
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
                final sessionsOfDay = sessionsForMonth.sessionsByDate(day);
                final hasWorkout = sessionsOfDay.isNotEmpty;

                return _DayCard(
                  date: day,
                  isToday: AppDateUtils.isToday(day),
                  hasWorkout: hasWorkout,
                  onTap: hasWorkout
                      ? () => _openSessionsByDayPage(day, sessionsOfDay)
                      : null,
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _goToPreviousMonth() {
    final currMonth = context.read<HomeCubit>().state.currentViewingMonth;
    final previousMonth = DateTime(
      currMonth.year,
      currMonth.month - 1,
      currMonth.day,
    );
    context.read<HomeCubit>().loadSessionsForMonth(previousMonth);
  }

  void _goToNextMonth() {
    final currMonth = context.read<HomeCubit>().state.currentViewingMonth;
    final nextMonth = DateTime(
      currMonth.year,
      currMonth.month + 1,
      currMonth.day,
    );
    context.read<HomeCubit>().loadSessionsForMonth(nextMonth);
  }

  void _goToCurrentMonth() {
    context.read<HomeCubit>().loadSessionsForMonth(DateTime.now());
  }

  Future<void> _pickMonthAndYear() async {
    final initialDate = context.read<HomeCubit>().state.currentViewingMonth;

    final picked = await showCommonMonthYearPickerDialog(
      context,
      initialDate: initialDate,
    );

    if (picked != null && mounted) {
      context.read<HomeCubit>().loadSessionsForMonth(picked);
    }
  }

  Future<void> _openSessionsByDayPage(
    DateTime date,
    List<WorkoutSession> sessions,
  ) async {
    if (sessions.isEmpty) return;

    await context.pushNamed(
      AppRoute.historySessionsByDay.name,
      extra: {'date': date, 'sessions': sessions} as Map<String, dynamic>,
    );
  }
}

class _DayCard extends StatelessWidget {
  const _DayCard({
    required this.date,
    required this.isToday,
    required this.hasWorkout,
    this.onTap,
  });

  final DateTime date;
  final bool isToday;
  final bool hasWorkout;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dayNumber = date.day;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.r,
        height: 40.r,
        decoration: BoxDecoration(
          color: isToday
              ? AppColors.primaryDark
              : hasWorkout
              ? AppColors.darkBlack
              : AppColors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            dayNumber.toString(),
            style: AppTextStyles.h4.copyWith(
              color: isToday || hasWorkout ? AppColors.white : AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
