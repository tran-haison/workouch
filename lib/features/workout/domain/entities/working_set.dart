import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/core/extension/duration_extension.dart';

import '../../../../core/constants/app_constants.dart';

part 'working_set.freezed.dart';

/// Type of working set for an exercise
enum WorkingSetType { weightBased, timeBased, distanceBased, repsOnly }

@freezed
class WorkingSet with _$WorkingSet {
  const WorkingSet._();

  const factory WorkingSet.weightBased({
    @Default(0) int sets,
    @Default(0) int reps,
    @Default(0.0) double weight, // kg
  }) = WeightBasedSet;

  const factory WorkingSet.timeBased({
    @Default(Duration.zero) Duration duration,
  }) = TimeBasedSet;

  const factory WorkingSet.distanceBased({
    @Default(0.0) double distance, // meters
  }) = DistanceBasedSet;

  const factory WorkingSet.repsOnly({
    @Default(0) int sets,
    @Default(0) int reps,
  }) = RepsOnlySet;

  factory WorkingSet.empty(WorkingSetType type) {
    switch (type) {
      case WorkingSetType.weightBased:
        return const WorkingSet.weightBased();
      case WorkingSetType.timeBased:
        return const WorkingSet.timeBased();
      case WorkingSetType.distanceBased:
        return const WorkingSet.distanceBased();
      case WorkingSetType.repsOnly:
        return const WorkingSet.repsOnly();
    }
  }
}

extension WorkingSetExtension on WorkingSet {
  String? get displayInfo {
    return when(
      weightBased: (sets, reps, weight) {
        if (sets == 0 || reps == 0 || weight == 0) return null;
        return '$sets ${AppConstants.sets} • $reps ${AppConstants.reps} • $weight ${AppConstants.kg}'
            .toLowerCase();
      },
      repsOnly: (sets, reps) {
        if (sets == 0 || reps == 0) return null;
        return '$sets ${AppConstants.sets} • $reps ${AppConstants.reps}'
            .toLowerCase();
      },
      timeBased: (duration) {
        if (duration.inSeconds == 0) return null;
        return duration.mmss.toLowerCase();
      },
      distanceBased: (distance) {
        if (distance == 0) return null;
        if (distance >= 1000) {
          final km = distance / 1000;
          final kmString = km
              .toStringAsFixed(3)
              .replaceAll(RegExp(r'0+$'), '')
              .replaceAll(RegExp(r'\.$'), '');
          return '$kmString ${AppConstants.km}'.toLowerCase();
        }
        return '${distance.toInt()} ${AppConstants.meters}'.toLowerCase();
      },
    );
  }

  // Returns a map of the display information for the set
  // For weight based set, the map will contain the weight and reps (no sets cause it does not make sense when showing on UI)
  // For reps only set, the map will contain the reps (no sets cause it does not make sense when showing on UI)
  // For time based set, the map will contain the duration
  // For distance based set, the map will contain the distance
  Map<String, String>? get displayInfoMap {
    return when(
      weightBased: (sets, reps, weight) {
        if (sets == 0 || reps == 0 || weight == 0) return null;
        return {
          AppConstants.weight: '$weight ${AppConstants.kg}',
          AppConstants.reps: reps.toString(),
        };
      },
      repsOnly: (sets, reps) {
        if (sets == 0 || reps == 0) return null;
        return {AppConstants.reps: reps.toString()};
      },
      timeBased: (duration) {
        if (duration.inSeconds == 0) return null;
        return {AppConstants.duration: duration.mmss.toLowerCase()};
      },
      distanceBased: (distance) {
        if (distance == 0) return null;
        if (distance >= 1000) {
          final km = distance / 1000;
          final kmString = km
              .toStringAsFixed(3)
              .replaceAll(RegExp(r'0+$'), '')
              .replaceAll(RegExp(r'\.$'), '');
          return {AppConstants.distance: '$kmString ${AppConstants.km}'};
        }
        return {
          AppConstants.distance: '${distance.toInt()} ${AppConstants.meters}',
        };
      },
    );
  }
}
