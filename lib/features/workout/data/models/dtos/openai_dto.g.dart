// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenAIDtoImpl _$$OpenAIDtoImplFromJson(Map<String, dynamic> json) =>
    _$OpenAIDtoImpl(
      output: (json['output'] as List<dynamic>)
          .map((e) => OpenAIOutputDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OpenAIDtoImplToJson(_$OpenAIDtoImpl instance) =>
    <String, dynamic>{'output': instance.output};

_$OpenAIOutputDtoImpl _$$OpenAIOutputDtoImplFromJson(
  Map<String, dynamic> json,
) => _$OpenAIOutputDtoImpl(
  content: (json['content'] as List<dynamic>)
      .map((e) => OpenAIContentDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$OpenAIOutputDtoImplToJson(
  _$OpenAIOutputDtoImpl instance,
) => <String, dynamic>{'content': instance.content};

_$OpenAIContentDtoImpl _$$OpenAIContentDtoImplFromJson(
  Map<String, dynamic> json,
) => _$OpenAIContentDtoImpl(text: json['text'] as String);

Map<String, dynamic> _$$OpenAIContentDtoImplToJson(
  _$OpenAIContentDtoImpl instance,
) => <String, dynamic>{'text': instance.text};
