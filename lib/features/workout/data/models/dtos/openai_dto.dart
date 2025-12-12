import 'package:freezed_annotation/freezed_annotation.dart';

part 'openai_dto.freezed.dart';
part 'openai_dto.g.dart';

@freezed
class OpenAIDto with _$OpenAIDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OpenAIDto({required List<OpenAIOutputDto> output}) = _OpenAIDto;

  factory OpenAIDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAIDtoFromJson(json);
}

@freezed
class OpenAIOutputDto with _$OpenAIOutputDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OpenAIOutputDto({required List<OpenAIContentDto> content}) =
      _OpenAIOutputDto;

  factory OpenAIOutputDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAIOutputDtoFromJson(json);
}

@freezed
class OpenAIContentDto with _$OpenAIContentDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OpenAIContentDto({required String text}) = _OpenAIContentDto;

  factory OpenAIContentDto.fromJson(Map<String, dynamic> json) =>
      _$OpenAIContentDtoFromJson(json);
}
