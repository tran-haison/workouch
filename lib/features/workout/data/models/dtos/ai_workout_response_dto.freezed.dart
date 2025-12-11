// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_workout_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AIWorkoutResponseDto _$AIWorkoutResponseDtoFromJson(Map<String, dynamic> json) {
  return _AIWorkoutResponseDto.fromJson(json);
}

/// @nodoc
mixin _$AIWorkoutResponseDto {
  @JsonKey(name: 'workout_name')
  String get workoutName => throw _privateConstructorUsedError;
  @JsonKey(name: 'exercises')
  List<AIExerciseDto> get exercises => throw _privateConstructorUsedError;
  @JsonKey(name: 'rest_time_between_exercises')
  int get restTimeBetweenExercises => throw _privateConstructorUsedError;

  /// Serializes this AIWorkoutResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AIWorkoutResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AIWorkoutResponseDtoCopyWith<AIWorkoutResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIWorkoutResponseDtoCopyWith<$Res> {
  factory $AIWorkoutResponseDtoCopyWith(
    AIWorkoutResponseDto value,
    $Res Function(AIWorkoutResponseDto) then,
  ) = _$AIWorkoutResponseDtoCopyWithImpl<$Res, AIWorkoutResponseDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'workout_name') String workoutName,
    @JsonKey(name: 'exercises') List<AIExerciseDto> exercises,
    @JsonKey(name: 'rest_time_between_exercises') int restTimeBetweenExercises,
  });
}

/// @nodoc
class _$AIWorkoutResponseDtoCopyWithImpl<
  $Res,
  $Val extends AIWorkoutResponseDto
>
    implements $AIWorkoutResponseDtoCopyWith<$Res> {
  _$AIWorkoutResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AIWorkoutResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutName = null,
    Object? exercises = null,
    Object? restTimeBetweenExercises = null,
  }) {
    return _then(
      _value.copyWith(
            workoutName: null == workoutName
                ? _value.workoutName
                : workoutName // ignore: cast_nullable_to_non_nullable
                      as String,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<AIExerciseDto>,
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
abstract class _$$AIWorkoutResponseDtoImplCopyWith<$Res>
    implements $AIWorkoutResponseDtoCopyWith<$Res> {
  factory _$$AIWorkoutResponseDtoImplCopyWith(
    _$AIWorkoutResponseDtoImpl value,
    $Res Function(_$AIWorkoutResponseDtoImpl) then,
  ) = __$$AIWorkoutResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'workout_name') String workoutName,
    @JsonKey(name: 'exercises') List<AIExerciseDto> exercises,
    @JsonKey(name: 'rest_time_between_exercises') int restTimeBetweenExercises,
  });
}

