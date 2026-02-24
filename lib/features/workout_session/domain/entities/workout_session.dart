import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/domain/entities/history_stats.dart';
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
    );
  }

  double get totalDurationMinutes {
    return (totalDurationSeconds / 60).toDouble();
  }
}

extension WorkoutSessionListExt on List<WorkoutSession> {
  List<WorkoutSession> sessionsByDate(DateTime date) {
    return where(
      (s) =>
          s.completedAt.day == date.day &&
          s.completedAt.month == date.month &&
          s.completedAt.year == date.year,
    ).toList();
  }

  HistoryStats get historyStats {
    final totalWorkouts = length;
    final totalTrainingVolume = fold<double>(
      0,
      (sum, s) => sum + s.totalVolumeKg,
    );
    final totalTimeSeconds = fold<int>(
      0,
      (sum, s) => sum + s.totalDurationSeconds,
    );
    return HistoryStats(
      totalWorkouts: totalWorkouts,
      totalTrainingVolume: totalTrainingVolume,
      totalTime: Duration(seconds: totalTimeSeconds),
    );
  }
}
