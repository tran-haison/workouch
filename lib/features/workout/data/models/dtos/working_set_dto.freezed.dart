// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'working_set_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkingSetDto _$WorkingSetDtoFromJson(Map<String, dynamic> json) {
  return _WorkingSetDto.fromJson(json);
}

/// @nodoc
mixin _$WorkingSetDto {
  String get type => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError; // in kg
  int get duration => throw _privateConstructorUsedError; // in seconds
  double get distance => throw _privateConstructorUsedError;

  /// Serializes this WorkingSetDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkingSetDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkingSetDtoCopyWith<WorkingSetDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkingSetDtoCopyWith<$Res> {
  factory $WorkingSetDtoCopyWith(
    WorkingSetDto value,
    $Res Function(WorkingSetDto) then,
  ) = _$WorkingSetDtoCopyWithImpl<$Res, WorkingSetDto>;
  @useResult
  $Res call({
    String type,
    int sets,
    int reps,
    double weight,
    int duration,
    double distance,
  });
}

/// @nodoc
class _$WorkingSetDtoCopyWithImpl<$Res, $Val extends WorkingSetDto>
    implements $WorkingSetDtoCopyWith<$Res> {
  _$WorkingSetDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkingSetDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sets = null,
    Object? reps = null,
    Object? weight = null,
    Object? duration = null,
    Object? distance = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as int,
            reps: null == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as int,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
            distance: null == distance
                ? _value.distance
                : distance // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkingSetDtoImplCopyWith<$Res>
    implements $WorkingSetDtoCopyWith<$Res> {
  factory _$$WorkingSetDtoImplCopyWith(
    _$WorkingSetDtoImpl value,
    $Res Function(_$WorkingSetDtoImpl) then,
  ) = __$$WorkingSetDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    int sets,
    int reps,
    double weight,
    int duration,
    double distance,
  });
}

/// @nodoc
class __$$WorkingSetDtoImplCopyWithImpl<$Res>
    extends _$WorkingSetDtoCopyWithImpl<$Res, _$WorkingSetDtoImpl>
    implements _$$WorkingSetDtoImplCopyWith<$Res> {
  __$$WorkingSetDtoImplCopyWithImpl(
    _$WorkingSetDtoImpl _value,
    $Res Function(_$WorkingSetDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkingSetDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sets = null,
    Object? reps = null,
    Object? weight = null,
    Object? duration = null,
    Object? distance = null,
  }) {
    return _then(
      _$WorkingSetDtoImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        sets: null == sets
            ? _value.sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: null == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        distance: null == distance
            ? _value.distance
            : distance // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkingSetDtoImpl implements _WorkingSetDto {
  const _$WorkingSetDtoImpl({
    required this.type,
    this.sets = 0,
    this.reps = 0,
    this.weight = 0.0,
    this.duration = 0,
    this.distance = 0.0,
  });

  factory _$WorkingSetDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkingSetDtoImplFromJson(json);

  @override
  final String type;
  @override
  @JsonKey()
  final int sets;
  @override
  @JsonKey()
  final int reps;
  @override
  @JsonKey()
  final double weight;
  // in kg
  @override
  @JsonKey()
  final int duration;
  // in seconds
  @override
  @JsonKey()
  final double distance;

  @override
  String toString() {
    return 'WorkingSetDto(type: $type, sets: $sets, reps: $reps, weight: $weight, duration: $duration, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkingSetDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, sets, reps, weight, duration, distance);

  /// Create a copy of WorkingSetDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkingSetDtoImplCopyWith<_$WorkingSetDtoImpl> get copyWith =>
      __$$WorkingSetDtoImplCopyWithImpl<_$WorkingSetDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkingSetDtoImplToJson(this);
  }
}

abstract class _WorkingSetDto implements WorkingSetDto {
  const factory _WorkingSetDto({
    required final String type,
    final int sets,
    final int reps,
    final double weight,
    final int duration,
    final double distance,
  }) = _$WorkingSetDtoImpl;

  factory _WorkingSetDto.fromJson(Map<String, dynamic> json) =
      _$WorkingSetDtoImpl.fromJson;

  @override
  String get type;
  @override
  int get sets;
  @override
  int get reps;
  @override
  double get weight; // in kg
  @override
  int get duration; // in seconds
  @override
  double get distance;

  /// Create a copy of WorkingSetDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkingSetDtoImplCopyWith<_$WorkingSetDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
