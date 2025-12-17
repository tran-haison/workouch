import 'package:json_annotation/json_annotation.dart';

part 'api_response_dto.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponseDto<T> {
  final bool success;
  final List<T> data;

  ApiResponseDto({required this.success, required this.data});

  factory ApiResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseDtoFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ApiResponseDtoToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class ApiSingleResponseDto<T> {
  final bool success;
  final T data;

  ApiSingleResponseDto({required this.success, required this.data});

  factory ApiSingleResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiSingleResponseDtoFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ApiSingleResponseDtoToJson(this, toJsonT);
}
