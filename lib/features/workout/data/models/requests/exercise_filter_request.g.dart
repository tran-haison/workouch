// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseFilterRequestImpl _$$ExerciseFilterRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ExerciseFilterRequestImpl(
  search: json['search'] as String?,
  equipments: json['equipments'] as String?,
  bodyParts: json['bodyParts'] as String?,
);

Map<String, dynamic> _$$ExerciseFilterRequestImplToJson(
  _$ExerciseFilterRequestImpl instance,
) => <String, dynamic>{
  'search': instance.search,
  'equipments': instance.equipments,
  'bodyParts': instance.bodyParts,
};
