import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';
import 'package:workouch/features/workout/domain/entities/working_set.dart';

import 'working_set_dto.dart';

part 'working_exercise_dto.freezed.dart';
part 'working_exercise_dto.g.dart';

@freezed
abstract class WorkingExerciseDto with _$WorkingExerciseDto {
  const factory WorkingExerciseDto({
    required String exerciseId,
    required String name,
    required String gifUrl,
    required String description,
    required List<String> targetMuscles,
    required List<String> bodyParts,
    required List<String> equipments,
    required List<String> secondaryMuscles,
    required List<String> instructions,
    required List<WorkingSetDto> sets,
    required int restTimeBetweenSets, // in seconds
    String? setType,
  }) = _WorkingExerciseDto;

  factory WorkingExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$WorkingExerciseDtoFromJson(json);

  factory WorkingExerciseDto.fromEntity(WorkingExercise entity) {
    return WorkingExerciseDto(
      exerciseId: entity.exerciseId,
      name: entity.name,
      gifUrl: entity.gifUrl,
      description: entity.description,
      targetMuscles: entity.targetMuscles,
      bodyParts: entity.bodyParts,
      equipments: entity.equipments,
      secondaryMuscles: entity.secondaryMuscles,
      instructions: entity.instructions,
      sets: entity.sets.map((set) => WorkingSetDto.fromEntity(set)).toList(),
      restTimeBetweenSets: entity.restTimeBetweenSets.inSeconds,
      setType: entity.setType?.name,
    );
  }
}

extension WorkingExerciseDtoExtension on WorkingExerciseDto {
  WorkingExercise toEntity() {
    return WorkingExercise(
      exerciseId: exerciseId,
      name: name,
      gifUrl: gifUrl,
      description: description,
      targetMuscles: targetMuscles,
      bodyParts: bodyParts,
      equipments: equipments,
      secondaryMuscles: secondaryMuscles,
      instructions: instructions,
      sets: sets.map((set) => set.toEntity()).toList(),
      restTimeBetweenSets: Duration(seconds: restTimeBetweenSets),
      setType: setType != null
          ? WorkingSetType.values.firstWhere(
              (e) => e.name == setType,
              orElse: () => WorkingSetType.weightBased,
            )
          : null,
    );
  }
}
