import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/domain/entities/workout.dart';

import 'working_exercise_dto.dart';

part 'workout_dto.freezed.dart';
part 'workout_dto.g.dart';

@freezed
abstract class WorkoutDto with _$WorkoutDto {
  const factory WorkoutDto({
    required String id,
    required String name,
    required List<WorkingExerciseDto> exercises,
    required int restTimeBetweenExercises, // in seconds
  }) = _WorkoutDto;

  factory WorkoutDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutDtoFromJson(json);

  factory WorkoutDto.fromEntity(Workout entity) {
    return WorkoutDto(
      id: entity.id,
      name: entity.name,
      exercises: entity.exercises
          .map((exercise) => WorkingExerciseDto.fromEntity(exercise))
          .toList(),
      restTimeBetweenExercises: entity.restTimeBetweenExercises.inSeconds,
    );
  }
}

extension WorkoutDtoExtension on WorkoutDto {
  Workout toEntity() {
    return Workout(
      id: id,
      name: name,
      exercises: exercises.map((exercise) => exercise.toEntity()).toList(),
      restTimeBetweenExercises: Duration(seconds: restTimeBetweenExercises),
    );
  }
}
