import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/domain/entities/workout.dart';

import '../../../../core/utils/error.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/exercise_filter.dart';
import '../../domain/entities/user_subscription.dart';

part 'workout_state.freezed.dart';

enum WorkoutStateStatus { initial, loading, loadingMore, success, error }

enum WorkoutGenLimitStatus { none, needUpgradePlan, hasReachedProLimit }

@freezed
class WorkoutState with _$WorkoutState {
  const factory WorkoutState({
    @Default(WorkoutStateStatus.initial) WorkoutStateStatus getExercisesStatus,
    @Default(WorkoutStateStatus.initial) WorkoutStateStatus saveWorkoutStatus,
    @Default(WorkoutStateStatus.initial) WorkoutStateStatus getWorkoutsStatus,
    @Default(WorkoutStateStatus.initial) WorkoutStateStatus deleteWorkoutStatus,
    @Default(WorkoutStateStatus.initial)
    WorkoutStateStatus generateAIWorkoutStatus,
    @Default([]) List<Exercise> exercises,
    @Default([]) List<String> bodyParts,
    @Default([]) List<String> equipments,
    @Default([]) List<Workout> workouts,
    @Default(Workout()) Workout selectedWorkout,
    @Default(Workout()) Workout displayedWorkout,
    @Default(Workout()) Workout aiGeneratedWorkout,
    UserSubscription? userSubscription,
    @Default(WorkoutGenLimitStatus.none)
    WorkoutGenLimitStatus workoutGenLimitStatus,
    @Default(ExerciseFilter()) ExerciseFilter filter,
    @Default('') String search,
    @Default(0) int currentOffset,
    @Default(20) int limit,
    @Default(true) bool hasMore,
    Error? getExercisesError,
    Error? saveWorkoutError,
    Error? getWorkoutsError,
    Error? deleteWorkoutError,
    Error? generateAIWorkoutError,
  }) = _WorkoutState;
}

extension WorkoutStateExt on WorkoutState {
  bool get hasSelectedExercises => selectedWorkout.exercises.isNotEmpty;
}

extension WorkoutGenLimitStatusExt on WorkoutGenLimitStatus {
  bool get isNeedUpgradePlan => this == WorkoutGenLimitStatus.needUpgradePlan;
  bool get isReachedProLimit =>
      this == WorkoutGenLimitStatus.hasReachedProLimit;
  bool get isNone => this == WorkoutGenLimitStatus.none;
}
