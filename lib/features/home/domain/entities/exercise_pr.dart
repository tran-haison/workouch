import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../workout/domain/entities/working_set.dart';

part 'exercise_pr.freezed.dart';

/*
This entity is used to store the personal record of an exercise.
*/
@freezed
class ExercisePR with _$ExercisePR {
  const ExercisePR._();

  const factory ExercisePR({
    @Default('') String userId,
    @Default('') String exerciseId,
    @Default('') String name,
    @Default('') String gifUrl,
    @Default(0) int maxReps,
    @Default(0.0) double maxWeight,
    @Default(0.0) double maxDistance,
    @Default(Duration.zero) Duration maxDuration,
    required DateTime prDate,
    required WorkingSetType setType,
  }) = _ExercisePR;
}
