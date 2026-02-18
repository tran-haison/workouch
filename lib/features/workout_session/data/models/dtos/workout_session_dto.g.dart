// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSessionDtoImpl _$$WorkoutSessionDtoImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutSessionDtoImpl(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  workoutId: json['workout_id'] as String?,
  workoutName: json['workout_name'] as String,
  startedAt: json['started_at'] as String,
  completedAt: json['completed_at'] as String,
  totalDurationSeconds: (json['total_duration_seconds'] as num).toInt(),
  totalVolumeKg: (json['total_volume_kg'] as num).toDouble(),
  totalSets: (json['total_sets'] as num).toInt(),
  totalExercises: (json['total_exercises'] as num).toInt(),
  caloriesBurned: (json['calories_burned'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  exercises:
      (json['exercises'] as List<dynamic>?)
          ?.map(
            (e) =>
                WorkoutSessionExerciseDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$WorkoutSessionDtoImplToJson(
  _$WorkoutSessionDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'workout_id': instance.workoutId,
  'workout_name': instance.workoutName,
  'started_at': instance.startedAt,
  'completed_at': instance.completedAt,
  'total_duration_seconds': instance.totalDurationSeconds,
  'total_volume_kg': instance.totalVolumeKg,
  'total_sets': instance.totalSets,
  'total_exercises': instance.totalExercises,
  'calories_burned': instance.caloriesBurned,
  'notes': instance.notes,
  'exercises': instance.exercises,
};
