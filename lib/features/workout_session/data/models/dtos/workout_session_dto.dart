import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/workout_session.dart';
import 'workout_session_exercise_dto.dart';

part 'workout_session_dto.freezed.dart';
part 'workout_session_dto.g.dart';

@freezed
abstract class WorkoutSessionDto with _$WorkoutSessionDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WorkoutSessionDto({
    required String id,
    required String userId,
    String? workoutId,
    required String workoutName,
    required String startedAt,
    required String completedAt,
    required int totalDurationSeconds,
    required double totalVolumeKg,
    required int totalSets,
    required int totalExercises,
    double? caloriesBurned,
    String? notes,
    @Default([]) List<WorkoutSessionExerciseDto> exercises,
  }) = _WorkoutSessionDto;

  factory WorkoutSessionDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionDtoFromJson(json);

  factory WorkoutSessionDto.fromEntity(WorkoutSession entity) {
    return WorkoutSessionDto(
      id: entity.id,
      userId: entity.userId,
      workoutId: entity.workoutId,
      workoutName: entity.workoutName,
      startedAt: entity.startedAt.toUtc().toIso8601String(),
      completedAt: entity.completedAt.toUtc().toIso8601String(),
      totalDurationSeconds: entity.totalDurationSeconds,
      totalVolumeKg: entity.totalVolumeKg,
      totalSets: entity.totalSets,
      totalExercises: entity.totalExercises,
      caloriesBurned: entity.caloriesBurned,
      notes: entity.notes,
      exercises: entity.exercises
          .map((e) => WorkoutSessionExerciseDto.fromEntity(e))
          .toList(),
    );
  }
}

extension WorkoutSessionDtoExtension on WorkoutSessionDto {
  WorkoutSession toEntity() {
    return WorkoutSession(
      id: id,
      userId: userId,
      workoutId: workoutId,
      workoutName: workoutName,
      startedAt: DateTime.parse(startedAt).toLocal(),
      completedAt: DateTime.parse(completedAt).toLocal(),
      totalDurationSeconds: totalDurationSeconds,
      totalVolumeKg: totalVolumeKg,
      totalSets: totalSets,
      totalExercises: totalExercises,
      caloriesBurned: caloriesBurned ?? 0.0,
      notes: notes ?? '',
      exercises: exercises.map((e) => e.toEntity()).toList(),
    );
  }
}
