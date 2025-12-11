// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openai_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpenAIResponseDto _$OpenAIResponseDtoFromJson(Map<String, dynamic> json) {
  return _OpenAIResponseDto.fromJson(json);
}

/// @nodoc
mixin _$OpenAIResponseDto {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'choices')
  List<OpenAIChoiceDto> get choices => throw _privateConstructorUsedError;

  /// Serializes this OpenAIResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIResponseDtoCopyWith<OpenAIResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIResponseDtoCopyWith<$Res> {
  factory $OpenAIResponseDtoCopyWith(
    OpenAIResponseDto value,
    $Res Function(OpenAIResponseDto) then,
  ) = _$OpenAIResponseDtoCopyWithImpl<$Res, OpenAIResponseDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'choices') List<OpenAIChoiceDto> choices,
  });
}

/// @nodoc
class _$OpenAIResponseDtoCopyWithImpl<$Res, $Val extends OpenAIResponseDto>
    implements $OpenAIResponseDtoCopyWith<$Res> {
  _$OpenAIResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? choices = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            choices: null == choices
                ? _value.choices
                : choices // ignore: cast_nullable_to_non_nullable
                      as List<OpenAIChoiceDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenAIResponseDtoImplCopyWith<$Res>
    implements $OpenAIResponseDtoCopyWith<$Res> {
  factory _$$OpenAIResponseDtoImplCopyWith(
    _$OpenAIResponseDtoImpl value,
    $Res Function(_$OpenAIResponseDtoImpl) then,
  ) = __$$OpenAIResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'choices') List<OpenAIChoiceDto> choices,
  });
}

/// @nodoc
class __$$OpenAIResponseDtoImplCopyWithImpl<$Res>
    extends _$OpenAIResponseDtoCopyWithImpl<$Res, _$OpenAIResponseDtoImpl>
    implements _$$OpenAIResponseDtoImplCopyWith<$Res> {
  __$$OpenAIResponseDtoImplCopyWithImpl(
    _$OpenAIResponseDtoImpl _value,
    $Res Function(_$OpenAIResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? choices = null}) {
    return _then(
      _$OpenAIResponseDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        choices: null == choices
            ? _value._choices
            : choices // ignore: cast_nullable_to_non_nullable
                  as List<OpenAIChoiceDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAIResponseDtoImpl implements _OpenAIResponseDto {
  const _$OpenAIResponseDtoImpl({
    @JsonKey(name: 'id') required this.id,
    @JsonKey(name: 'choices') required final List<OpenAIChoiceDto> choices,
  }) : _choices = choices;

  factory _$OpenAIResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIResponseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  final List<OpenAIChoiceDto> _choices;
  @override
  @JsonKey(name: 'choices')
  List<OpenAIChoiceDto> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  String toString() {
    return 'OpenAIResponseDto(id: $id, choices: $choices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_choices),
  );

  /// Create a copy of OpenAIResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIResponseDtoImplCopyWith<_$OpenAIResponseDtoImpl> get copyWith =>
      __$$OpenAIResponseDtoImplCopyWithImpl<_$OpenAIResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIResponseDtoImplToJson(this);
  }
}

abstract class _OpenAIResponseDto implements OpenAIResponseDto {
  const factory _OpenAIResponseDto({
    @JsonKey(name: 'id') required final String id,
    @JsonKey(name: 'choices') required final List<OpenAIChoiceDto> choices,
  }) = _$OpenAIResponseDtoImpl;

  factory _OpenAIResponseDto.fromJson(Map<String, dynamic> json) =
      _$OpenAIResponseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'choices')
  List<OpenAIChoiceDto> get choices;

  /// Create a copy of OpenAIResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIResponseDtoImplCopyWith<_$OpenAIResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIChoiceDto _$OpenAIChoiceDtoFromJson(Map<String, dynamic> json) {
  return _OpenAIChoiceDto.fromJson(json);
}

/// @nodoc
mixin _$OpenAIChoiceDto {
  @JsonKey(name: 'message')
  OpenAIMessageResponseDto get message => throw _privateConstructorUsedError;

  /// Serializes this OpenAIChoiceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIChoiceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIChoiceDtoCopyWith<OpenAIChoiceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIChoiceDtoCopyWith<$Res> {
  factory $OpenAIChoiceDtoCopyWith(
    OpenAIChoiceDto value,
    $Res Function(OpenAIChoiceDto) then,
  ) = _$OpenAIChoiceDtoCopyWithImpl<$Res, OpenAIChoiceDto>;
  @useResult
  $Res call({@JsonKey(name: 'message') OpenAIMessageResponseDto message});

  $OpenAIMessageResponseDtoCopyWith<$Res> get message;
}

/// @nodoc
class _$OpenAIChoiceDtoCopyWithImpl<$Res, $Val extends OpenAIChoiceDto>
    implements $OpenAIChoiceDtoCopyWith<$Res> {
  _$OpenAIChoiceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIChoiceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as OpenAIMessageResponseDto,
          )
          as $Val,
    );
  }

  /// Create a copy of OpenAIChoiceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OpenAIMessageResponseDtoCopyWith<$Res> get message {
    return $OpenAIMessageResponseDtoCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpenAIChoiceDtoImplCopyWith<$Res>
    implements $OpenAIChoiceDtoCopyWith<$Res> {
  factory _$$OpenAIChoiceDtoImplCopyWith(
    _$OpenAIChoiceDtoImpl value,
    $Res Function(_$OpenAIChoiceDtoImpl) then,
  ) = __$$OpenAIChoiceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'message') OpenAIMessageResponseDto message});

  @override
  $OpenAIMessageResponseDtoCopyWith<$Res> get message;
}

