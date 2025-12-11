import 'package:freezed_annotation/freezed_annotation.dart';

part 'openai_request_dto.freezed.dart';
part 'openai_request_dto.g.dart';

@freezed
class OpenAIRequestDto with _$OpenAIRequestDto {
  const factory OpenAIRequestDto({
    @JsonKey(name: 'model') required String model,
    @JsonKey(name: 'messages') required List<OpenAIMessageDto> messages,
    @JsonKey(name: 'temperature') @Default(0.7) double temperature,
    @JsonKey(name: 'response_format')
    @Default(null)
    OpenAIResponseFormatDto? responseFormat,
  }) = _OpenAIRequestDto;

  factory OpenAIRequestDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAIRequestDtoFromJson(json);
}

@freezed
class OpenAIMessageDto with _$OpenAIMessageDto {
  const factory OpenAIMessageDto({
    @JsonKey(name: 'role') required String role,
    @JsonKey(name: 'content') required String content,
  }) = _OpenAIMessageDto;

  factory OpenAIMessageDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAIMessageDtoFromJson(json);
}

@freezed
class OpenAIResponseFormatDto with _$OpenAIResponseFormatDto {
  const factory OpenAIResponseFormatDto({
    @JsonKey(name: 'type') @Default('json_object') String type,
  }) = _OpenAIResponseFormatDto;

  factory OpenAIResponseFormatDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAIResponseFormatDtoFromJson(json);
}
