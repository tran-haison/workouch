// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_personal_record_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExercisePersonalRecordDtoImpl _$$ExercisePersonalRecordDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ExercisePersonalRecordDtoImpl(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  exerciseId: json['exercise_id'] as String,
  name: json['name'] as String,
  gifUrl: json['gif_url'] as String,
  maxReps: (json['max_reps'] as num).toInt(),
  maxWeightKg: (json['max_weight_kg'] as num).toDouble(),
  maxDurationSeconds: (json['max_duration_seconds'] as num).toInt(),
  maxDistanceMeters: (json['max_distance_meters'] as num).toDouble(),
  setType: json['set_type'] as String,
  prDate: json['pr_date'] as String,
  isVisibleOnHistory: json['is_visible_on_history'] as bool,
);

Map<String, dynamic> _$$ExercisePersonalRecordDtoImplToJson(
  _$ExercisePersonalRecordDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'exercise_id': instance.exerciseId,
  'name': instance.name,
  'gif_url': instance.gifUrl,
  'max_reps': instance.maxReps,
  'max_weight_kg': instance.maxWeightKg,
  'max_duration_seconds': instance.maxDurationSeconds,
  'max_distance_meters': instance.maxDistanceMeters,
  'set_type': instance.setType,
  'pr_date': instance.prDate,
  'is_visible_on_history': instance.isVisibleOnHistory,
};
