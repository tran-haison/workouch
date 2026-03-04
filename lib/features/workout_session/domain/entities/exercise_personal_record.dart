import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/core/extension/double_extension.dart';
import 'package:workouch/features/auth/domain/entities/user.dart';
import 'package:workouch/features/workout/domain/entities/working_set.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extension/duration_extension.dart';
import 'workout_session_exercise.dart';

part 'exercise_personal_record.freezed.dart';

@freezed
class ExercisePersonalRecord with _$ExercisePersonalRecord {
  const ExercisePersonalRecord._();

  const factory ExercisePersonalRecord({
    @Default('') String id,
    @Default('') String userId,
    @Default('') String exerciseId,
    @Default('') String name,
    @Default('') String gifUrl,
    @Default(0) int maxReps,
    @Default(0.0) double maxWeightKg,
    @Default(Duration.zero) Duration maxDuration,
    @Default(0.0) double maxDistanceMeters,
    @Default(WorkingSetType.weightBased) WorkingSetType setType,
    required DateTime prDate,
    @Default(true) bool isVisibleOnHistory,
  }) = _ExercisePersonalRecord;
}

extension ExercisePersonalRecordExt on ExercisePersonalRecord {
  String maxWeightString(MeasurementSystem system) {
    return system.isMetric
        ? maxWeightKg.toStringAsFixed(1)
        : maxWeightKg.kgToLbs.round().toString();
  }

  String maxWeightWithUnit(MeasurementSystem system) {
    final unit = system.isMetric ? AppConstants.kg : AppConstants.lbs;
    final value = maxWeightString(system);
    return '$value $unit';
  }

  String displayValue(MeasurementSystem system) {
    switch (setType) {
      case WorkingSetType.weightBased:
        final weightStr = maxWeightWithUnit(system);
        return '$weightStr × $maxReps ${AppConstants.reps}';
      case WorkingSetType.repsOnly:
        return '$maxReps ${AppConstants.reps}';
      case WorkingSetType.timeBased:
        return maxDuration.hhmmss;
      case WorkingSetType.distanceBased:
        if (system.isMetric) {
          if (maxDistanceMeters >= 1000) {
            final km = maxDistanceMeters / 1000;
            final kmString = km
                .toStringAsFixed(3)
                .replaceAll(RegExp(r'0+$'), '')
                .replaceAll(RegExp(r'\.$'), '');
            return '$kmString ${AppConstants.km}';
          }
          return '${maxDistanceMeters.round()} ${AppConstants.meters}';
        } else {
          final miles = maxDistanceMeters.meterToMile;
          final milesString = miles
              .toStringAsFixed(2)
              .replaceAll(RegExp(r'0+$'), '')
              .replaceAll(RegExp(r'\.$'), '');
          return '$milesString ${AppConstants.miles}';
        }
    }
  }

  bool isNewRecordBetter(ExercisePersonalRecord newRecord) {
    switch (newRecord.setType) {
      case WorkingSetType.weightBased:
        return newRecord.maxWeightKg > maxWeightKg;
      case WorkingSetType.repsOnly:
        return newRecord.maxReps > maxReps;
      case WorkingSetType.timeBased:
        return newRecord.maxDuration > maxDuration;
      case WorkingSetType.distanceBased:
        return newRecord.maxDistanceMeters > maxDistanceMeters;
    }
  }

  static ExercisePersonalRecord fromSessionExercise({
    required WorkoutSessionExercise exercise,
    required DateTime prDate,
  }) {
    var maxReps = 0;
    var maxWeightKg = 0.0;
    var maxDuration = Duration.zero;
    var maxDistanceMeters = 0.0;

    for (final set in exercise.sets) {
      set.when(
        weightBased: (_, reps, weightKg) {
          if (weightKg > maxWeightKg) {
            maxWeightKg = weightKg;
            maxReps = reps;
          }
        },
        repsOnly: (_, reps) {
          if (reps > maxReps) maxReps = reps;
        },
        timeBased: (duration) {
          if (duration > maxDuration) maxDuration = duration;
        },
        distanceBased: (distanceMeters) {
          if (distanceMeters > maxDistanceMeters) {
            maxDistanceMeters = distanceMeters;
          }
        },
      );
    }

    return ExercisePersonalRecord(
      exerciseId: exercise.exerciseId,
      name: exercise.name,
      gifUrl: exercise.gifUrl,
      maxReps: maxReps,
      maxWeightKg: maxWeightKg,
      maxDuration: maxDuration,
      maxDistanceMeters: maxDistanceMeters,
      setType: exercise.setType,
      prDate: prDate,
    );
  }
}
