// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_workout_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AIWorkoutDto _$AIWorkoutDtoFromJson(Map<String, dynamic> json) {
  return _AIWorkoutDto.fromJson(json);
}

/// @nodoc
mixin _$AIWorkoutDto {
  String get name => throw _privateConstructorUsedError;
  List<WorkingExerciseDto> get exercises => throw _privateConstructorUsedError;
  int get restTimeBetweenExercises => throw _privateConstructorUsedError;

  /// Serializes this AIWorkoutDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AIWorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AIWorkoutDtoCopyWith<AIWorkoutDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIWorkoutDtoCopyWith<$Res> {
  factory $AIWorkoutDtoCopyWith(
    AIWorkoutDto value,
    $Res Function(AIWorkoutDto) then,
  ) = _$AIWorkoutDtoCopyWithImpl<$Res, AIWorkoutDto>;
  @useResult
  $Res call({
    String name,
    List<WorkingExerciseDto> exercises,
    int restTimeBetweenExercises,
  });
}

/// @nodoc
class _$AIWorkoutDtoCopyWithImpl<$Res, $Val extends AIWorkoutDto>
    implements $AIWorkoutDtoCopyWith<$Res> {
  _$AIWorkoutDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AIWorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? exercises = null,
    Object? restTimeBetweenExercises = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<WorkingExerciseDto>,
            restTimeBetweenExercises: null == restTimeBetweenExercises
                ? _value.restTimeBetweenExercises
                : restTimeBetweenExercises // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AIWorkoutDtoImplCopyWith<$Res>
    implements $AIWorkoutDtoCopyWith<$Res> {
  factory _$$AIWorkoutDtoImplCopyWith(
    _$AIWorkoutDtoImpl value,
    $Res Function(_$AIWorkoutDtoImpl) then,
  ) = __$$AIWorkoutDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    List<WorkingExerciseDto> exercises,
    int restTimeBetweenExercises,
  });
}

/// @nodoc
class __$$AIWorkoutDtoImplCopyWithImpl<$Res>
    extends _$AIWorkoutDtoCopyWithImpl<$Res, _$AIWorkoutDtoImpl>
    implements _$$AIWorkoutDtoImplCopyWith<$Res> {
  __$$AIWorkoutDtoImplCopyWithImpl(
    _$AIWorkoutDtoImpl _value,
    $Res Function(_$AIWorkoutDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AIWorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? exercises = null,
    Object? restTimeBetweenExercises = null,
  }) {
    return _then(
      _$AIWorkoutDtoImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<WorkingExerciseDto>,
        restTimeBetweenExercises: null == restTimeBetweenExercises
            ? _value.restTimeBetweenExercises
            : restTimeBetweenExercises // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AIWorkoutDtoImpl implements _AIWorkoutDto {
  const _$AIWorkoutDtoImpl({
    required this.name,
    required final List<WorkingExerciseDto> exercises,
    required this.restTimeBetweenExercises,
  }) : _exercises = exercises;

  factory _$AIWorkoutDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AIWorkoutDtoImplFromJson(json);

  @override
  final String name;
  final List<WorkingExerciseDto> _exercises;
  @override
  List<WorkingExerciseDto> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final int restTimeBetweenExercises;

  @override
  String toString() {
    return 'AIWorkoutDto(name: $name, exercises: $exercises, restTimeBetweenExercises: $restTimeBetweenExercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIWorkoutDtoImpl &&
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

  /// Create a copy of AIWorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AIWorkoutDtoImplCopyWith<_$AIWorkoutDtoImpl> get copyWith =>
      __$$AIWorkoutDtoImplCopyWithImpl<_$AIWorkoutDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AIWorkoutDtoImplToJson(this);
  }
}

abstract class _AIWorkoutDto implements AIWorkoutDto {
  const factory _AIWorkoutDto({
    required final String name,
    required final List<WorkingExerciseDto> exercises,
    required final int restTimeBetweenExercises,
  }) = _$AIWorkoutDtoImpl;

  factory _AIWorkoutDto.fromJson(Map<String, dynamic> json) =
      _$AIWorkoutDtoImpl.fromJson;

  @override
  String get name;
  @override
  List<WorkingExerciseDto> get exercises;
  @override
  int get restTimeBetweenExercises;

  /// Create a copy of AIWorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AIWorkoutDtoImplCopyWith<_$AIWorkoutDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
