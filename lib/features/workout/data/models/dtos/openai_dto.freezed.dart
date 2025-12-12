// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openai_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpenAIDto _$OpenAIDtoFromJson(Map<String, dynamic> json) {
  return _OpenAIDto.fromJson(json);
}

/// @nodoc
mixin _$OpenAIDto {
  List<OpenAIOutputDto> get output => throw _privateConstructorUsedError;

  /// Serializes this OpenAIDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIDtoCopyWith<OpenAIDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIDtoCopyWith<$Res> {
  factory $OpenAIDtoCopyWith(OpenAIDto value, $Res Function(OpenAIDto) then) =
      _$OpenAIDtoCopyWithImpl<$Res, OpenAIDto>;
  @useResult
  $Res call({List<OpenAIOutputDto> output});
}

/// @nodoc
class _$OpenAIDtoCopyWithImpl<$Res, $Val extends OpenAIDto>
    implements $OpenAIDtoCopyWith<$Res> {
  _$OpenAIDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? output = null}) {
    return _then(
      _value.copyWith(
            output: null == output
                ? _value.output
                : output // ignore: cast_nullable_to_non_nullable
                      as List<OpenAIOutputDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenAIDtoImplCopyWith<$Res>
    implements $OpenAIDtoCopyWith<$Res> {
  factory _$$OpenAIDtoImplCopyWith(
    _$OpenAIDtoImpl value,
    $Res Function(_$OpenAIDtoImpl) then,
  ) = __$$OpenAIDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OpenAIOutputDto> output});
}

/// @nodoc
class __$$OpenAIDtoImplCopyWithImpl<$Res>
    extends _$OpenAIDtoCopyWithImpl<$Res, _$OpenAIDtoImpl>
    implements _$$OpenAIDtoImplCopyWith<$Res> {
  __$$OpenAIDtoImplCopyWithImpl(
    _$OpenAIDtoImpl _value,
    $Res Function(_$OpenAIDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? output = null}) {
    return _then(
      _$OpenAIDtoImpl(
        output: null == output
            ? _value._output
            : output // ignore: cast_nullable_to_non_nullable
                  as List<OpenAIOutputDto>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OpenAIDtoImpl implements _OpenAIDto {
  const _$OpenAIDtoImpl({required final List<OpenAIOutputDto> output})
    : _output = output;

  factory _$OpenAIDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIDtoImplFromJson(json);

  final List<OpenAIOutputDto> _output;
  @override
  List<OpenAIOutputDto> get output {
    if (_output is EqualUnmodifiableListView) return _output;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_output);
  }

  @override
  String toString() {
    return 'OpenAIDto(output: $output)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIDtoImpl &&
            const DeepCollectionEquality().equals(other._output, _output));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_output));

  /// Create a copy of OpenAIDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIDtoImplCopyWith<_$OpenAIDtoImpl> get copyWith =>
      __$$OpenAIDtoImplCopyWithImpl<_$OpenAIDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIDtoImplToJson(this);
  }
}

abstract class _OpenAIDto implements OpenAIDto {
  const factory _OpenAIDto({required final List<OpenAIOutputDto> output}) =
      _$OpenAIDtoImpl;

  factory _OpenAIDto.fromJson(Map<String, dynamic> json) =
      _$OpenAIDtoImpl.fromJson;

  @override
  List<OpenAIOutputDto> get output;

  /// Create a copy of OpenAIDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIDtoImplCopyWith<_$OpenAIDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIOutputDto _$OpenAIOutputDtoFromJson(Map<String, dynamic> json) {
  return _OpenAIOutputDto.fromJson(json);
}

/// @nodoc
mixin _$OpenAIOutputDto {
  List<OpenAIContentDto> get content => throw _privateConstructorUsedError;

  /// Serializes this OpenAIOutputDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIOutputDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIOutputDtoCopyWith<OpenAIOutputDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIOutputDtoCopyWith<$Res> {
  factory $OpenAIOutputDtoCopyWith(
    OpenAIOutputDto value,
    $Res Function(OpenAIOutputDto) then,
  ) = _$OpenAIOutputDtoCopyWithImpl<$Res, OpenAIOutputDto>;
  @useResult
  $Res call({List<OpenAIContentDto> content});
}

/// @nodoc
class _$OpenAIOutputDtoCopyWithImpl<$Res, $Val extends OpenAIOutputDto>
    implements $OpenAIOutputDtoCopyWith<$Res> {
  _$OpenAIOutputDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIOutputDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null}) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as List<OpenAIContentDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenAIOutputDtoImplCopyWith<$Res>
    implements $OpenAIOutputDtoCopyWith<$Res> {
  factory _$$OpenAIOutputDtoImplCopyWith(
    _$OpenAIOutputDtoImpl value,
    $Res Function(_$OpenAIOutputDtoImpl) then,
  ) = __$$OpenAIOutputDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OpenAIContentDto> content});
}

