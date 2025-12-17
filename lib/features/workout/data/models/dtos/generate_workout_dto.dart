import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/workout.dart';
import 'working_exercise_dto.dart';

part 'generate_workout_dto.freezed.dart';
part 'generate_workout_dto.g.dart';

@freezed
abstract class GenerateWorkoutDto with _$GenerateWorkoutDto {
  const factory GenerateWorkoutDto({
    String? name,
    List<WorkingExerciseDto>? exercises,
    int? restTimeBetweenExercises, // in seconds
  }) = _GenerateWorkoutDto;

  factory GenerateWorkoutDto.fromJson(Map<String, dynamic> json) =>
      _$GenerateWorkoutDtoFromJson(json);
}

extension GenerateWorkoutDtoExtension on GenerateWorkoutDto {
  Workout toEntity() {
    return Workout(
      name: name ?? '',
      exercises:
          exercises?.map((exercise) => exercise.toEntity()).toList() ?? [],
      restTimeBetweenExercises: Duration(
        seconds: restTimeBetweenExercises ?? 0,
      ),
    );
  }
}
