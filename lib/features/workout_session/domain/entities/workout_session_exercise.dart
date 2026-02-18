import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';
import 'package:workouch/features/workout/domain/entities/working_set.dart';

part 'workout_session_exercise.freezed.dart';

/// Represents an exercise performed within a completed workout session.
@freezed
class WorkoutSessionExercise with _$WorkoutSessionExercise {
  const WorkoutSessionExercise._();

  const factory WorkoutSessionExercise({
    @Default('') String id,
    @Default('') String workoutSessionId,
    @Default(0) int exerciseOrder,
    @Default('') String exerciseId,
    @Default('') String name,
    @Default('') String gifUrl,
    @Default(WorkingSetType.weightBased) WorkingSetType setType,
    @Default([]) List<WorkingSet> sets,
    @Default(Duration.zero) Duration restTimeBetweenSets,
    @Default(0.0) double totalVolumeKg,
  }) = _WorkoutSessionExercise;
}

extension WorkoutSessionExerciseExt on WorkoutSessionExercise {
  static WorkoutSessionExercise fromExercise(WorkingExercise exercise) {
    return WorkoutSessionExercise(
      exerciseOrder: exercise.exerciseOrder,
      exerciseId: exercise.exerciseId,
      name: exercise.name,
      gifUrl: exercise.gifUrl,
      setType: exercise.effectiveSetType ?? WorkingSetType.weightBased,
      sets: exercise.sets,
      restTimeBetweenSets: exercise.restTimeBetweenSets,
    );
  }
}
