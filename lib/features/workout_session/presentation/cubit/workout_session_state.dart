import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/core/extension/duration_extension.dart';
import 'package:workouch/features/auth/domain/entities/user.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';
import 'package:workouch/features/workout/domain/entities/working_set.dart';
import '../../../../core/utils/health_utils.dart';
import '../../../workout/domain/entities/workout.dart';

import '../../domain/entities/workout_session_exercise.dart';

part 'workout_session_state.freezed.dart';

enum WorkoutSessionStateStatus { initial, loading, success, error }

@freezed
class WorkoutSessionState with _$WorkoutSessionState {
  const factory WorkoutSessionState({
    @Default(User()) User user,
    @Default(Workout()) Workout workout,
    @Default(0) int currentExerciseIndex,
    @Default({}) Map<String, int> setIndexTracker, // {exerciseId: currSetIdx}
    @Default(Duration.zero) Duration totalTime,
    @Default(Duration.zero) Duration restSetsRemain,
    @Default(Duration.zero) Duration restExercisesRemain,
  }) = _WorkoutSessionState;
}

extension WorkoutSessionStateExt on WorkoutSessionState {
  WorkingExercise get currentExercise =>
      workout.exercises[currentExerciseIndex];

  int get currentSetIndex => setIndexTracker[currentExercise.exerciseId] ?? 0;

  bool get allSetsCompleted =>
      currentSetIndex >= currentExercise.separatedSets.length;

  bool get isFirstExercise => currentExerciseIndex == 0;

  bool get isLastExercise =>
      currentExerciseIndex == workout.exercises.length - 1;

  bool get hasNextExercise =>
      currentExerciseIndex < workout.exercises.length - 1;

  bool get hasPrevExercise => currentExerciseIndex > 0;

  bool get hasRestBetweenExercises =>
      workout.restTimeBetweenExercises > Duration.zero;

  bool get hasRestBetweenSets =>
      currentExercise.restTimeBetweenSets > Duration.zero;

  bool get isRestSetsActive => restSetsRemain > Duration.zero;

  bool get isRestExercisesActive => restExercisesRemain > Duration.zero;

  int get totalExercisesCompleted => workout.exercises
      .where((exercise) => (setIndexTracker[exercise.exerciseId] ?? 0) > 0)
      .length;

  int get totalSetsCompleted {
    int sets = 0;
    setIndexTracker.forEach((_, count) {
      sets += count;
    });
    return sets;
  }

  double get caloriesBurned => HealthUtils.calculateCalories(
    weightKg: user.weightKg,
    minutes: totalTime.minutes,
  ).toDouble();

  /// Total volume completed in kg. Only counts weight-based exercises.
  /// Volume for one exercise = sum over completed sets of (reps × weight in kg).
  double get totalVolumeKgCompleted {
    if (workout.exercises.isEmpty) return 0;
    var total = 0.0;
    for (final exercise in workout.exercises) {
      if (exercise.effectiveSetType != WorkingSetType.weightBased) continue;
      final setsCompleted = setIndexTracker[exercise.exerciseId] ?? 0;
      final separated = exercise.separatedSets;
      for (var i = 0; i < setsCompleted && i < separated.length; i++) {
        final set = separated[i];
        set.maybeWhen(
          weightBased: (_, reps, weight) => total += reps * weight,
          orElse: () {},
        );
      }
    }
    return total;
  }

  /// List of exercises that have at least one set completed, with only their
  /// completed sets. Exercises/sets not marked completed are excluded.
  List<WorkoutSessionExercise> get exercisesSessionCompleted {
    final result = <WorkoutSessionExercise>[];
    var order = 0;
    for (final exercise in workout.exercises) {
      final setsCompleted = setIndexTracker[exercise.exerciseId] ?? 0;
      if (setsCompleted == 0) continue;

      final separated = exercise.separatedSets;
      final completedSets = <WorkingSet>[];
      var volumeKg = 0.0;
      for (var i = 0; i < setsCompleted && i < separated.length; i++) {
        final set = separated[i];
        completedSets.add(set);
        set.maybeWhen(
          weightBased: (_, reps, weight) => volumeKg += reps * weight,
          orElse: () {},
        );
      }

      result.add(
        WorkoutSessionExerciseExt.fromExercise(exercise).copyWith(
          exerciseOrder: order++,
          sets: completedSets,
          totalVolumeKg: volumeKg,
        ),
      );
    }
    return result;
  }
}
