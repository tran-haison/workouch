import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/data/models/dtos/working_set_dto.dart';
import 'package:workouch/features/workout/domain/entities/working_set.dart';

import '../../../domain/entities/workout_session_exercise.dart';

part 'workout_session_exercise_dto.freezed.dart';
part 'workout_session_exercise_dto.g.dart';

@freezed
abstract class WorkoutSessionExerciseDto with _$WorkoutSessionExerciseDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WorkoutSessionExerciseDto({
    required String id,
    required String workoutSessionId,
    required int exerciseOrder,
    required String exerciseId,
    required String name,
    required String gifUrl,
    required String setType,
    required List<WorkingSetDto> sets,
    required int restTimeBetweenSets,
    required double totalVolumeKg,
  }) = _WorkoutSessionExerciseDto;

  factory WorkoutSessionExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionExerciseDtoFromJson(json);

  factory WorkoutSessionExerciseDto.fromEntity(WorkoutSessionExercise entity) {
    return WorkoutSessionExerciseDto(
      id: entity.id,
      workoutSessionId: entity.workoutSessionId,
      exerciseOrder: entity.exerciseOrder,
      exerciseId: entity.exerciseId,
      name: entity.name,
      gifUrl: entity.gifUrl,
      setType: entity.setType.name,
      sets: entity.sets.map((s) => WorkingSetDto.fromEntity(s)).toList(),
      restTimeBetweenSets: entity.restTimeBetweenSets.inSeconds,
      totalVolumeKg: entity.totalVolumeKg,
    );
  }
}

extension WorkoutSessionExerciseDtoExtension on WorkoutSessionExerciseDto {
  WorkoutSessionExercise toEntity() {
    return WorkoutSessionExercise(
      id: id,
      workoutSessionId: workoutSessionId,
      exerciseOrder: exerciseOrder,
      exerciseId: exerciseId,
      name: name,
      gifUrl: gifUrl,
      setType: WorkingSetTypeExt.fromString(setType),
      sets: sets.map((s) => s.toEntity()).toList(),
      restTimeBetweenSets: Duration(seconds: restTimeBetweenSets),
      totalVolumeKg: totalVolumeKg,
    );
  }
}
