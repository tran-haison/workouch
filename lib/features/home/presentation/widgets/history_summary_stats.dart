import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/history_stats.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

enum _Trend { up, down, same }

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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                AppConstants.thisMonth,
                style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
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
                      trend: _getWorkoutTrend(thisMonthStats, lastMonthStats),
                    ),
                  ),
                  Gaps.hGap4,
                  Expanded(
                    child: _HistoryStatCard(
                      title: AppConstants.trainingVolume,
                      value: thisMonthStats.totalTrainingVolumeString,
                      trend: _getVolumeTrend(thisMonthStats, lastMonthStats),
                    ),
                  ),
                  Gaps.hGap4,
                  Expanded(
                    child: _HistoryStatCard(
                      title: AppConstants.time,
                      value: thisMonthStats.totalTimeString,
                      trend: _getTimeTrend(thisMonthStats, lastMonthStats),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  _Trend _getWorkoutTrend(HistoryStats curr, HistoryStats prev) {
    if (curr.totalWorkouts > prev.totalWorkouts) {
      return _Trend.up;
    } else if (curr.totalWorkouts < prev.totalWorkouts) {
      return _Trend.down;
    } else {
      return _Trend.same;
    }
  }

  _Trend _getVolumeTrend(HistoryStats curr, HistoryStats prev) {
    if (curr.totalTrainingVolume > prev.totalTrainingVolume) {
      return _Trend.up;
    } else if (curr.totalTrainingVolume < prev.totalTrainingVolume) {
      return _Trend.down;
    } else {
      return _Trend.same;
    }
  }

  _Trend _getTimeTrend(HistoryStats curr, HistoryStats prev) {
    if (curr.totalTime > prev.totalTime) {
      return _Trend.up;
    } else if (curr.totalTime < prev.totalTime) {
      return _Trend.down;
    } else {
      return _Trend.same;
    }
  }
}

class _HistoryStatCard extends StatelessWidget {
  const _HistoryStatCard({
    required this.title,
    required this.value,
    required this.trend,
  });

  final String title;
  final String value;
  final _Trend trend;

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
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4.w,
            runSpacing: 4.h,
            children: [
              Text(
                value,
                style: AppTextStyles.anton.copyWith(fontSize: 20.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              _TrendIcon(trend: trend),
            ],
          ),
        ],
      ),
    );
  }
}

class _TrendIcon extends StatelessWidget {
  const _TrendIcon({required this.trend});

  final _Trend trend;

  @override
  Widget build(BuildContext context) {
    final (icon, color) = switch (trend) {
      _Trend.up => (Assets.icons.arrowUpDiagonal, AppColors.success),
      _Trend.down => (Assets.icons.arrowDownDiagonal, AppColors.error),
      _Trend.same => (Assets.icons.equal, AppColors.mediumGray),
    };
    return CommonAssetIcon(icon, width: 16.r, height: 16.r, color: color);
  }
}
