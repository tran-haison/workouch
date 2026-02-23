import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/app_constants.dart';

part 'history_stats.freezed.dart';

@freezed
class HistoryStats with _$HistoryStats {
  const HistoryStats._();

  const factory HistoryStats({
    @Default(0) int totalWorkouts,
    @Default(0.0) double totalTrainingVolume,
    @Default(Duration.zero) Duration totalTime,
  }) = _HistoryStats;
}

extension HistoryStatsExt on HistoryStats {
  String get totalTrainingVolumeString {
    // If more than million, show "m"
    if (totalTrainingVolume >= 1000000) {
      return '${(totalTrainingVolume / 1000000).toStringAsFixed(1)}m ${AppConstants.kg.toLowerCase()}';
    }

    // If more than thousand, show "k"
    if (totalTrainingVolume >= 1000) {
      return '${(totalTrainingVolume / 1000).toStringAsFixed(1)}k ${AppConstants.kg.toLowerCase()}';
    }

    return '${totalTrainingVolume.toStringAsFixed(1)} ${AppConstants.kg.toLowerCase()}';
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
    return '$hours$minutes$seconds';
  }
}
