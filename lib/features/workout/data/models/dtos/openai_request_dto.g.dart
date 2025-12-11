// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenAIRequestDtoImpl _$$OpenAIRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$OpenAIRequestDtoImpl(
  model: json['model'] as String,
  messages: (json['messages'] as List<dynamic>)
      .map((e) => OpenAIMessageDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  temperature: (json['temperature'] as num?)?.toDouble() ?? 0.7,
  responseFormat: json['response_format'] == null
      ? null
      : OpenAIResponseFormatDto.fromJson(
          json['response_format'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$OpenAIRequestDtoImplToJson(
  _$OpenAIRequestDtoImpl instance,
) => <String, dynamic>{
  'model': instance.model,
  'messages': instance.messages,
  'temperature': instance.temperature,
  'response_format': instance.responseFormat,
};

_$OpenAIMessageDtoImpl _$$OpenAIMessageDtoImplFromJson(
  Map<String, dynamic> json,
) => _$OpenAIMessageDtoImpl(
  role: json['role'] as String,
  content: json['content'] as String,
);

Map<String, dynamic> _$$OpenAIMessageDtoImplToJson(
  _$OpenAIMessageDtoImpl instance,
) => <String, dynamic>{'role': instance.role, 'content': instance.content};

_$OpenAIResponseFormatDtoImpl _$$OpenAIResponseFormatDtoImplFromJson(
  Map<String, dynamic> json,
) => _$OpenAIResponseFormatDtoImpl(
  type: json['type'] as String? ?? 'json_object',
);

Map<String, dynamic> _$$OpenAIResponseFormatDtoImplToJson(
  _$OpenAIResponseFormatDtoImpl instance,
) => <String, dynamic>{'type': instance.type};
