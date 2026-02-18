import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/domain/entities/working_set.dart';

import '../../../domain/entities/exercise_personal_record.dart';

part 'exercise_personal_record_dto.freezed.dart';
part 'exercise_personal_record_dto.g.dart';

@freezed
abstract class ExercisePersonalRecordDto with _$ExercisePersonalRecordDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ExercisePersonalRecordDto({
    required String id,
    required String userId,
    required String exerciseId,
    required String name,
    required String gifUrl,
    required int maxReps,
    required double maxWeightKg,
    required int maxDurationSeconds,
    required double maxDistanceMeters,
    required String setType,
    required String prDate,
    required bool isVisibleOnHistory,
  }) = _ExercisePersonalRecordDto;

  factory ExercisePersonalRecordDto.fromJson(Map<String, dynamic> json) =>
      _$ExercisePersonalRecordDtoFromJson(json);

  factory ExercisePersonalRecordDto.fromEntity(ExercisePersonalRecord entity) {
    return ExercisePersonalRecordDto(
      id: entity.id,
      userId: entity.userId,
      exerciseId: entity.exerciseId,
      name: entity.name,
      gifUrl: entity.gifUrl,
      maxReps: entity.maxReps,
      maxWeightKg: entity.maxWeightKg,
      maxDurationSeconds: entity.maxDurationSeconds,
      maxDistanceMeters: entity.maxDistanceMeters,
      setType: entity.setType.name,
      prDate: entity.prDate.toUtc().toIso8601String(),
      isVisibleOnHistory: entity.isVisibleOnHistory,
    );
  }
}

extension ExercisePersonalRecordDtoExtension on ExercisePersonalRecordDto {
  ExercisePersonalRecord toEntity() {
    return ExercisePersonalRecord(
      id: id,
      userId: userId,
      exerciseId: exerciseId,
      name: name,
      gifUrl: gifUrl,
      maxReps: maxReps,
      maxWeightKg: maxWeightKg,
      maxDurationSeconds: maxDurationSeconds,
      maxDistanceMeters: maxDistanceMeters,
      setType: WorkingSetTypeExt.fromString(setType),
      prDate: DateTime.parse(prDate).toLocal(),
      isVisibleOnHistory: isVisibleOnHistory,
    );
  }
}
