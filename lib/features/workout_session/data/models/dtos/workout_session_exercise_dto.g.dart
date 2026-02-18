// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session_exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSessionExerciseDtoImpl _$$WorkoutSessionExerciseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$WorkoutSessionExerciseDtoImpl(
  id: json['id'] as String,
  workoutSessionId: json['workout_session_id'] as String,
  exerciseOrder: (json['exercise_order'] as num).toInt(),
  exerciseId: json['exercise_id'] as String,
  name: json['name'] as String,
  gifUrl: json['gif_url'] as String,
  setType: json['set_type'] as String,
  sets: (json['sets'] as List<dynamic>)
      .map((e) => WorkingSetDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  restTimeBetweenSets: (json['rest_time_between_sets'] as num).toInt(),
  totalVolumeKg: (json['total_volume_kg'] as num).toDouble(),
);

Map<String, dynamic> _$$WorkoutSessionExerciseDtoImplToJson(
  _$WorkoutSessionExerciseDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'workout_session_id': instance.workoutSessionId,
  'exercise_order': instance.exerciseOrder,
  'exercise_id': instance.exerciseId,
  'name': instance.name,
  'gif_url': instance.gifUrl,
  'set_type': instance.setType,
  'sets': instance.sets,
  'rest_time_between_sets': instance.restTimeBetweenSets,
  'total_volume_kg': instance.totalVolumeKg,
};
