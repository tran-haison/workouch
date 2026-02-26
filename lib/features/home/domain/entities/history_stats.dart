import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/core/extension/double_extension.dart';
import 'package:workouch/features/auth/domain/entities/user.dart';

import '../../../../core/constants/app_constants.dart';

part 'history_stats.freezed.dart';

@freezed
class HistoryStats with _$HistoryStats {
  const HistoryStats._();

  const factory HistoryStats({
    @Default(0) int totalWorkouts,
    @Default(0.0) double totalTrainingVolumeKg,
    @Default(Duration.zero) Duration totalTime,
  }) = _HistoryStats;
}

extension HistoryStatsExt on HistoryStats {
  String totalTrainingVolumeString(MeasurementSystem system) {
    final value = system.isMetric
        ? totalTrainingVolumeKg
        : totalTrainingVolumeKg.kgToLbs;

    final unit = system.isMetric
        ? AppConstants.kg.toLowerCase()
        : AppConstants.lbs.toLowerCase();

    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(3)}m $unit';
    }
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(2)}k $unit';
    }
    return '${value.round()} $unit';
  }

  String get totalTimeString {
    // Show as hours + minutes + seconds as "15h20m30s"
    // If hours or minutes or seconds is 0, don't show it
    final hours = totalTime.inHours > 0 ? '${totalTime.inHours}h' : '';
    final minutes = totalTime.inMinutes.remainder(60) > 0
        ? '${totalTime.inMinutes.remainder(60)}m'
        : '';
    final seconds = totalTime.inSeconds.remainder(60) > 0
        ? '${totalTime.inSeconds.remainder(60)}s'
        : '';

    if (hours.isEmpty && minutes.isEmpty && seconds.isEmpty) {
      return '0';
    }

    return '$hours$minutes$seconds';
  }
}
