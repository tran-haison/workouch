// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_filter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExerciseFilterRequest _$ExerciseFilterRequestFromJson(
  Map<String, dynamic> json,
) {
  return _ExerciseFilterRequest.fromJson(json);
}

/// @nodoc
mixin _$ExerciseFilterRequest {
  String? get search => throw _privateConstructorUsedError;
  String? get equipments =>
      throw _privateConstructorUsedError; // Comma separated list of equipments
  String? get bodyParts => throw _privateConstructorUsedError;

  /// Serializes this ExerciseFilterRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseFilterRequestCopyWith<ExerciseFilterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseFilterRequestCopyWith<$Res> {
  factory $ExerciseFilterRequestCopyWith(
    ExerciseFilterRequest value,
    $Res Function(ExerciseFilterRequest) then,
  ) = _$ExerciseFilterRequestCopyWithImpl<$Res, ExerciseFilterRequest>;
  @useResult
  $Res call({String? search, String? equipments, String? bodyParts});
}

/// @nodoc
class _$ExerciseFilterRequestCopyWithImpl<
  $Res,
  $Val extends ExerciseFilterRequest
>
    implements $ExerciseFilterRequestCopyWith<$Res> {
  _$ExerciseFilterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? equipments = freezed,
    Object? bodyParts = freezed,
  }) {
    return _then(
      _value.copyWith(
            search: freezed == search
                ? _value.search
                : search // ignore: cast_nullable_to_non_nullable
                      as String?,
            equipments: freezed == equipments
                ? _value.equipments
                : equipments // ignore: cast_nullable_to_non_nullable
                      as String?,
            bodyParts: freezed == bodyParts
                ? _value.bodyParts
                : bodyParts // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseFilterRequestImplCopyWith<$Res>
    implements $ExerciseFilterRequestCopyWith<$Res> {
  factory _$$ExerciseFilterRequestImplCopyWith(
    _$ExerciseFilterRequestImpl value,
    $Res Function(_$ExerciseFilterRequestImpl) then,
  ) = __$$ExerciseFilterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? search, String? equipments, String? bodyParts});
}

/// @nodoc
class __$$ExerciseFilterRequestImplCopyWithImpl<$Res>
    extends
        _$ExerciseFilterRequestCopyWithImpl<$Res, _$ExerciseFilterRequestImpl>
    implements _$$ExerciseFilterRequestImplCopyWith<$Res> {
  __$$ExerciseFilterRequestImplCopyWithImpl(
    _$ExerciseFilterRequestImpl _value,
    $Res Function(_$ExerciseFilterRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? equipments = freezed,
    Object? bodyParts = freezed,
  }) {
    return _then(
      _$ExerciseFilterRequestImpl(
        search: freezed == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String?,
        equipments: freezed == equipments
            ? _value.equipments
            : equipments // ignore: cast_nullable_to_non_nullable
                  as String?,
        bodyParts: freezed == bodyParts
            ? _value.bodyParts
            : bodyParts // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseFilterRequestImpl implements _ExerciseFilterRequest {
  const _$ExerciseFilterRequestImpl({
    this.search,
    this.equipments,
    this.bodyParts,
  });

  factory _$ExerciseFilterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseFilterRequestImplFromJson(json);

  @override
  final String? search;
  @override
  final String? equipments;
  // Comma separated list of equipments
  @override
  final String? bodyParts;

  @override
  String toString() {
    return 'ExerciseFilterRequest(search: $search, equipments: $equipments, bodyParts: $bodyParts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseFilterRequestImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.equipments, equipments) ||
                other.equipments == equipments) &&
            (identical(other.bodyParts, bodyParts) ||
                other.bodyParts == bodyParts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, search, equipments, bodyParts);

  /// Create a copy of ExerciseFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseFilterRequestImplCopyWith<_$ExerciseFilterRequestImpl>
  get copyWith =>
      __$$ExerciseFilterRequestImplCopyWithImpl<_$ExerciseFilterRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseFilterRequestImplToJson(this);
  }
}

abstract class _ExerciseFilterRequest implements ExerciseFilterRequest {
  const factory _ExerciseFilterRequest({
    final String? search,
    final String? equipments,
    final String? bodyParts,
  }) = _$ExerciseFilterRequestImpl;

  factory _ExerciseFilterRequest.fromJson(Map<String, dynamic> json) =
      _$ExerciseFilterRequestImpl.fromJson;

  @override
  String? get search;
  @override
  String? get equipments; // Comma separated list of equipments
  @override
  String? get bodyParts;

  /// Create a copy of ExerciseFilterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseFilterRequestImplCopyWith<_$ExerciseFilterRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
