import 'package:freezed_annotation/freezed_annotation.dart';

part 'openai_request.freezed.dart';
part 'openai_request.g.dart';

@freezed
class OpenAIRequest with _$OpenAIRequest {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory OpenAIRequest({
    required String model,
    required List<OpenAIInput> input,
  }) = _OpenAIRequest;

  factory OpenAIRequest.fromJson(Map<String, dynamic> json) =>
      _$OpenAIRequestFromJson(json);
}

@freezed
class OpenAIInput with _$OpenAIInput {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory OpenAIInput({
    required String role,
    @_OpenAIContentConverter() required OpenAIContent content,
  }) = _OpenAIInput;

  factory OpenAIInput.fromJson(Map<String, dynamic> json) =>
      _$OpenAIInputFromJson(json);
}

@freezed
class OpenAIContent with _$OpenAIContent {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory OpenAIContent.text(String text) = _OpenAIContentText;

  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory OpenAIContent.items(List<OpenAIContentItem> items) =
      _OpenAIContentItems;

  factory OpenAIContent.fromJson(Map<String, dynamic> json) =>
      _$OpenAIContentFromJson(json);
}

@freezed
class OpenAIContentItem with _$OpenAIContentItem {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory OpenAIContentItem({
    required String type,
    String? fileId,
    String? text,
  }) = _OpenAIContentItem;

  factory OpenAIContentItem.fromJson(Map<String, dynamic> json) =>
      _$OpenAIContentItemFromJson(json);
}

/// Custom JSON converter for OpenAIContent
class _OpenAIContentConverter implements JsonConverter<OpenAIContent, dynamic> {
  const _OpenAIContentConverter();

  @override
  OpenAIContent fromJson(dynamic json) {
    if (json is String) {
      return OpenAIContent.text(json);
    } else if (json is List) {
      final items = (json)
          .map((e) => OpenAIContentItem.fromJson(e as Map<String, dynamic>))
          .toList();
      return OpenAIContent.items(items);
    }
    throw ArgumentError('Invalid content type: ${json.runtimeType}');
  }

  @override
  dynamic toJson(OpenAIContent content) {
    return content.when(
      text: (text) => text,
      items: (items) => items.map((item) => item.toJson()).toList(),
    );
  }
}
