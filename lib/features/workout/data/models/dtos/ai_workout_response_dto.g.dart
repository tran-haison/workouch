// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_workout_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AIWorkoutResponseDtoImpl _$$AIWorkoutResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$AIWorkoutResponseDtoImpl(
  workoutName: json['workout_name'] as String,
  exercises: (json['exercises'] as List<dynamic>)
      .map((e) => AIExerciseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  restTimeBetweenExercises:
      (json['rest_time_between_exercises'] as num?)?.toInt() ?? 60,
);

Map<String, dynamic> _$$AIWorkoutResponseDtoImplToJson(
  _$AIWorkoutResponseDtoImpl instance,
) => <String, dynamic>{
  'workout_name': instance.workoutName,
  'exercises': instance.exercises,
  'rest_time_between_exercises': instance.restTimeBetweenExercises,
};

_$AIExerciseDtoImpl _$$AIExerciseDtoImplFromJson(Map<String, dynamic> json) =>
    _$AIExerciseDtoImpl(
      name: json['name'] as String,
      sets: (json['sets'] as num?)?.toInt() ?? 3,
      reps: (json['reps'] as num?)?.toInt() ?? 10,
      weightKg: (json['weight_kg'] as num?)?.toDouble() ?? 0.0,
      durationSeconds: (json['duration_seconds'] as num?)?.toInt() ?? 0,
      restBetweenSetsSeconds:
          (json['rest_between_sets_seconds'] as num?)?.toInt() ?? 60,
      setType: json['set_type'] as String? ?? 'weightBased',
    );

Map<String, dynamic> _$$AIExerciseDtoImplToJson(_$AIExerciseDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sets': instance.sets,
      'reps': instance.reps,
      'weight_kg': instance.weightKg,
      'duration_seconds': instance.durationSeconds,
      'rest_between_sets_seconds': instance.restBetweenSetsSeconds,
      'set_type': instance.setType,
    };
