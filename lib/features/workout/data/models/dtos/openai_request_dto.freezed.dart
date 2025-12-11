// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openai_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpenAIRequestDto _$OpenAIRequestDtoFromJson(Map<String, dynamic> json) {
  return _OpenAIRequestDto.fromJson(json);
}

/// @nodoc
mixin _$OpenAIRequestDto {
  @JsonKey(name: 'model')
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'messages')
  List<OpenAIMessageDto> get messages => throw _privateConstructorUsedError;
  @JsonKey(name: 'temperature')
  double get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'response_format')
  OpenAIResponseFormatDto? get responseFormat =>
      throw _privateConstructorUsedError;

  /// Serializes this OpenAIRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIRequestDtoCopyWith<OpenAIRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIRequestDtoCopyWith<$Res> {
  factory $OpenAIRequestDtoCopyWith(
    OpenAIRequestDto value,
    $Res Function(OpenAIRequestDto) then,
  ) = _$OpenAIRequestDtoCopyWithImpl<$Res, OpenAIRequestDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'model') String model,
    @JsonKey(name: 'messages') List<OpenAIMessageDto> messages,
    @JsonKey(name: 'temperature') double temperature,
    @JsonKey(name: 'response_format') OpenAIResponseFormatDto? responseFormat,
  });

  $OpenAIResponseFormatDtoCopyWith<$Res>? get responseFormat;
}

/// @nodoc
class _$OpenAIRequestDtoCopyWithImpl<$Res, $Val extends OpenAIRequestDto>
    implements $OpenAIRequestDtoCopyWith<$Res> {
  _$OpenAIRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? temperature = null,
    Object? responseFormat = freezed,
  }) {
    return _then(
      _value.copyWith(
            model: null == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as String,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<OpenAIMessageDto>,
            temperature: null == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as double,
            responseFormat: freezed == responseFormat
                ? _value.responseFormat
                : responseFormat // ignore: cast_nullable_to_non_nullable
                      as OpenAIResponseFormatDto?,
          )
          as $Val,
    );
  }

  /// Create a copy of OpenAIRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OpenAIResponseFormatDtoCopyWith<$Res>? get responseFormat {
    if (_value.responseFormat == null) {
      return null;
    }

    return $OpenAIResponseFormatDtoCopyWith<$Res>(_value.responseFormat!, (
      value,
    ) {
      return _then(_value.copyWith(responseFormat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpenAIRequestDtoImplCopyWith<$Res>
    implements $OpenAIRequestDtoCopyWith<$Res> {
  factory _$$OpenAIRequestDtoImplCopyWith(
    _$OpenAIRequestDtoImpl value,
    $Res Function(_$OpenAIRequestDtoImpl) then,
  ) = __$$OpenAIRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'model') String model,
    @JsonKey(name: 'messages') List<OpenAIMessageDto> messages,
    @JsonKey(name: 'temperature') double temperature,
    @JsonKey(name: 'response_format') OpenAIResponseFormatDto? responseFormat,
  });

  @override
  $OpenAIResponseFormatDtoCopyWith<$Res>? get responseFormat;
}

/// @nodoc
class __$$OpenAIRequestDtoImplCopyWithImpl<$Res>
    extends _$OpenAIRequestDtoCopyWithImpl<$Res, _$OpenAIRequestDtoImpl>
    implements _$$OpenAIRequestDtoImplCopyWith<$Res> {
  __$$OpenAIRequestDtoImplCopyWithImpl(
    _$OpenAIRequestDtoImpl _value,
    $Res Function(_$OpenAIRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? temperature = null,
    Object? responseFormat = freezed,
  }) {
    return _then(
      _$OpenAIRequestDtoImpl(
        model: null == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<OpenAIMessageDto>,
        temperature: null == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as double,
        responseFormat: freezed == responseFormat
            ? _value.responseFormat
            : responseFormat // ignore: cast_nullable_to_non_nullable
                  as OpenAIResponseFormatDto?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAIRequestDtoImpl implements _OpenAIRequestDto {
  const _$OpenAIRequestDtoImpl({
    @JsonKey(name: 'model') required this.model,
    @JsonKey(name: 'messages') required final List<OpenAIMessageDto> messages,
    @JsonKey(name: 'temperature') this.temperature = 0.7,
    @JsonKey(name: 'response_format') this.responseFormat = null,
  }) : _messages = messages;

  factory _$OpenAIRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIRequestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'model')
  final String model;
  final List<OpenAIMessageDto> _messages;
  @override
  @JsonKey(name: 'messages')
  List<OpenAIMessageDto> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey(name: 'temperature')
  final double temperature;
  @override
  @JsonKey(name: 'response_format')
  final OpenAIResponseFormatDto? responseFormat;

  @override
  String toString() {
    return 'OpenAIRequestDto(model: $model, messages: $messages, temperature: $temperature, responseFormat: $responseFormat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIRequestDtoImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.responseFormat, responseFormat) ||
                other.responseFormat == responseFormat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    model,
    const DeepCollectionEquality().hash(_messages),
    temperature,
    responseFormat,
  );

  /// Create a copy of OpenAIRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIRequestDtoImplCopyWith<_$OpenAIRequestDtoImpl> get copyWith =>
      __$$OpenAIRequestDtoImplCopyWithImpl<_$OpenAIRequestDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIRequestDtoImplToJson(this);
  }
}

abstract class _OpenAIRequestDto implements OpenAIRequestDto {
  const factory _OpenAIRequestDto({
    @JsonKey(name: 'model') required final String model,
    @JsonKey(name: 'messages') required final List<OpenAIMessageDto> messages,
    @JsonKey(name: 'temperature') final double temperature,
    @JsonKey(name: 'response_format')
    final OpenAIResponseFormatDto? responseFormat,
  }) = _$OpenAIRequestDtoImpl;

  factory _OpenAIRequestDto.fromJson(Map<String, dynamic> json) =
      _$OpenAIRequestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'model')
  String get model;
  @override
  @JsonKey(name: 'messages')
  List<OpenAIMessageDto> get messages;
  @override
  @JsonKey(name: 'temperature')
  double get temperature;
  @override
  @JsonKey(name: 'response_format')
  OpenAIResponseFormatDto? get responseFormat;

  /// Create a copy of OpenAIRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIRequestDtoImplCopyWith<_$OpenAIRequestDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIMessageDto _$OpenAIMessageDtoFromJson(Map<String, dynamic> json) {
  return _OpenAIMessageDto.fromJson(json);
}

/// @nodoc
mixin _$OpenAIMessageDto {
  @JsonKey(name: 'role')
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;

  /// Serializes this OpenAIMessageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIMessageDtoCopyWith<OpenAIMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIMessageDtoCopyWith<$Res> {
  factory $OpenAIMessageDtoCopyWith(
    OpenAIMessageDto value,
    $Res Function(OpenAIMessageDto) then,
  ) = _$OpenAIMessageDtoCopyWithImpl<$Res, OpenAIMessageDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'role') String role,
    @JsonKey(name: 'content') String content,
  });
}

