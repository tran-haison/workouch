// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenAIResponseDtoImpl _$$OpenAIResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$OpenAIResponseDtoImpl(
  id: json['id'] as String,
  choices: (json['choices'] as List<dynamic>)
      .map((e) => OpenAIChoiceDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$OpenAIResponseDtoImplToJson(
  _$OpenAIResponseDtoImpl instance,
) => <String, dynamic>{'id': instance.id, 'choices': instance.choices};

_$OpenAIChoiceDtoImpl _$$OpenAIChoiceDtoImplFromJson(
  Map<String, dynamic> json,
) => _$OpenAIChoiceDtoImpl(
  message: OpenAIMessageResponseDto.fromJson(
    json['message'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$OpenAIChoiceDtoImplToJson(
  _$OpenAIChoiceDtoImpl instance,
) => <String, dynamic>{'message': instance.message};

_$OpenAIMessageResponseDtoImpl _$$OpenAIMessageResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$OpenAIMessageResponseDtoImpl(content: json['content'] as String);

Map<String, dynamic> _$$OpenAIMessageResponseDtoImplToJson(
  _$OpenAIMessageResponseDtoImpl instance,
) => <String, dynamic>{'content': instance.content};
