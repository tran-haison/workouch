// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkoutDto _$WorkoutDtoFromJson(Map<String, dynamic> json) {
  return _WorkoutDto.fromJson(json);
}

/// @nodoc
mixin _$WorkoutDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<WorkingExerciseDto> get exercises => throw _privateConstructorUsedError;
  int get restTimeBetweenExercises => throw _privateConstructorUsedError;

  /// Serializes this WorkoutDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutDtoCopyWith<WorkoutDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutDtoCopyWith<$Res> {
  factory $WorkoutDtoCopyWith(
    WorkoutDto value,
    $Res Function(WorkoutDto) then,
  ) = _$WorkoutDtoCopyWithImpl<$Res, WorkoutDto>;
  @useResult
  $Res call({
    String id,
    String name,
    List<WorkingExerciseDto> exercises,
    int restTimeBetweenExercises,
  });
}

/// @nodoc
class _$WorkoutDtoCopyWithImpl<$Res, $Val extends WorkoutDto>
    implements $WorkoutDtoCopyWith<$Res> {
  _$WorkoutDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? exercises = null,
    Object? restTimeBetweenExercises = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$WorkoutDtoImplCopyWith<$Res>
    implements $WorkoutDtoCopyWith<$Res> {
  factory _$$WorkoutDtoImplCopyWith(
    _$WorkoutDtoImpl value,
    $Res Function(_$WorkoutDtoImpl) then,
  ) = __$$WorkoutDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    List<WorkingExerciseDto> exercises,
    int restTimeBetweenExercises,
  });
}

/// @nodoc
class __$$WorkoutDtoImplCopyWithImpl<$Res>
    extends _$WorkoutDtoCopyWithImpl<$Res, _$WorkoutDtoImpl>
    implements _$$WorkoutDtoImplCopyWith<$Res> {
  __$$WorkoutDtoImplCopyWithImpl(
    _$WorkoutDtoImpl _value,
    $Res Function(_$WorkoutDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? exercises = null,
    Object? restTimeBetweenExercises = null,
  }) {
    return _then(
      _$WorkoutDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$WorkoutDtoImpl implements _WorkoutDto {
  const _$WorkoutDtoImpl({
    required this.id,
    required this.name,
    required final List<WorkingExerciseDto> exercises,
    required this.restTimeBetweenExercises,
  }) : _exercises = exercises;

  factory _$WorkoutDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutDtoImplFromJson(json);

  @override
  final String id;
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
    return 'WorkoutDto(id: $id, name: $name, exercises: $exercises, restTimeBetweenExercises: $restTimeBetweenExercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
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
    id,
    name,
    const DeepCollectionEquality().hash(_exercises),
    restTimeBetweenExercises,
  );

  /// Create a copy of WorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutDtoImplCopyWith<_$WorkoutDtoImpl> get copyWith =>
      __$$WorkoutDtoImplCopyWithImpl<_$WorkoutDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutDtoImplToJson(this);
  }
}

abstract class _WorkoutDto implements WorkoutDto {
  const factory _WorkoutDto({
    required final String id,
    required final String name,
    required final List<WorkingExerciseDto> exercises,
    required final int restTimeBetweenExercises,
  }) = _$WorkoutDtoImpl;

  factory _WorkoutDto.fromJson(Map<String, dynamic> json) =
      _$WorkoutDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<WorkingExerciseDto> get exercises;
  @override
  int get restTimeBetweenExercises;

  /// Create a copy of WorkoutDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutDtoImplCopyWith<_$WorkoutDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