/// @nodoc
class _$OpenAIMessageDtoCopyWithImpl<$Res, $Val extends OpenAIMessageDto>
    implements $OpenAIMessageDtoCopyWith<$Res> {
  _$OpenAIMessageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIMessageDto
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
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenAIMessageDtoImplCopyWith<$Res>
    implements $OpenAIMessageDtoCopyWith<$Res> {
  factory _$$OpenAIMessageDtoImplCopyWith(
    _$OpenAIMessageDtoImpl value,
    $Res Function(_$OpenAIMessageDtoImpl) then,
  ) = __$$OpenAIMessageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'role') String role,
    @JsonKey(name: 'content') String content,
  });
}

/// @nodoc
class __$$OpenAIMessageDtoImplCopyWithImpl<$Res>
    extends _$OpenAIMessageDtoCopyWithImpl<$Res, _$OpenAIMessageDtoImpl>
    implements _$$OpenAIMessageDtoImplCopyWith<$Res> {
  __$$OpenAIMessageDtoImplCopyWithImpl(
    _$OpenAIMessageDtoImpl _value,
    $Res Function(_$OpenAIMessageDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? role = null, Object? content = null}) {
    return _then(
      _$OpenAIMessageDtoImpl(
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$OpenAIMessageDtoImpl implements _OpenAIMessageDto {
  const _$OpenAIMessageDtoImpl({
    @JsonKey(name: 'role') required this.role,
    @JsonKey(name: 'content') required this.content,
  });

  factory _$OpenAIMessageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIMessageDtoImplFromJson(json);

  @override
  @JsonKey(name: 'role')
  final String role;
  @override
  @JsonKey(name: 'content')
  final String content;

  @override
  String toString() {
    return 'OpenAIMessageDto(role: $role, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIMessageDtoImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  /// Create a copy of OpenAIMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIMessageDtoImplCopyWith<_$OpenAIMessageDtoImpl> get copyWith =>
      __$$OpenAIMessageDtoImplCopyWithImpl<_$OpenAIMessageDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIMessageDtoImplToJson(this);
  }
}

abstract class _OpenAIMessageDto implements OpenAIMessageDto {
  const factory _OpenAIMessageDto({
    @JsonKey(name: 'role') required final String role,
    @JsonKey(name: 'content') required final String content,
  }) = _$OpenAIMessageDtoImpl;

  factory _OpenAIMessageDto.fromJson(Map<String, dynamic> json) =
      _$OpenAIMessageDtoImpl.fromJson;

  @override
  @JsonKey(name: 'role')
  String get role;
  @override
  @JsonKey(name: 'content')
  String get content;

  /// Create a copy of OpenAIMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIMessageDtoImplCopyWith<_$OpenAIMessageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIResponseFormatDto _$OpenAIResponseFormatDtoFromJson(
  Map<String, dynamic> json,
) {
  return _OpenAIResponseFormatDto.fromJson(json);
}

/// @nodoc
mixin _$OpenAIResponseFormatDto {
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;

  /// Serializes this OpenAIResponseFormatDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAIResponseFormatDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAIResponseFormatDtoCopyWith<OpenAIResponseFormatDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIResponseFormatDtoCopyWith<$Res> {
  factory $OpenAIResponseFormatDtoCopyWith(
    OpenAIResponseFormatDto value,
    $Res Function(OpenAIResponseFormatDto) then,
  ) = _$OpenAIResponseFormatDtoCopyWithImpl<$Res, OpenAIResponseFormatDto>;
  @useResult
  $Res call({@JsonKey(name: 'type') String type});
}

/// @nodoc
class _$OpenAIResponseFormatDtoCopyWithImpl<
  $Res,
  $Val extends OpenAIResponseFormatDto
>
    implements $OpenAIResponseFormatDtoCopyWith<$Res> {
  _$OpenAIResponseFormatDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAIResponseFormatDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null}) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenAIResponseFormatDtoImplCopyWith<$Res>
    implements $OpenAIResponseFormatDtoCopyWith<$Res> {
  factory _$$OpenAIResponseFormatDtoImplCopyWith(
    _$OpenAIResponseFormatDtoImpl value,
    $Res Function(_$OpenAIResponseFormatDtoImpl) then,
  ) = __$$OpenAIResponseFormatDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'type') String type});
}

