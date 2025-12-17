// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_workout_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GenerateWorkoutDto _$GenerateWorkoutDtoFromJson(Map<String, dynamic> json) {
  return _GenerateWorkoutDto.fromJson(json);
}

/// @nodoc
mixin _$GenerateWorkoutDto {
  String? get name => throw _privateConstructorUsedError;
  List<WorkingExerciseDto>? get exercises => throw _privateConstructorUsedError;
  int? get restTimeBetweenExercises => throw _privateConstructorUsedError;

  /// Serializes this GenerateWorkoutDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateWorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateWorkoutDtoCopyWith<GenerateWorkoutDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateWorkoutDtoCopyWith<$Res> {
  factory $GenerateWorkoutDtoCopyWith(
    GenerateWorkoutDto value,
    $Res Function(GenerateWorkoutDto) then,
  ) = _$GenerateWorkoutDtoCopyWithImpl<$Res, GenerateWorkoutDto>;
  @useResult
  $Res call({
    String? name,
    List<WorkingExerciseDto>? exercises,
    int? restTimeBetweenExercises,
  });
}

/// @nodoc
class _$GenerateWorkoutDtoCopyWithImpl<$Res, $Val extends GenerateWorkoutDto>
    implements $GenerateWorkoutDtoCopyWith<$Res> {
  _$GenerateWorkoutDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateWorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? exercises = freezed,
    Object? restTimeBetweenExercises = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            exercises: freezed == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<WorkingExerciseDto>?,
            restTimeBetweenExercises: freezed == restTimeBetweenExercises
                ? _value.restTimeBetweenExercises
                : restTimeBetweenExercises // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenerateWorkoutDtoImplCopyWith<$Res>
    implements $GenerateWorkoutDtoCopyWith<$Res> {
  factory _$$GenerateWorkoutDtoImplCopyWith(
    _$GenerateWorkoutDtoImpl value,
    $Res Function(_$GenerateWorkoutDtoImpl) then,
  ) = __$$GenerateWorkoutDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? name,
    List<WorkingExerciseDto>? exercises,
    int? restTimeBetweenExercises,
  });
}

/// @nodoc
class __$$GenerateWorkoutDtoImplCopyWithImpl<$Res>
    extends _$GenerateWorkoutDtoCopyWithImpl<$Res, _$GenerateWorkoutDtoImpl>
    implements _$$GenerateWorkoutDtoImplCopyWith<$Res> {
  __$$GenerateWorkoutDtoImplCopyWithImpl(
    _$GenerateWorkoutDtoImpl _value,
    $Res Function(_$GenerateWorkoutDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateWorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? exercises = freezed,
    Object? restTimeBetweenExercises = freezed,
  }) {
    return _then(
      _$GenerateWorkoutDtoImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        exercises: freezed == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<WorkingExerciseDto>?,
        restTimeBetweenExercises: freezed == restTimeBetweenExercises
            ? _value.restTimeBetweenExercises
            : restTimeBetweenExercises // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateWorkoutDtoImpl implements _GenerateWorkoutDto {
  const _$GenerateWorkoutDtoImpl({
    this.name,
    final List<WorkingExerciseDto>? exercises,
    this.restTimeBetweenExercises,
  }) : _exercises = exercises;

  factory _$GenerateWorkoutDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateWorkoutDtoImplFromJson(json);

  @override
  final String? name;
  final List<WorkingExerciseDto>? _exercises;
  @override
  List<WorkingExerciseDto>? get exercises {
    final value = _exercises;
    if (value == null) return null;
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? restTimeBetweenExercises;

  @override
  String toString() {
    return 'GenerateWorkoutDto(name: $name, exercises: $exercises, restTimeBetweenExercises: $restTimeBetweenExercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateWorkoutDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            (identical(
                  other.restTimeBetweenExercises,
                  restTimeBetweenExercises,
                ) ||
                other.restTimeBetweenExercises == restTimeBetweenExercises));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    const DeepCollectionEquality().hash(_exercises),
    restTimeBetweenExercises,
  );

  /// Create a copy of GenerateWorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateWorkoutDtoImplCopyWith<_$GenerateWorkoutDtoImpl> get copyWith =>
      __$$GenerateWorkoutDtoImplCopyWithImpl<_$GenerateWorkoutDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateWorkoutDtoImplToJson(this);
  }
}

abstract class _GenerateWorkoutDto implements GenerateWorkoutDto {
  const factory _GenerateWorkoutDto({
    final String? name,
    final List<WorkingExerciseDto>? exercises,
    final int? restTimeBetweenExercises,
  }) = _$GenerateWorkoutDtoImpl;

  factory _GenerateWorkoutDto.fromJson(Map<String, dynamic> json) =
      _$GenerateWorkoutDtoImpl.fromJson;

  @override
  String? get name;
  @override
  List<WorkingExerciseDto>? get exercises;
  @override
  int? get restTimeBetweenExercises;

  /// Create a copy of GenerateWorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateWorkoutDtoImplCopyWith<_$GenerateWorkoutDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