/// @nodoc
class __$$OpenAIChoiceDtoImplCopyWithImpl<$Res>
    extends _$OpenAIChoiceDtoCopyWithImpl<$Res, _$OpenAIChoiceDtoImpl>
    implements _$$OpenAIChoiceDtoImplCopyWith<$Res> {
  __$$OpenAIChoiceDtoImplCopyWithImpl(
    _$OpenAIChoiceDtoImpl _value,
    $Res Function(_$OpenAIChoiceDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIChoiceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$OpenAIChoiceDtoImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as OpenAIMessageResponseDto,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAIChoiceDtoImpl implements _OpenAIChoiceDto {
  const _$OpenAIChoiceDtoImpl({
    @JsonKey(name: 'message') required this.message,
  });

  factory _$OpenAIChoiceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIChoiceDtoImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final OpenAIMessageResponseDto message;

  @override
  String toString() {
    return 'OpenAIChoiceDto(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIChoiceDtoImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of OpenAIChoiceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIChoiceDtoImplCopyWith<_$OpenAIChoiceDtoImpl> get copyWith =>
      __$$OpenAIChoiceDtoImplCopyWithImpl<_$OpenAIChoiceDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIChoiceDtoImplToJson(this);
  }
}

abstract class _OpenAIChoiceDto implements OpenAIChoiceDto {
  const factory _OpenAIChoiceDto({
    @JsonKey(name: 'message') required final OpenAIMessageResponseDto message,
  }) = _$OpenAIChoiceDtoImpl;

  factory _OpenAIChoiceDto.fromJson(Map<String, dynamic> json) =
      _$OpenAIChoiceDtoImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  OpenAIMessageResponseDto get message;

  /// Create a copy of OpenAIChoiceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIChoiceDtoImplCopyWith<_$OpenAIChoiceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIMessageResponseDto _$OpenAIMessageResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _OpenAIMessageResponseDto.fromJson(json);
}

/// @nodoc
mixin _$OpenAIMessageResponseDto {
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;

  /// Serializes this OpenAIMessageResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIMessageResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIMessageResponseDtoCopyWith<OpenAIMessageResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIMessageResponseDtoCopyWith<$Res> {
  factory $OpenAIMessageResponseDtoCopyWith(
    OpenAIMessageResponseDto value,
    $Res Function(OpenAIMessageResponseDto) then,
  ) = _$OpenAIMessageResponseDtoCopyWithImpl<$Res, OpenAIMessageResponseDto>;
  @useResult
  $Res call({@JsonKey(name: 'content') String content});
}

/// @nodoc
class _$OpenAIMessageResponseDtoCopyWithImpl<
  $Res,
  $Val extends OpenAIMessageResponseDto
>
    implements $OpenAIMessageResponseDtoCopyWith<$Res> {
  _$OpenAIMessageResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIMessageResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null}) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenAIMessageResponseDtoImplCopyWith<$Res>
    implements $OpenAIMessageResponseDtoCopyWith<$Res> {
  factory _$$OpenAIMessageResponseDtoImplCopyWith(
    _$OpenAIMessageResponseDtoImpl value,
    $Res Function(_$OpenAIMessageResponseDtoImpl) then,
  ) = __$$OpenAIMessageResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'content') String content});
}

/// @nodoc
class __$$OpenAIMessageResponseDtoImplCopyWithImpl<$Res>
    extends
        _$OpenAIMessageResponseDtoCopyWithImpl<
          $Res,
          _$OpenAIMessageResponseDtoImpl
        >
    implements _$$OpenAIMessageResponseDtoImplCopyWith<$Res> {
  __$$OpenAIMessageResponseDtoImplCopyWithImpl(
    _$OpenAIMessageResponseDtoImpl _value,
    $Res Function(_$OpenAIMessageResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIMessageResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null}) {
    return _then(
      _$OpenAIMessageResponseDtoImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAIMessageResponseDtoImpl implements _OpenAIMessageResponseDto {
  const _$OpenAIMessageResponseDtoImpl({
    @JsonKey(name: 'content') required this.content,
  });

  factory _$OpenAIMessageResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIMessageResponseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'content')
  final String content;

  @override
  String toString() {
    return 'OpenAIMessageResponseDto(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIMessageResponseDtoImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of OpenAIMessageResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIMessageResponseDtoImplCopyWith<_$OpenAIMessageResponseDtoImpl>
  get copyWith =>
      __$$OpenAIMessageResponseDtoImplCopyWithImpl<
        _$OpenAIMessageResponseDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIMessageResponseDtoImplToJson(this);
  }
}

abstract class _OpenAIMessageResponseDto implements OpenAIMessageResponseDto {
  const factory _OpenAIMessageResponseDto({
    @JsonKey(name: 'content') required final String content,
  }) = _$OpenAIMessageResponseDtoImpl;

  factory _OpenAIMessageResponseDto.fromJson(Map<String, dynamic> json) =
      _$OpenAIMessageResponseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'content')
  String get content;

  /// Create a copy of OpenAIMessageResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIMessageResponseDtoImplCopyWith<_$OpenAIMessageResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
