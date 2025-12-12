// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenAIRequestImpl _$$OpenAIRequestImplFromJson(Map<String, dynamic> json) =>
    _$OpenAIRequestImpl(
      model: json['model'] as String,
      input: (json['input'] as List<dynamic>)
          .map((e) => OpenAIInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OpenAIRequestImplToJson(_$OpenAIRequestImpl instance) =>
    <String, dynamic>{'model': instance.model, 'input': instance.input};

_$OpenAIInputImpl _$$OpenAIInputImplFromJson(Map<String, dynamic> json) =>
    _$OpenAIInputImpl(
      role: json['role'] as String,
      content: const _OpenAIContentConverter().fromJson(json['content']),
    );

Map<String, dynamic> _$$OpenAIInputImplToJson(_$OpenAIInputImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      if (const _OpenAIContentConverter().toJson(instance.content)
          case final value?)
        'content': value,
    };

_$OpenAIContentTextImpl _$$OpenAIContentTextImplFromJson(
  Map<String, dynamic> json,
) => _$OpenAIContentTextImpl(
  json['text'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$OpenAIContentTextImplToJson(
  _$OpenAIContentTextImpl instance,
) => <String, dynamic>{'text': instance.text, 'runtimeType': instance.$type};

_$OpenAIContentItemsImpl _$$OpenAIContentItemsImplFromJson(
  Map<String, dynamic> json,
) => _$OpenAIContentItemsImpl(
  (json['items'] as List<dynamic>)
      .map((e) => OpenAIContentItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$OpenAIContentItemsImplToJson(
  _$OpenAIContentItemsImpl instance,
) => <String, dynamic>{'items': instance.items, 'runtimeType': instance.$type};

_$OpenAIContentItemImpl _$$OpenAIContentItemImplFromJson(
  Map<String, dynamic> json,
) => _$OpenAIContentItemImpl(
  type: json['type'] as String,
  fileId: json['file_id'] as String?,
  text: json['text'] as String?,
);

Map<String, dynamic> _$$OpenAIContentItemImplToJson(
  _$OpenAIContentItemImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  if (instance.fileId case final value?) 'file_id': value,
  if (instance.text case final value?) 'text': value,
};
