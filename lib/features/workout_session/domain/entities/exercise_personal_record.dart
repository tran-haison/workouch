import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/domain/entities/working_set.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extension/duration_extension.dart';
import 'workout_session_exercise.dart';

part 'exercise_personal_record.freezed.dart';

/// Personal record for an exercise, stored in exercise_personal_records table.
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
  String get displayValue {
    switch (setType) {
      case WorkingSetType.weightBased:
        return '${maxWeightKg.toStringAsFixed(1)} ${AppConstants.kg} × $maxReps ${AppConstants.reps}';
      case WorkingSetType.repsOnly:
        return '$maxReps ${AppConstants.reps}';
      case WorkingSetType.timeBased:
        return maxDuration.hhmmss;
      case WorkingSetType.distanceBased:
        return '${maxDistanceMeters.toStringAsFixed(1)} m';
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
        weightBased: (_, reps, weight) {
          if (weight > maxWeightKg) {
            maxWeightKg = weight;
            maxReps = reps;
          }
        },
        repsOnly: (_, reps) {
          if (reps > maxReps) maxReps = reps;
        },
        timeBased: (duration) {
          if (duration > maxDuration) maxDuration = duration;
        },
        distanceBased: (distance) {
          if (distance > maxDistanceMeters) maxDistanceMeters = distance;
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
