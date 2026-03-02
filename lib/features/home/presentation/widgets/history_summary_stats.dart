import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/features/auth/domain/entities/user.dart';
import 'package:workouch/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extension/double_extension.dart';
import '../../../../core/extension/duration_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../../domain/entities/history_stats.dart';
import '../../domain/enums/trend.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HistorySummaryStats extends StatelessWidget {
  const HistorySummaryStats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) =>
          prev.thisMonthHistoryStats != curr.thisMonthHistoryStats,
      builder: (context, state) {
        final thisMonthStats = state.thisMonthHistoryStats;
        final lastMonthStats = state.lastMonthHistoryStats;

        return BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (prev, curr) =>
              prev.currentUser?.measurementSystem !=
              curr.currentUser?.measurementSystem,
          builder: (context, state) {
            final system =
                state.currentUser?.measurementSystem ??
                MeasurementSystem.metric;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    AppConstants.thisMonth,
                    style: AppTextStyles.h3.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gaps.vGap12,
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: _HistoryStatCard(
                          title: AppConstants.workouts,
                          value: thisMonthStats.totalWorkouts.toString(),
                          trend: _getWorkoutTrend(
                            thisMonthStats,
                            lastMonthStats,
                          ),
                          changes: _getWorkoutChanges(
                            thisMonthStats,
                            lastMonthStats,
                          ),
                        ),
                      ),
                      Gaps.hGap4,
                      Expanded(
                        child: _HistoryStatCard(
                          title: AppConstants.trainingVolume,
                          value: thisMonthStats.totalTrainingVolumeString(
                            system,
                          ),
                          trend: _getVolumeTrend(
                            thisMonthStats,
                            lastMonthStats,
                          ),
                          changes: _getVolumeChanges(
                            thisMonthStats,
                            lastMonthStats,
                            system,
                          ),
                        ),
                      ),
                      Gaps.hGap4,
                      Expanded(
                        child: _HistoryStatCard(
                          title: AppConstants.time,
                          value: thisMonthStats.totalTime.hhmmssString,
                          trend: _getTimeTrend(thisMonthStats, lastMonthStats),
                          changes: _getTimeChanges(
                            thisMonthStats,
                            lastMonthStats,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Trend _getWorkoutTrend(HistoryStats curr, HistoryStats prev) {
    if (curr.totalWorkouts > prev.totalWorkouts) {
      return Trend.up;
    } else if (curr.totalWorkouts < prev.totalWorkouts) {
      return Trend.down;
    } else {
      return Trend.same;
    }
  }

  Trend _getVolumeTrend(HistoryStats curr, HistoryStats prev) {
    if (curr.totalTrainingVolumeKg > prev.totalTrainingVolumeKg) {
      return Trend.up;
    } else if (curr.totalTrainingVolumeKg < prev.totalTrainingVolumeKg) {
      return Trend.down;
    } else {
      return Trend.same;
    }
  }

  Trend _getTimeTrend(HistoryStats curr, HistoryStats prev) {
    if (curr.totalTime > prev.totalTime) {
      return Trend.up;
    } else if (curr.totalTime < prev.totalTime) {
      return Trend.down;
    } else {
      return Trend.same;
    }
  }

  String _getWorkoutChanges(HistoryStats curr, HistoryStats prev) {
    final workoutChanges = curr.totalWorkouts - prev.totalWorkouts;
    if (workoutChanges > 0) {
      return '+$workoutChanges';
    } else if (workoutChanges < 0) {
      return '-${workoutChanges.abs()}';
    } else {
      return '0';
    }
  }

  String _getVolumeChanges(
    HistoryStats curr,
    HistoryStats prev,
    MeasurementSystem system,
  ) {
    final volumeChanges = system.isMetric
        ? curr.totalTrainingVolumeKg - prev.totalTrainingVolumeKg
        : curr.totalTrainingVolumeKg.kgToLbs -
              prev.totalTrainingVolumeKg.kgToLbs;

    if (volumeChanges > 0) {
      return '+${volumeChanges.shortenedString}';
    } else if (volumeChanges < 0) {
      return '-${volumeChanges.abs().shortenedString}';
    } else {
      return '0';
    }
  }

  String _getTimeChanges(HistoryStats curr, HistoryStats prev) {
    final timeChanges = curr.totalTime - prev.totalTime;
    if (timeChanges.isNegative) {
      return '-${timeChanges.abs().hhmmssString}';
    } else if (timeChanges.isZero) {
      return '0';
    } else {
      return '+${timeChanges.hhmmssString}';
    }
  }
}

class _HistoryStatCard extends StatelessWidget {
  const _HistoryStatCard({
    required this.title,
    required this.value,
    required this.trend,
    required this.changes,
  });

  final String title;
  final String value;
  final Trend trend;
  final String changes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.grayBlue,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
          ),
          Gaps.vGap4,
          Text(
            value,
            style: AppTextStyles.anton.copyWith(fontSize: 20.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Gaps.vGap4,
          Row(
            children: [
              CommonAssetIcon(
                trend.icon,
                width: 16.r,
                height: 16.r,
                color: trend.color,
              ),
              Gaps.hGap4,
              Expanded(
                child: Text(
                  changes,
                  style: AppTextStyles.h5.copyWith(color: trend.color),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
