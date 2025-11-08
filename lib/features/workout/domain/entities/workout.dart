import 'package:freezed_annotation/freezed_annotation.dart';

import 'working_exercise.dart';

part 'workout.freezed.dart';

@freezed
class Workout with _$Workout {
  const Workout._();

  const factory Workout({
    @Default('') String id,
    @Default('') String name,
    @Default([]) List<WorkingExercise> exercises,
    @Default(Duration.zero) Duration restTimeBetweenExercises,
  }) = _Workout;
}
