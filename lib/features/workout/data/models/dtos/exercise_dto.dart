import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/core/extension/string_extension.dart';

import '../../../domain/entities/exercise.dart';

part 'exercise_dto.freezed.dart';
part 'exercise_dto.g.dart';

@freezed
abstract class ExerciseDto with _$ExerciseDto {
  const factory ExerciseDto({
    required String exerciseId,
    required String name,
    required String gifUrl,
    required String description,
    required List<String> targetMuscles,
    required List<String> bodyParts,
    required List<String> equipments,
    required List<String> secondaryMuscles,
    required List<String> instructions,
  }) = _ExerciseDto;

  factory ExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDtoFromJson(json);
}

extension ExerciseDtoExtension on ExerciseDto {
  Exercise toEntity() {
    return Exercise(
      exerciseId: exerciseId,
      name: name.capitalized,
      gifUrl: gifUrl,
      description: description,
      targetMuscles: targetMuscles.map((e) => e.capitalized).toList(),
      bodyParts: bodyParts.map((e) => e.capitalized).toList(),
      equipments: equipments.map((e) => e.capitalized).toList(),
      secondaryMuscles: secondaryMuscles.map((e) => e.capitalized).toList(),
      instructions: instructions,
    );
  }
}