/// @nodoc
class __$$OpenAIOutputDtoImplCopyWithImpl<$Res>
    extends _$OpenAIOutputDtoCopyWithImpl<$Res, _$OpenAIOutputDtoImpl>
    implements _$$OpenAIOutputDtoImplCopyWith<$Res> {
  __$$OpenAIOutputDtoImplCopyWithImpl(
    _$OpenAIOutputDtoImpl _value,
    $Res Function(_$OpenAIOutputDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIOutputDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null}) {
    return _then(
      _$OpenAIOutputDtoImpl(
        content: null == content
            ? _value._content
            : content // ignore: cast_nullable_to_non_nullable
                  as List<OpenAIContentDto>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OpenAIOutputDtoImpl implements _OpenAIOutputDto {
  const _$OpenAIOutputDtoImpl({required final List<OpenAIContentDto> content})
    : _content = content;

  factory _$OpenAIOutputDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIOutputDtoImplFromJson(json);

  final List<OpenAIContentDto> _content;
  @override
  List<OpenAIContentDto> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  String toString() {
    return 'OpenAIOutputDto(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIOutputDtoImpl &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_content));

  /// Create a copy of OpenAIOutputDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIOutputDtoImplCopyWith<_$OpenAIOutputDtoImpl> get copyWith =>
      __$$OpenAIOutputDtoImplCopyWithImpl<_$OpenAIOutputDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIOutputDtoImplToJson(this);
  }
}

abstract class _OpenAIOutputDto implements OpenAIOutputDto {
  const factory _OpenAIOutputDto({
    required final List<OpenAIContentDto> content,
  }) = _$OpenAIOutputDtoImpl;

  factory _OpenAIOutputDto.fromJson(Map<String, dynamic> json) =
      _$OpenAIOutputDtoImpl.fromJson;

  @override
  List<OpenAIContentDto> get content;

  /// Create a copy of OpenAIOutputDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIOutputDtoImplCopyWith<_$OpenAIOutputDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIContentDto _$OpenAIContentDtoFromJson(Map<String, dynamic> json) {
  return _OpenAIContentDto.fromJson(json);
}

/// @nodoc
mixin _$OpenAIContentDto {
  String get text => throw _privateConstructorUsedError;

  /// Serializes this OpenAIContentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIContentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIContentDtoCopyWith<OpenAIContentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIContentDtoCopyWith<$Res> {
  factory $OpenAIContentDtoCopyWith(
    OpenAIContentDto value,
    $Res Function(OpenAIContentDto) then,
  ) = _$OpenAIContentDtoCopyWithImpl<$Res, OpenAIContentDto>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$OpenAIContentDtoCopyWithImpl<$Res, $Val extends OpenAIContentDto>
    implements $OpenAIContentDtoCopyWith<$Res> {
  _$OpenAIContentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIContentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null}) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenAIContentDtoImplCopyWith<$Res>
    implements $OpenAIContentDtoCopyWith<$Res> {
  factory _$$OpenAIContentDtoImplCopyWith(
    _$OpenAIContentDtoImpl value,
    $Res Function(_$OpenAIContentDtoImpl) then,
  ) = __$$OpenAIContentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$OpenAIContentDtoImplCopyWithImpl<$Res>
    extends _$OpenAIContentDtoCopyWithImpl<$Res, _$OpenAIContentDtoImpl>
    implements _$$OpenAIContentDtoImplCopyWith<$Res> {
  __$$OpenAIContentDtoImplCopyWithImpl(
    _$OpenAIContentDtoImpl _value,
    $Res Function(_$OpenAIContentDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIContentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null}) {
    return _then(
      _$OpenAIContentDtoImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OpenAIContentDtoImpl implements _OpenAIContentDto {
  const _$OpenAIContentDtoImpl({required this.text});

  factory _$OpenAIContentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIContentDtoImplFromJson(json);

  @override
  final String text;

  @override
  String toString() {
    return 'OpenAIContentDto(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIContentDtoImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of OpenAIContentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIContentDtoImplCopyWith<_$OpenAIContentDtoImpl> get copyWith =>
      __$$OpenAIContentDtoImplCopyWithImpl<_$OpenAIContentDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIContentDtoImplToJson(this);
  }
}

abstract class _OpenAIContentDto implements OpenAIContentDto {
  const factory _OpenAIContentDto({required final String text}) =
      _$OpenAIContentDtoImpl;

  factory _OpenAIContentDto.fromJson(Map<String, dynamic> json) =
      _$OpenAIContentDtoImpl.fromJson;

  @override
  String get text;

  /// Create a copy of OpenAIContentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIContentDtoImplCopyWith<_$OpenAIContentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
