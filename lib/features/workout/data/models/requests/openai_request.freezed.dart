// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openai_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpenAIRequest _$OpenAIRequestFromJson(Map<String, dynamic> json) {
  return _OpenAIRequest.fromJson(json);
}

/// @nodoc
mixin _$OpenAIRequest {
  String get model => throw _privateConstructorUsedError;
  List<OpenAIInput> get input => throw _privateConstructorUsedError;

  /// Serializes this OpenAIRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIRequestCopyWith<OpenAIRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIRequestCopyWith<$Res> {
  factory $OpenAIRequestCopyWith(
    OpenAIRequest value,
    $Res Function(OpenAIRequest) then,
  ) = _$OpenAIRequestCopyWithImpl<$Res, OpenAIRequest>;
  @useResult
  $Res call({String model, List<OpenAIInput> input});
}

/// @nodoc
class _$OpenAIRequestCopyWithImpl<$Res, $Val extends OpenAIRequest>
    implements $OpenAIRequestCopyWith<$Res> {
  _$OpenAIRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? model = null, Object? input = null}) {
    return _then(
      _value.copyWith(
            model: null == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as String,
            input: null == input
                ? _value.input
                : input // ignore: cast_nullable_to_non_nullable
                      as List<OpenAIInput>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenAIRequestImplCopyWith<$Res>
    implements $OpenAIRequestCopyWith<$Res> {
  factory _$$OpenAIRequestImplCopyWith(
    _$OpenAIRequestImpl value,
    $Res Function(_$OpenAIRequestImpl) then,
  ) = __$$OpenAIRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String model, List<OpenAIInput> input});
}

/// @nodoc
class __$$OpenAIRequestImplCopyWithImpl<$Res>
    extends _$OpenAIRequestCopyWithImpl<$Res, _$OpenAIRequestImpl>
    implements _$$OpenAIRequestImplCopyWith<$Res> {
  __$$OpenAIRequestImplCopyWithImpl(
    _$OpenAIRequestImpl _value,
    $Res Function(_$OpenAIRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? model = null, Object? input = null}) {
    return _then(
      _$OpenAIRequestImpl(
        model: null == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        input: null == input
            ? _value._input
            : input // ignore: cast_nullable_to_non_nullable
                  as List<OpenAIInput>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _$OpenAIRequestImpl implements _OpenAIRequest {
  const _$OpenAIRequestImpl({
    required this.model,
    required final List<OpenAIInput> input,
  }) : _input = input;

  factory _$OpenAIRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIRequestImplFromJson(json);

  @override
  final String model;
  final List<OpenAIInput> _input;
  @override
  List<OpenAIInput> get input {
    if (_input is EqualUnmodifiableListView) return _input;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_input);
  }

  @override
  String toString() {
    return 'OpenAIRequest(model: $model, input: $input)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._input, _input));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    model,
    const DeepCollectionEquality().hash(_input),
  );

  /// Create a copy of OpenAIRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIRequestImplCopyWith<_$OpenAIRequestImpl> get copyWith =>
      __$$OpenAIRequestImplCopyWithImpl<_$OpenAIRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIRequestImplToJson(this);
  }
}

abstract class _OpenAIRequest implements OpenAIRequest {
  const factory _OpenAIRequest({
    required final String model,
    required final List<OpenAIInput> input,
  }) = _$OpenAIRequestImpl;

  factory _OpenAIRequest.fromJson(Map<String, dynamic> json) =
      _$OpenAIRequestImpl.fromJson;

  @override
  String get model;
  @override
  List<OpenAIInput> get input;

  /// Create a copy of OpenAIRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIRequestImplCopyWith<_$OpenAIRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIInput _$OpenAIInputFromJson(Map<String, dynamic> json) {
  return _OpenAIInput.fromJson(json);
}

/// @nodoc
mixin _$OpenAIInput {
  String get role => throw _privateConstructorUsedError;
  @_OpenAIContentConverter()
  OpenAIContent get content => throw _privateConstructorUsedError;

  /// Serializes this OpenAIInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIInputCopyWith<OpenAIInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIInputCopyWith<$Res> {
  factory $OpenAIInputCopyWith(
    OpenAIInput value,
    $Res Function(OpenAIInput) then,
  ) = _$OpenAIInputCopyWithImpl<$Res, OpenAIInput>;
  @useResult
  $Res call({String role, @_OpenAIContentConverter() OpenAIContent content});

  $OpenAIContentCopyWith<$Res> get content;
}

/// @nodoc
class _$OpenAIInputCopyWithImpl<$Res, $Val extends OpenAIInput>
    implements $OpenAIInputCopyWith<$Res> {
  _$OpenAIInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? role = null, Object? content = null}) {
    return _then(
      _value.copyWith(
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as OpenAIContent,
          )
          as $Val,
    );
  }

  /// Create a copy of OpenAIInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OpenAIContentCopyWith<$Res> get content {
    return $OpenAIContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpenAIInputImplCopyWith<$Res>
    implements $OpenAIInputCopyWith<$Res> {
  factory _$$OpenAIInputImplCopyWith(
    _$OpenAIInputImpl value,
    $Res Function(_$OpenAIInputImpl) then,
  ) = __$$OpenAIInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, @_OpenAIContentConverter() OpenAIContent content});

  @override
  $OpenAIContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$OpenAIInputImplCopyWithImpl<$Res>
    extends _$OpenAIInputCopyWithImpl<$Res, _$OpenAIInputImpl>
    implements _$$OpenAIInputImplCopyWith<$Res> {
  __$$OpenAIInputImplCopyWithImpl(
    _$OpenAIInputImpl _value,
    $Res Function(_$OpenAIInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? role = null, Object? content = null}) {
    return _then(
      _$OpenAIInputImpl(
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as OpenAIContent,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _$OpenAIInputImpl implements _OpenAIInput {
  const _$OpenAIInputImpl({
    required this.role,
    @_OpenAIContentConverter() required this.content,
  });

  factory _$OpenAIInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIInputImplFromJson(json);

  @override
  final String role;
  @override
  @_OpenAIContentConverter()
  final OpenAIContent content;

  @override
  String toString() {
    return 'OpenAIInput(role: $role, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIInputImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  /// Create a copy of OpenAIInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIInputImplCopyWith<_$OpenAIInputImpl> get copyWith =>
      __$$OpenAIInputImplCopyWithImpl<_$OpenAIInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIInputImplToJson(this);
  }
}

abstract class _OpenAIInput implements OpenAIInput {
  const factory _OpenAIInput({
    required final String role,
    @_OpenAIContentConverter() required final OpenAIContent content,
  }) = _$OpenAIInputImpl;

  factory _OpenAIInput.fromJson(Map<String, dynamic> json) =
      _$OpenAIInputImpl.fromJson;

  @override
  String get role;
  @override
  @_OpenAIContentConverter()
  OpenAIContent get content;

  /// Create a copy of OpenAIInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIInputImplCopyWith<_$OpenAIInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIContent _$OpenAIContentFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'text':
      return _OpenAIContentText.fromJson(json);
    case 'items':
      return _OpenAIContentItems.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'OpenAIContent',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$OpenAIContent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(List<OpenAIContentItem> items) items,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(List<OpenAIContentItem> items)? items,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(List<OpenAIContentItem> items)? items,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OpenAIContentText value) text,
    required TResult Function(_OpenAIContentItems value) items,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OpenAIContentText value)? text,
    TResult? Function(_OpenAIContentItems value)? items,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OpenAIContentText value)? text,
    TResult Function(_OpenAIContentItems value)? items,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this OpenAIContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIContentCopyWith<$Res> {
  factory $OpenAIContentCopyWith(
    OpenAIContent value,
    $Res Function(OpenAIContent) then,
  ) = _$OpenAIContentCopyWithImpl<$Res, OpenAIContent>;
}

/// @nodoc
class _$OpenAIContentCopyWithImpl<$Res, $Val extends OpenAIContent>
    implements $OpenAIContentCopyWith<$Res> {
  _$OpenAIContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIContent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OpenAIContentTextImplCopyWith<$Res> {
  factory _$$OpenAIContentTextImplCopyWith(
    _$OpenAIContentTextImpl value,
    $Res Function(_$OpenAIContentTextImpl) then,
  ) = __$$OpenAIContentTextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$OpenAIContentTextImplCopyWithImpl<$Res>
    extends _$OpenAIContentCopyWithImpl<$Res, _$OpenAIContentTextImpl>
    implements _$$OpenAIContentTextImplCopyWith<$Res> {
  __$$OpenAIContentTextImplCopyWithImpl(
    _$OpenAIContentTextImpl _value,
    $Res Function(_$OpenAIContentTextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null}) {
    return _then(
      _$OpenAIContentTextImpl(
        null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _$OpenAIContentTextImpl implements _OpenAIContentText {
  const _$OpenAIContentTextImpl(this.text, {final String? $type})
    : $type = $type ?? 'text';

  factory _$OpenAIContentTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIContentTextImplFromJson(json);

  @override
  final String text;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OpenAIContent.text(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIContentTextImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of OpenAIContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIContentTextImplCopyWith<_$OpenAIContentTextImpl> get copyWith =>
      __$$OpenAIContentTextImplCopyWithImpl<_$OpenAIContentTextImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(List<OpenAIContentItem> items) items,
  }) {
    return text(this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(List<OpenAIContentItem> items)? items,
  }) {
    return text?.call(this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(List<OpenAIContentItem> items)? items,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OpenAIContentText value) text,
    required TResult Function(_OpenAIContentItems value) items,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OpenAIContentText value)? text,
    TResult? Function(_OpenAIContentItems value)? items,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OpenAIContentText value)? text,
    TResult Function(_OpenAIContentItems value)? items,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIContentTextImplToJson(this);
  }
}

abstract class _OpenAIContentText implements OpenAIContent {
  const factory _OpenAIContentText(final String text) = _$OpenAIContentTextImpl;

  factory _OpenAIContentText.fromJson(Map<String, dynamic> json) =
      _$OpenAIContentTextImpl.fromJson;

  String get text;

  /// Create a copy of OpenAIContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIContentTextImplCopyWith<_$OpenAIContentTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OpenAIContentItemsImplCopyWith<$Res> {
  factory _$$OpenAIContentItemsImplCopyWith(
    _$OpenAIContentItemsImpl value,
    $Res Function(_$OpenAIContentItemsImpl) then,
  ) = __$$OpenAIContentItemsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OpenAIContentItem> items});
}

/// @nodoc
class __$$OpenAIContentItemsImplCopyWithImpl<$Res>
    extends _$OpenAIContentCopyWithImpl<$Res, _$OpenAIContentItemsImpl>
    implements _$$OpenAIContentItemsImplCopyWith<$Res> {
  __$$OpenAIContentItemsImplCopyWithImpl(
    _$OpenAIContentItemsImpl _value,
    $Res Function(_$OpenAIContentItemsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$OpenAIContentItemsImpl(
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<OpenAIContentItem>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _$OpenAIContentItemsImpl implements _OpenAIContentItems {
  const _$OpenAIContentItemsImpl(
    final List<OpenAIContentItem> items, {
    final String? $type,
  }) : _items = items,
       $type = $type ?? 'items';

  factory _$OpenAIContentItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIContentItemsImplFromJson(json);

  final List<OpenAIContentItem> _items;
  @override
  List<OpenAIContentItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OpenAIContent.items(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIContentItemsImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of OpenAIContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIContentItemsImplCopyWith<_$OpenAIContentItemsImpl> get copyWith =>
      __$$OpenAIContentItemsImplCopyWithImpl<_$OpenAIContentItemsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(List<OpenAIContentItem> items) items,
  }) {
    return items(this.items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(List<OpenAIContentItem> items)? items,
  }) {
    return items?.call(this.items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(List<OpenAIContentItem> items)? items,
    required TResult orElse(),
  }) {
    if (items != null) {
      return items(this.items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OpenAIContentText value) text,
    required TResult Function(_OpenAIContentItems value) items,
  }) {
    return items(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OpenAIContentText value)? text,
    TResult? Function(_OpenAIContentItems value)? items,
  }) {
    return items?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OpenAIContentText value)? text,
    TResult Function(_OpenAIContentItems value)? items,
    required TResult orElse(),
  }) {
    if (items != null) {
      return items(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIContentItemsImplToJson(this);
  }
}

abstract class _OpenAIContentItems implements OpenAIContent {
  const factory _OpenAIContentItems(final List<OpenAIContentItem> items) =
      _$OpenAIContentItemsImpl;

  factory _OpenAIContentItems.fromJson(Map<String, dynamic> json) =
      _$OpenAIContentItemsImpl.fromJson;

  List<OpenAIContentItem> get items;

  /// Create a copy of OpenAIContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIContentItemsImplCopyWith<_$OpenAIContentItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIContentItem _$OpenAIContentItemFromJson(Map<String, dynamic> json) {
  return _OpenAIContentItem.fromJson(json);
}

/// @nodoc
mixin _$OpenAIContentItem {
  String get type => throw _privateConstructorUsedError;
  String? get fileId => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;

  /// Serializes this OpenAIContentItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIContentItemCopyWith<OpenAIContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIContentItemCopyWith<$Res> {
  factory $OpenAIContentItemCopyWith(
    OpenAIContentItem value,
    $Res Function(OpenAIContentItem) then,
  ) = _$OpenAIContentItemCopyWithImpl<$Res, OpenAIContentItem>;
  @useResult
  $Res call({String type, String? fileId, String? text});
}

/// @nodoc
class _$OpenAIContentItemCopyWithImpl<$Res, $Val extends OpenAIContentItem>
    implements $OpenAIContentItemCopyWith<$Res> {
  _$OpenAIContentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIContentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? fileId = freezed,
    Object? text = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            fileId: freezed == fileId
                ? _value.fileId
                : fileId // ignore: cast_nullable_to_non_nullable
                      as String?,
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenAIContentItemImplCopyWith<$Res>
    implements $OpenAIContentItemCopyWith<$Res> {
  factory _$$OpenAIContentItemImplCopyWith(
    _$OpenAIContentItemImpl value,
    $Res Function(_$OpenAIContentItemImpl) then,
  ) = __$$OpenAIContentItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String? fileId, String? text});
}

/// @nodoc
class __$$OpenAIContentItemImplCopyWithImpl<$Res>
    extends _$OpenAIContentItemCopyWithImpl<$Res, _$OpenAIContentItemImpl>
    implements _$$OpenAIContentItemImplCopyWith<$Res> {
  __$$OpenAIContentItemImplCopyWithImpl(
    _$OpenAIContentItemImpl _value,
    $Res Function(_$OpenAIContentItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIContentItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? fileId = freezed,
    Object? text = freezed,
  }) {
    return _then(
      _$OpenAIContentItemImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        fileId: freezed == fileId
            ? _value.fileId
            : fileId // ignore: cast_nullable_to_non_nullable
                  as String?,
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class _$OpenAIContentItemImpl implements _OpenAIContentItem {
  const _$OpenAIContentItemImpl({required this.type, this.fileId, this.text});

  factory _$OpenAIContentItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIContentItemImplFromJson(json);

  @override
  final String type;
  @override
  final String? fileId;
  @override
  final String? text;

  @override
  String toString() {
    return 'OpenAIContentItem(type: $type, fileId: $fileId, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIContentItemImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, fileId, text);

  /// Create a copy of OpenAIContentItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIContentItemImplCopyWith<_$OpenAIContentItemImpl> get copyWith =>
      __$$OpenAIContentItemImplCopyWithImpl<_$OpenAIContentItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIContentItemImplToJson(this);
  }
}

abstract class _OpenAIContentItem implements OpenAIContentItem {
  const factory _OpenAIContentItem({
    required final String type,
    final String? fileId,
    final String? text,
  }) = _$OpenAIContentItemImpl;

  factory _OpenAIContentItem.fromJson(Map<String, dynamic> json) =
      _$OpenAIContentItemImpl.fromJson;

  @override
  String get type;
  @override
  String? get fileId;
  @override
  String? get text;

  /// Create a copy of OpenAIContentItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIContentItemImplCopyWith<_$OpenAIContentItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
