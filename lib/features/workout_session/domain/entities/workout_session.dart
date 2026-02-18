import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../workout/domain/entities/workout.dart';
import 'workout_session_exercise.dart';

part 'workout_session.freezed.dart';

/// Represents a completed workout session.
@freezed
class WorkoutSession with _$WorkoutSession {
  const WorkoutSession._();

  const factory WorkoutSession({
    @Default('') String id,
    @Default('') String userId,
    @Default('') String workoutId,
    @Default('') String workoutName,
    required DateTime startedAt,
    required DateTime completedAt,
    @Default(0) int totalDurationSeconds,
    @Default(0.0) double totalVolumeKg,
    @Default(0) int totalSets,
    @Default(0) int totalExercises,
    @Default(0.0) double caloriesBurned,
    @Default('') String notes,
    @Default([]) List<WorkoutSessionExercise> exercises,
  }) = _WorkoutSession;
}

extension WorkoutSessionExt on WorkoutSession {
  static WorkoutSession fromWorkout(Workout workout) {
    return WorkoutSession(
      workoutId: workout.id,
      workoutName: workout.name,
      startedAt: DateTime.now(),
      completedAt: DateTime.now(),
      exercises: workout.exercises
          .map((e) => WorkoutSessionExerciseExt.fromExercise(e))
          .toList(),
    );
  }
}