/// @nodoc
class __$$AIWorkoutResponseDtoImplCopyWithImpl<$Res>
    extends _$AIWorkoutResponseDtoCopyWithImpl<$Res, _$AIWorkoutResponseDtoImpl>
    implements _$$AIWorkoutResponseDtoImplCopyWith<$Res> {
  __$$AIWorkoutResponseDtoImplCopyWithImpl(
    _$AIWorkoutResponseDtoImpl _value,
    $Res Function(_$AIWorkoutResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AIWorkoutResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutName = null,
    Object? exercises = null,
    Object? restTimeBetweenExercises = null,
  }) {
    return _then(
      _$AIWorkoutResponseDtoImpl(
        workoutName: null == workoutName
            ? _value.workoutName
            : workoutName // ignore: cast_nullable_to_non_nullable
                  as String,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<AIExerciseDto>,
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
class _$AIWorkoutResponseDtoImpl implements _AIWorkoutResponseDto {
  const _$AIWorkoutResponseDtoImpl({
    @JsonKey(name: 'workout_name') required this.workoutName,
    @JsonKey(name: 'exercises') required final List<AIExerciseDto> exercises,
    @JsonKey(name: 'rest_time_between_exercises')
    this.restTimeBetweenExercises = 60,
  }) : _exercises = exercises;

  factory _$AIWorkoutResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AIWorkoutResponseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'workout_name')
  final String workoutName;
  final List<AIExerciseDto> _exercises;
  @override
  @JsonKey(name: 'exercises')
  List<AIExerciseDto> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  @JsonKey(name: 'rest_time_between_exercises')
  final int restTimeBetweenExercises;

  @override
  String toString() {
    return 'AIWorkoutResponseDto(workoutName: $workoutName, exercises: $exercises, restTimeBetweenExercises: $restTimeBetweenExercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIWorkoutResponseDtoImpl &&
            (identical(other.workoutName, workoutName) ||
                other.workoutName == workoutName) &&
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
    workoutName,
    const DeepCollectionEquality().hash(_exercises),
    restTimeBetweenExercises,
  );

  /// Create a copy of AIWorkoutResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AIWorkoutResponseDtoImplCopyWith<_$AIWorkoutResponseDtoImpl>
  get copyWith =>
      __$$AIWorkoutResponseDtoImplCopyWithImpl<_$AIWorkoutResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AIWorkoutResponseDtoImplToJson(this);
  }
}

abstract class _AIWorkoutResponseDto implements AIWorkoutResponseDto {
  const factory _AIWorkoutResponseDto({
    @JsonKey(name: 'workout_name') required final String workoutName,
    @JsonKey(name: 'exercises') required final List<AIExerciseDto> exercises,
    @JsonKey(name: 'rest_time_between_exercises')
    final int restTimeBetweenExercises,
  }) = _$AIWorkoutResponseDtoImpl;

  factory _AIWorkoutResponseDto.fromJson(Map<String, dynamic> json) =
      _$AIWorkoutResponseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'workout_name')
  String get workoutName;
  @override
  @JsonKey(name: 'exercises')
  List<AIExerciseDto> get exercises;
  @override
  @JsonKey(name: 'rest_time_between_exercises')
  int get restTimeBetweenExercises;

  /// Create a copy of AIWorkoutResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AIWorkoutResponseDtoImplCopyWith<_$AIWorkoutResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AIExerciseDto _$AIExerciseDtoFromJson(Map<String, dynamic> json) {
  return _AIExerciseDto.fromJson(json);
}

/// @nodoc
mixin _$AIExerciseDto {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'sets')
  int get sets => throw _privateConstructorUsedError;
  @JsonKey(name: 'reps')
  int get reps => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight_kg')
  double get weightKg => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_seconds')
  int get durationSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'rest_between_sets_seconds')
  int get restBetweenSetsSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'set_type')
  String get setType => throw _privateConstructorUsedError;

  /// Serializes this AIExerciseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AIExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AIExerciseDtoCopyWith<AIExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIExerciseDtoCopyWith<$Res> {
  factory $AIExerciseDtoCopyWith(
    AIExerciseDto value,
    $Res Function(AIExerciseDto) then,
  ) = _$AIExerciseDtoCopyWithImpl<$Res, AIExerciseDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'sets') int sets,
    @JsonKey(name: 'reps') int reps,
    @JsonKey(name: 'weight_kg') double weightKg,
    @JsonKey(name: 'duration_seconds') int durationSeconds,
    @JsonKey(name: 'rest_between_sets_seconds') int restBetweenSetsSeconds,
    @JsonKey(name: 'set_type') String setType,
  });
}

/// @nodoc
class _$AIExerciseDtoCopyWithImpl<$Res, $Val extends AIExerciseDto>
    implements $AIExerciseDtoCopyWith<$Res> {
  _$AIExerciseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AIExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? sets = null,
    Object? reps = null,
    Object? weightKg = null,
    Object? durationSeconds = null,
    Object? restBetweenSetsSeconds = null,
    Object? setType = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as int,
            reps: null == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                      as int,
            weightKg: null == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as double,
            durationSeconds: null == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            restBetweenSetsSeconds: null == restBetweenSetsSeconds
                ? _value.restBetweenSetsSeconds
                : restBetweenSetsSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            setType: null == setType
                ? _value.setType
                : setType // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AIExerciseDtoImplCopyWith<$Res>
    implements $AIExerciseDtoCopyWith<$Res> {
  factory _$$AIExerciseDtoImplCopyWith(
    _$AIExerciseDtoImpl value,
    $Res Function(_$AIExerciseDtoImpl) then,
  ) = __$$AIExerciseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'sets') int sets,
    @JsonKey(name: 'reps') int reps,
    @JsonKey(name: 'weight_kg') double weightKg,
    @JsonKey(name: 'duration_seconds') int durationSeconds,
    @JsonKey(name: 'rest_between_sets_seconds') int restBetweenSetsSeconds,
    @JsonKey(name: 'set_type') String setType,
  });
}

