// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_workout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateWorkoutDtoImpl _$$GenerateWorkoutDtoImplFromJson(
  Map<String, dynamic> json,
) => _$GenerateWorkoutDtoImpl(
  name: json['name'] as String?,
  exercises: (json['exercises'] as List<dynamic>?)
      ?.map((e) => WorkingExerciseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  restTimeBetweenExercises: (json['restTimeBetweenExercises'] as num?)?.toInt(),
);

Map<String, dynamic> _$$GenerateWorkoutDtoImplToJson(
  _$GenerateWorkoutDtoImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'exercises': instance.exercises,
  'restTimeBetweenExercises': instance.restTimeBetweenExercises,
};
