// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_workout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AIWorkoutDtoImpl _$$AIWorkoutDtoImplFromJson(Map<String, dynamic> json) =>
    _$AIWorkoutDtoImpl(
      name: json['name'] as String,
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => WorkingExerciseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      restTimeBetweenExercises: (json['restTimeBetweenExercises'] as num)
          .toInt(),
    );

Map<String, dynamic> _$$AIWorkoutDtoImplToJson(_$AIWorkoutDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'exercises': instance.exercises,
      'restTimeBetweenExercises': instance.restTimeBetweenExercises,
    };
