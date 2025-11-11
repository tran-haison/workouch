// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_set_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkingSetDtoImpl _$$WorkingSetDtoImplFromJson(Map<String, dynamic> json) =>
    _$WorkingSetDtoImpl(
      type: json['type'] as String,
      sets: (json['sets'] as num?)?.toInt() ?? 0,
      reps: (json['reps'] as num?)?.toInt() ?? 0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$WorkingSetDtoImplToJson(_$WorkingSetDtoImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'sets': instance.sets,
      'reps': instance.reps,
      'weight': instance.weight,
      'duration': instance.duration,
      'distance': instance.distance,
    };
