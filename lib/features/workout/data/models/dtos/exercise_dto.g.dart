// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseDtoImpl _$$ExerciseDtoImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseDtoImpl(
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
    );

Map<String, dynamic> _$$ExerciseDtoImplToJson(_$ExerciseDtoImpl instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'name': instance.name,
      'gifUrl': instance.gifUrl,
      'description': instance.description,
      'targetMuscles': instance.targetMuscles,
      'bodyParts': instance.bodyParts,
      'equipments': instance.equipments,
      'secondaryMuscles': instance.secondaryMuscles,
      'instructions': instance.instructions,
    };
