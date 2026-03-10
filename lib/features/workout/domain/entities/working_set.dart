import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/core/extension/double_extension.dart';
import 'package:workouch/core/extension/duration_extension.dart';
import 'package:workouch/features/auth/domain/entities/user.dart';

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
    @Default(0.0) double weightKg,
  }) = WeightBasedSet;

  const factory WorkingSet.timeBased({
    @Default(Duration.zero) Duration duration,
  }) = TimeBasedSet;

  const factory WorkingSet.distanceBased({
    @Default(0.0) double distanceMeters,
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
  String? displayInfo(MeasurementSystem system) {
    return when(
      weightBased: (sets, reps, weightKg) {
        if (sets == 0 || reps == 0) return null;
        switch (system) {
          case MeasurementSystem.metric:
            return '$sets ${AppConstants.sets} • '
                    '$reps ${AppConstants.reps} • '
                    '${weightKg.toStringAsFixed(1)} ${AppConstants.kg}'
                .toLowerCase();
          case MeasurementSystem.imperial:
            return '$sets ${AppConstants.sets} • '
                    '$reps ${AppConstants.reps} • '
                    '${weightKg.kgToLbs.round()} ${AppConstants.lbs}'
                .toLowerCase();
        }
      },
      repsOnly: (sets, reps) {
        if (sets == 0 || reps == 0) return null;
        return '$sets ${AppConstants.sets} • '
                '$reps ${AppConstants.reps}'
            .toLowerCase();
      },
      timeBased: (duration) {
        if (duration.inSeconds == 0) return null;
        return duration.mmss.toLowerCase();
      },
      distanceBased: (distanceMeters) {
        if (distanceMeters == 0) return null;
        switch (system) {
          case MeasurementSystem.metric:
            if (distanceMeters >= 1000) {
              final km = distanceMeters / 1000;
              final kmString = km
                  .toStringAsFixed(3)
                  .replaceAll(RegExp(r'0+$'), '')
                  .replaceAll(RegExp(r'\.$'), '');
              return '$kmString ${AppConstants.km}'.toLowerCase();
            }
            return '${distanceMeters.round()} ${AppConstants.meters}'
                .toLowerCase();
          case MeasurementSystem.imperial:
            final miles = distanceMeters.meterToMile;
            final milesString = miles
                .toStringAsFixed(2)
                .replaceAll(RegExp(r'0+$'), '')
                .replaceAll(RegExp(r'\.$'), '');
            return '$milesString ${AppConstants.miles}'.toLowerCase();
        }
      },
    );
  }

  // Returns a map of the display information for the set
  // For weight based set, the map will contain the weight and reps (no sets cause it does not make sense when showing on UI)
  // For reps only set, the map will contain the reps (no sets cause it does not make sense when showing on UI)
  // For time based set, the map will contain the duration
  // For distance based set, the map will contain the distance
  Map<String, String>? displayInfoMap(MeasurementSystem system) {
    return when(
      weightBased: (sets, reps, weightKg) {
        if (sets == 0 || reps == 0) return null;
        switch (system) {
          case MeasurementSystem.metric:
            return {
              AppConstants.weight:
                  '${weightKg.toStringAsFixed(1)} ${AppConstants.kg}',
              AppConstants.reps: reps.toString(),
            };
          case MeasurementSystem.imperial:
            return {
              AppConstants.weight:
                  '${weightKg.kgToLbs.round()} ${AppConstants.lbs}',
              AppConstants.reps: reps.toString(),
            };
        }
      },
      repsOnly: (sets, reps) {
        if (sets == 0 || reps == 0) return null;
        return {AppConstants.reps: reps.toString()};
      },
      timeBased: (duration) {
        if (duration.inSeconds == 0) return null;
        return {AppConstants.duration: duration.mmss.toLowerCase()};
      },
      distanceBased: (distanceMeters) {
        if (distanceMeters == 0) return null;
        switch (system) {
          case MeasurementSystem.metric:
            if (distanceMeters >= 1000) {
              final km = distanceMeters / 1000;
              final kmString = km
                  .toStringAsFixed(3)
                  .replaceAll(RegExp(r'0+$'), '')
                  .replaceAll(RegExp(r'\.$'), '');
              return {
                AppConstants.distance:
                    '$kmString ${AppConstants.km.toLowerCase()}',
              };
            }
            return {
              AppConstants.distance:
                  '${distanceMeters.round()} ${AppConstants.meters.toLowerCase()}',
            };
          case MeasurementSystem.imperial:
            final miles = distanceMeters.meterToMile;
            final milesString = miles
                .toStringAsFixed(2)
                .replaceAll(RegExp(r'0+$'), '')
                .replaceAll(RegExp(r'\.$'), '');
            return {
              AppConstants.distance:
                  '$milesString ${AppConstants.miles.toLowerCase()}',
            };
        }
      },
    );
  }
}

extension WorkingSetTypeExt on WorkingSetType {
  String get label {
    switch (this) {
      case WorkingSetType.weightBased:
        return AppConstants.weight;
      case WorkingSetType.repsOnly:
        return AppConstants.reps;
      case WorkingSetType.timeBased:
        return AppConstants.duration;
      case WorkingSetType.distanceBased:
        return AppConstants.distance;
    }
  }

  static WorkingSetType fromString(String type) {
    return WorkingSetType.values.firstWhere(
      (e) => e.name == type,
      orElse: () => WorkingSetType.weightBased,
    );
  }

  bool get isWeightBased {
    return this == WorkingSetType.weightBased;
  }

  bool get isRepsOnly {
    return this == WorkingSetType.repsOnly;
  }

  bool get isTimeBased {
    return this == WorkingSetType.timeBased;
  }

  bool get isDistanceBased {
    return this == WorkingSetType.distanceBased;
  }
}
