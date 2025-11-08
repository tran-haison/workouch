import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/domain/entities/workout.dart';

import '../../../../core/utils/error.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/exercise_filter.dart';

part 'workout_state.freezed.dart';

enum WorkoutStateStatus { initial, loading, loadingMore, success, error }

@freezed
class WorkoutState with _$WorkoutState {
  const factory WorkoutState({
    @Default(WorkoutStateStatus.initial) WorkoutStateStatus status,
    @Default([]) List<Exercise> exercises,
    @Default([]) List<String> bodyParts,
    @Default([]) List<String> equipments,
    @Default(Workout()) Workout selectedWorkout,
    @Default(ExerciseFilter()) ExerciseFilter filter,
    @Default('') String search,
    @Default(0) int currentOffset,
    @Default(20) int limit,
    @Default(true) bool hasMore,
    Error? error,
  }) = _WorkoutState;
}

extension WorkoutStateExt on WorkoutState {
  bool get hasSelectedExercises => selectedWorkout.exercises.isNotEmpty;
}
