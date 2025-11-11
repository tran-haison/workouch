// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutDtoImpl _$$WorkoutDtoImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => WorkingExerciseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      restTimeBetweenExercises: (json['restTimeBetweenExercises'] as num)
          .toInt(),
    );

Map<String, dynamic> _$$WorkoutDtoImplToJson(_$WorkoutDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'exercises': instance.exercises,
      'restTimeBetweenExercises': instance.restTimeBetweenExercises,
    };
