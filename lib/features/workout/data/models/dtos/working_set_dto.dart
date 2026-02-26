import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/features/workout/domain/entities/working_set.dart';

part 'working_set_dto.freezed.dart';
part 'working_set_dto.g.dart';

@freezed
abstract class WorkingSetDto with _$WorkingSetDto {
  const factory WorkingSetDto({
    required String type,
    @Default(0) int sets,
    @Default(0) int reps,
    @Default(0.0) double weight, // in kg
    @Default(0) int duration, // in seconds
    @Default(0.0) double distance, // in meters
  }) = _WorkingSetDto;

  factory WorkingSetDto.fromJson(Map<String, dynamic> json) =>
      _$WorkingSetDtoFromJson(json);

  factory WorkingSetDto.fromEntity(WorkingSet entity) {
    return entity.when(
      weightBased: (sets, reps, weight) => WorkingSetDto(
        type: WorkingSetType.weightBased.name,
        sets: sets,
        reps: reps,
        weight: weight,
      ),
      timeBased: (duration) => WorkingSetDto(
        type: WorkingSetType.timeBased.name,
        duration: duration.inSeconds,
      ),
      distanceBased: (distance) => WorkingSetDto(
        type: WorkingSetType.distanceBased.name,
        distance: distance,
      ),
      repsOnly: (sets, reps) => WorkingSetDto(
        type: WorkingSetType.repsOnly.name,
        sets: sets,
        reps: reps,
      ),
    );
  }
}

extension WorkingSetDtoExtension on WorkingSetDto {
  WorkingSet toEntity() {
    final setType = WorkingSetTypeExt.fromString(type);
    switch (setType) {
      case WorkingSetType.weightBased:
        return WorkingSet.weightBased(sets: sets, reps: reps, weightKg: weight);
      case WorkingSetType.timeBased:
        return WorkingSet.timeBased(duration: Duration(seconds: duration));
      case WorkingSetType.distanceBased:
        return WorkingSet.distanceBased(distanceMeters: distance);
      case WorkingSetType.repsOnly:
        return WorkingSet.repsOnly(sets: sets, reps: reps);
    }
  }
}
