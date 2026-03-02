import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/core/extension/string_extension.dart';
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
    int? exerciseOrder,
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
      exerciseOrder: entity.exerciseOrder,
      setType: entity.setType?.name,
    );
  }
}

extension WorkingExerciseDtoExtension on WorkingExerciseDto {
  WorkingExercise toEntity() {
    return WorkingExercise(
      exerciseId: exerciseId,
      name: name.capitalized,
      gifUrl: gifUrl,
      description: description,
      targetMuscles: targetMuscles.map((e) => e.capitalized).toList(),
      bodyParts: bodyParts.map((e) => e.capitalized).toList(),
      equipments: equipments.map((e) => e.capitalized).toList(),
      secondaryMuscles: secondaryMuscles.map((e) => e.capitalized).toList(),
      instructions: instructions,
      sets: sets.map((set) => set.toEntity()).toList(),
      restTimeBetweenSets: Duration(seconds: restTimeBetweenSets),
      exerciseOrder: exerciseOrder ?? 0,
      setType: setType != null ? WorkingSetTypeExt.fromString(setType!) : null,
    );
  }
}
