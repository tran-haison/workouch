// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PagingRequestImpl _$$PagingRequestImplFromJson(Map<String, dynamic> json) =>
    _$PagingRequestImpl(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      sortBy: $enumDecodeNullable(_$SortByEnumMap, json['sortBy']),
      sortOrder: $enumDecodeNullable(_$SortOrderEnumMap, json['sortOrder']),
    );

Map<String, dynamic> _$$PagingRequestImplToJson(_$PagingRequestImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'sortBy': _$SortByEnumMap[instance.sortBy],
      'sortOrder': _$SortOrderEnumMap[instance.sortOrder],
    };

const _$SortByEnumMap = {
  SortBy.name: 'name',
  SortBy.exerciseId: 'exerciseId',
  SortBy.targetMuscles: 'targetMuscles',
  SortBy.bodyParts: 'bodyParts',
  SortBy.equipments: 'equipments',
};

const _$SortOrderEnumMap = {SortOrder.asc: 'asc', SortOrder.desc: 'desc'};
