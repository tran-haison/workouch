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

    return '${value.shortenedString} $unit';
  }
}
