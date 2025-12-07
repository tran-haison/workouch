import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';
import '../../../workout/domain/entities/workout.dart';

part 'workout_session_state.freezed.dart';

@freezed
class WorkoutSessionState with _$WorkoutSessionState {
  const factory WorkoutSessionState({
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

  bool get hasRestExercises => workout.restTimeBetweenExercises > Duration.zero;

  bool get hasRestSets => currentExercise.restTimeBetweenSets > Duration.zero;

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
}
