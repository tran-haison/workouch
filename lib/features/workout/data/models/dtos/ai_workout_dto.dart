import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/domain/entities/workout.dart';

import 'working_exercise_dto.dart';

part 'ai_workout_dto.freezed.dart';
part 'ai_workout_dto.g.dart';

@freezed
class AIWorkoutDto with _$AIWorkoutDto {
  const factory AIWorkoutDto({
    required String name,
    required List<WorkingExerciseDto> exercises,
    required int restTimeBetweenExercises, // in seconds
  }) = _AIWorkoutDto;

  factory AIWorkoutDto.fromJson(Map<String, dynamic> json) =>
      _$AIWorkoutDtoFromJson(json);
}

extension AIWorkoutDtoExtension on AIWorkoutDto {
  Workout toEntity() {
    return Workout(
      name: name,
      exercises: exercises.map((exercise) => exercise.toEntity()).toList(),
      restTimeBetweenExercises: Duration(seconds: restTimeBetweenExercises),
    );
  }
}