/// @nodoc
class __$$OpenAIResponseFormatDtoImplCopyWithImpl<$Res>
    extends
        _$OpenAIResponseFormatDtoCopyWithImpl<
          $Res,
          _$OpenAIResponseFormatDtoImpl
        >
    implements _$$OpenAIResponseFormatDtoImplCopyWith<$Res> {
  __$$OpenAIResponseFormatDtoImplCopyWithImpl(
    _$OpenAIResponseFormatDtoImpl _value,
    $Res Function(_$OpenAIResponseFormatDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAIResponseFormatDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null}) {
    return _then(
      _$OpenAIResponseFormatDtoImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAIResponseFormatDtoImpl implements _OpenAIResponseFormatDto {
  const _$OpenAIResponseFormatDtoImpl({
    @JsonKey(name: 'type') this.type = 'json_object',
  });

  factory _$OpenAIResponseFormatDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIResponseFormatDtoImplFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String type;

  @override
  String toString() {
    return 'OpenAIResponseFormatDto(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIResponseFormatDtoImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of OpenAIResponseFormatDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIResponseFormatDtoImplCopyWith<_$OpenAIResponseFormatDtoImpl>
  get copyWith =>
      __$$OpenAIResponseFormatDtoImplCopyWithImpl<
        _$OpenAIResponseFormatDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIResponseFormatDtoImplToJson(this);
  }
}

abstract class _OpenAIResponseFormatDto implements OpenAIResponseFormatDto {
  const factory _OpenAIResponseFormatDto({
    @JsonKey(name: 'type') final String type,
  }) = _$OpenAIResponseFormatDtoImpl;

  factory _OpenAIResponseFormatDto.fromJson(Map<String, dynamic> json) =
      _$OpenAIResponseFormatDtoImpl.fromJson;

  @override
  @JsonKey(name: 'type')
  String get type;

  /// Create a copy of OpenAIResponseFormatDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAIResponseFormatDtoImplCopyWith<_$OpenAIResponseFormatDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