/// @nodoc
class __$$AIExerciseDtoImplCopyWithImpl<$Res>
    extends _$AIExerciseDtoCopyWithImpl<$Res, _$AIExerciseDtoImpl>
    implements _$$AIExerciseDtoImplCopyWith<$Res> {
  __$$AIExerciseDtoImplCopyWithImpl(
    _$AIExerciseDtoImpl _value,
    $Res Function(_$AIExerciseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AIExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? sets = null,
    Object? reps = null,
    Object? weightKg = null,
    Object? durationSeconds = null,
    Object? restBetweenSetsSeconds = null,
    Object? setType = null,
  }) {
    return _then(
      _$AIExerciseDtoImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        sets: null == sets
            ? _value.sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: null == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int,
        weightKg: null == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as double,
        durationSeconds: null == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        restBetweenSetsSeconds: null == restBetweenSetsSeconds
            ? _value.restBetweenSetsSeconds
            : restBetweenSetsSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        setType: null == setType
            ? _value.setType
            : setType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AIExerciseDtoImpl implements _AIExerciseDto {
  const _$AIExerciseDtoImpl({
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'sets') this.sets = 3,
    @JsonKey(name: 'reps') this.reps = 10,
    @JsonKey(name: 'weight_kg') this.weightKg = 0.0,
    @JsonKey(name: 'duration_seconds') this.durationSeconds = 0,
    @JsonKey(name: 'rest_between_sets_seconds')
    this.restBetweenSetsSeconds = 60,
    @JsonKey(name: 'set_type') this.setType = 'weightBased',
  });

  factory _$AIExerciseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AIExerciseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'sets')
  final int sets;
  @override
  @JsonKey(name: 'reps')
  final int reps;
  @override
  @JsonKey(name: 'weight_kg')
  final double weightKg;
  @override
  @JsonKey(name: 'duration_seconds')
  final int durationSeconds;
  @override
  @JsonKey(name: 'rest_between_sets_seconds')
  final int restBetweenSetsSeconds;
  @override
  @JsonKey(name: 'set_type')
  final String setType;

  @override
  String toString() {
    return 'AIExerciseDto(name: $name, sets: $sets, reps: $reps, weightKg: $weightKg, durationSeconds: $durationSeconds, restBetweenSetsSeconds: $restBetweenSetsSeconds, setType: $setType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIExerciseDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.restBetweenSetsSeconds, restBetweenSetsSeconds) ||
                other.restBetweenSetsSeconds == restBetweenSetsSeconds) &&
            (identical(other.setType, setType) || other.setType == setType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    sets,
    reps,
    weightKg,
    durationSeconds,
    restBetweenSetsSeconds,
    setType,
  );

  /// Create a copy of AIExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AIExerciseDtoImplCopyWith<_$AIExerciseDtoImpl> get copyWith =>
      __$$AIExerciseDtoImplCopyWithImpl<_$AIExerciseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AIExerciseDtoImplToJson(this);
  }
}

abstract class _AIExerciseDto implements AIExerciseDto {
  const factory _AIExerciseDto({
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'sets') final int sets,
    @JsonKey(name: 'reps') final int reps,
    @JsonKey(name: 'weight_kg') final double weightKg,
    @JsonKey(name: 'duration_seconds') final int durationSeconds,
    @JsonKey(name: 'rest_between_sets_seconds')
    final int restBetweenSetsSeconds,
    @JsonKey(name: 'set_type') final String setType,
  }) = _$AIExerciseDtoImpl;

  factory _AIExerciseDto.fromJson(Map<String, dynamic> json) =
      _$AIExerciseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'sets')
  int get sets;
  @override
  @JsonKey(name: 'reps')
  int get reps;
  @override
  @JsonKey(name: 'weight_kg')
  double get weightKg;
  @override
  @JsonKey(name: 'duration_seconds')
  int get durationSeconds;
  @override
  @JsonKey(name: 'rest_between_sets_seconds')
  int get restBetweenSetsSeconds;
  @override
  @JsonKey(name: 'set_type')
  String get setType;

  /// Create a copy of AIExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AIExerciseDtoImplCopyWith<_$AIExerciseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
