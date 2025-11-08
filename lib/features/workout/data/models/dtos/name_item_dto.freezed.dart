// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NameItemDto _$NameItemDtoFromJson(Map<String, dynamic> json) {
  return _NameItemDto.fromJson(json);
}

/// @nodoc
mixin _$NameItemDto {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this NameItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NameItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NameItemDtoCopyWith<NameItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameItemDtoCopyWith<$Res> {
  factory $NameItemDtoCopyWith(
    NameItemDto value,
    $Res Function(NameItemDto) then,
  ) = _$NameItemDtoCopyWithImpl<$Res, NameItemDto>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$NameItemDtoCopyWithImpl<$Res, $Val extends NameItemDto>
    implements $NameItemDtoCopyWith<$Res> {
  _$NameItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NameItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NameItemDtoImplCopyWith<$Res>
    implements $NameItemDtoCopyWith<$Res> {
  factory _$$NameItemDtoImplCopyWith(
    _$NameItemDtoImpl value,
    $Res Function(_$NameItemDtoImpl) then,
  ) = __$$NameItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$NameItemDtoImplCopyWithImpl<$Res>
    extends _$NameItemDtoCopyWithImpl<$Res, _$NameItemDtoImpl>
    implements _$$NameItemDtoImplCopyWith<$Res> {
  __$$NameItemDtoImplCopyWithImpl(
    _$NameItemDtoImpl _value,
    $Res Function(_$NameItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NameItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _$NameItemDtoImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NameItemDtoImpl implements _NameItemDto {
  const _$NameItemDtoImpl({required this.name});

  factory _$NameItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NameItemDtoImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'NameItemDto(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameItemDtoImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of NameItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NameItemDtoImplCopyWith<_$NameItemDtoImpl> get copyWith =>
      __$$NameItemDtoImplCopyWithImpl<_$NameItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NameItemDtoImplToJson(this);
  }
}

abstract class _NameItemDto implements NameItemDto {
  const factory _NameItemDto({required final String name}) = _$NameItemDtoImpl;

  factory _NameItemDto.fromJson(Map<String, dynamic> json) =
      _$NameItemDtoImpl.fromJson;

  @override
  String get name;

  /// Create a copy of NameItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NameItemDtoImplCopyWith<_$NameItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
