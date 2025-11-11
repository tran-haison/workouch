// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkingExerciseDtoImpl _$$WorkingExerciseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$WorkingExerciseDtoImpl(
  exerciseId: json['exerciseId'] as String,
  name: json['name'] as String,
  gifUrl: json['gifUrl'] as String,
  description: json['description'] as String,
  targetMuscles: (json['targetMuscles'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  bodyParts: (json['bodyParts'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  equipments: (json['equipments'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  secondaryMuscles: (json['secondaryMuscles'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  instructions: (json['instructions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  sets: (json['sets'] as List<dynamic>)
      .map((e) => WorkingSetDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  restTimeBetweenSets: (json['restTimeBetweenSets'] as num).toInt(),
  setType: json['setType'] as String?,
);

Map<String, dynamic> _$$WorkingExerciseDtoImplToJson(
  _$WorkingExerciseDtoImpl instance,
) => <String, dynamic>{
  'exerciseId': instance.exerciseId,
  'name': instance.name,
  'gifUrl': instance.gifUrl,
  'description': instance.description,
  'targetMuscles': instance.targetMuscles,
  'bodyParts': instance.bodyParts,
  'equipments': instance.equipments,
  'secondaryMuscles': instance.secondaryMuscles,
  'instructions': instance.instructions,
  'sets': instance.sets,
  'restTimeBetweenSets': instance.restTimeBetweenSets,
  'setType': instance.setType,
};
