import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/domain/entities/working_set.dart';

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
    @Default(0) int maxDurationSeconds,
    @Default(0.0) double maxDistanceMeters,
    @Default(WorkingSetType.weightBased) WorkingSetType setType,
    required DateTime prDate,
    @Default(true) bool isVisibleOnHistory,
  }) = _ExercisePersonalRecord;
}
