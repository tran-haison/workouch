import 'package:freezed_annotation/freezed_annotation.dart';

part 'openai_response_dto.freezed.dart';
part 'openai_response_dto.g.dart';

@freezed
class OpenAIResponseDto with _$OpenAIResponseDto {
  const factory OpenAIResponseDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'choices') required List<OpenAIChoiceDto> choices,
  }) = _OpenAIResponseDto;

  factory OpenAIResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAIResponseDtoFromJson(json);
}

@freezed
class OpenAIChoiceDto with _$OpenAIChoiceDto {
  const factory OpenAIChoiceDto({
    @JsonKey(name: 'message') required OpenAIMessageResponseDto message,
  }) = _OpenAIChoiceDto;

  factory OpenAIChoiceDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAIChoiceDtoFromJson(json);
}

@freezed
class OpenAIMessageResponseDto with _$OpenAIMessageResponseDto {
  const factory OpenAIMessageResponseDto({
    @JsonKey(name: 'content') required String content,
  }) = _OpenAIMessageResponseDto;

  factory OpenAIMessageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAIMessageResponseDtoFromJson(json);
}
