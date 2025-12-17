// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseDto<T> _$ApiResponseDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ApiResponseDto<T>(
  success: json['success'] as bool,
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
);

Map<String, dynamic> _$ApiResponseDtoToJson<T>(
  ApiResponseDto<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data.map(toJsonT).toList(),
};

ApiSingleResponseDto<T> _$ApiSingleResponseDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ApiSingleResponseDto<T>(
  success: json['success'] as bool,
  data: fromJsonT(json['data']),
);

Map<String, dynamic> _$ApiSingleResponseDtoToJson<T>(
  ApiSingleResponseDto<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'success': instance.success,
  'data': toJsonT(instance.data),
};
