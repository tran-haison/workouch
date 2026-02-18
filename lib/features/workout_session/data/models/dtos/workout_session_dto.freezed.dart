// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkoutSessionDto _$WorkoutSessionDtoFromJson(Map<String, dynamic> json) {
  return _WorkoutSessionDto.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSessionDto {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get workoutId => throw _privateConstructorUsedError;
  String get workoutName => throw _privateConstructorUsedError;
  String get startedAt => throw _privateConstructorUsedError;
  String get completedAt => throw _privateConstructorUsedError;
  int get totalDurationSeconds => throw _privateConstructorUsedError;
  double get totalVolumeKg => throw _privateConstructorUsedError;
  int get totalSets => throw _privateConstructorUsedError;
  int get totalExercises => throw _privateConstructorUsedError;
  double? get caloriesBurned => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<WorkoutSessionExerciseDto> get exercises =>
      throw _privateConstructorUsedError;

  /// Serializes this WorkoutSessionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSessionDtoCopyWith<WorkoutSessionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionDtoCopyWith<$Res> {
  factory $WorkoutSessionDtoCopyWith(
    WorkoutSessionDto value,
    $Res Function(WorkoutSessionDto) then,
  ) = _$WorkoutSessionDtoCopyWithImpl<$Res, WorkoutSessionDto>;
  @useResult
  $Res call({
    String id,
    String userId,
    String? workoutId,
    String workoutName,
    String startedAt,
    String completedAt,
    int totalDurationSeconds,
    double totalVolumeKg,
    int totalSets,
    int totalExercises,
    double? caloriesBurned,
    String? notes,
    List<WorkoutSessionExerciseDto> exercises,
  });
}

/// @nodoc
class _$WorkoutSessionDtoCopyWithImpl<$Res, $Val extends WorkoutSessionDto>
    implements $WorkoutSessionDtoCopyWith<$Res> {
  _$WorkoutSessionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? workoutId = freezed,
    Object? workoutName = null,
    Object? startedAt = null,
    Object? completedAt = null,
    Object? totalDurationSeconds = null,
    Object? totalVolumeKg = null,
    Object? totalSets = null,
    Object? totalExercises = null,
    Object? caloriesBurned = freezed,
    Object? notes = freezed,
    Object? exercises = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            workoutId: freezed == workoutId
                ? _value.workoutId
                : workoutId // ignore: cast_nullable_to_non_nullable
                      as String?,
            workoutName: null == workoutName
                ? _value.workoutName
                : workoutName // ignore: cast_nullable_to_non_nullable
                      as String,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            completedAt: null == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            totalDurationSeconds: null == totalDurationSeconds
                ? _value.totalDurationSeconds
                : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            totalVolumeKg: null == totalVolumeKg
                ? _value.totalVolumeKg
                : totalVolumeKg // ignore: cast_nullable_to_non_nullable
                      as double,
            totalSets: null == totalSets
                ? _value.totalSets
                : totalSets // ignore: cast_nullable_to_non_nullable
                      as int,
            totalExercises: null == totalExercises
                ? _value.totalExercises
                : totalExercises // ignore: cast_nullable_to_non_nullable
                      as int,
            caloriesBurned: freezed == caloriesBurned
                ? _value.caloriesBurned
                : caloriesBurned // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutSessionExerciseDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutSessionDtoImplCopyWith<$Res>
    implements $WorkoutSessionDtoCopyWith<$Res> {
  factory _$$WorkoutSessionDtoImplCopyWith(
    _$WorkoutSessionDtoImpl value,
    $Res Function(_$WorkoutSessionDtoImpl) then,
  ) = __$$WorkoutSessionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String? workoutId,
    String workoutName,
    String startedAt,
    String completedAt,
    int totalDurationSeconds,
    double totalVolumeKg,
    int totalSets,
    int totalExercises,
    double? caloriesBurned,
    String? notes,
    List<WorkoutSessionExerciseDto> exercises,
  });
}

/// @nodoc
class __$$WorkoutSessionDtoImplCopyWithImpl<$Res>
    extends _$WorkoutSessionDtoCopyWithImpl<$Res, _$WorkoutSessionDtoImpl>
    implements _$$WorkoutSessionDtoImplCopyWith<$Res> {
  __$$WorkoutSessionDtoImplCopyWithImpl(
    _$WorkoutSessionDtoImpl _value,
    $Res Function(_$WorkoutSessionDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? workoutId = freezed,
    Object? workoutName = null,
    Object? startedAt = null,
    Object? completedAt = null,
    Object? totalDurationSeconds = null,
    Object? totalVolumeKg = null,
    Object? totalSets = null,
    Object? totalExercises = null,
    Object? caloriesBurned = freezed,
    Object? notes = freezed,
    Object? exercises = null,
  }) {
    return _then(
      _$WorkoutSessionDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        workoutId: freezed == workoutId
            ? _value.workoutId
            : workoutId // ignore: cast_nullable_to_non_nullable
                  as String?,
        workoutName: null == workoutName
            ? _value.workoutName
            : workoutName // ignore: cast_nullable_to_non_nullable
                  as String,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        completedAt: null == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        totalDurationSeconds: null == totalDurationSeconds
            ? _value.totalDurationSeconds
            : totalDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        totalVolumeKg: null == totalVolumeKg
            ? _value.totalVolumeKg
            : totalVolumeKg // ignore: cast_nullable_to_non_nullable
                  as double,
        totalSets: null == totalSets
            ? _value.totalSets
            : totalSets // ignore: cast_nullable_to_non_nullable
                  as int,
        totalExercises: null == totalExercises
            ? _value.totalExercises
            : totalExercises // ignore: cast_nullable_to_non_nullable
                  as int,
        caloriesBurned: freezed == caloriesBurned
            ? _value.caloriesBurned
            : caloriesBurned // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutSessionExerciseDto>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WorkoutSessionDtoImpl implements _WorkoutSessionDto {
  const _$WorkoutSessionDtoImpl({
    required this.id,
    required this.userId,
    this.workoutId,
    required this.workoutName,
    required this.startedAt,
    required this.completedAt,
    required this.totalDurationSeconds,
    required this.totalVolumeKg,
    required this.totalSets,
    required this.totalExercises,
    this.caloriesBurned,
    this.notes,
    final List<WorkoutSessionExerciseDto> exercises = const [],
  }) : _exercises = exercises;

  factory _$WorkoutSessionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSessionDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? workoutId;
  @override
  final String workoutName;
  @override
  final String startedAt;
  @override
  final String completedAt;
  @override
  final int totalDurationSeconds;
  @override
  final double totalVolumeKg;
  @override
  final int totalSets;
  @override
  final int totalExercises;
  @override
  final double? caloriesBurned;
  @override
  final String? notes;
  final List<WorkoutSessionExerciseDto> _exercises;
  @override
  @JsonKey()
  List<WorkoutSessionExerciseDto> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WorkoutSessionDto(id: $id, userId: $userId, workoutId: $workoutId, workoutName: $workoutName, startedAt: $startedAt, completedAt: $completedAt, totalDurationSeconds: $totalDurationSeconds, totalVolumeKg: $totalVolumeKg, totalSets: $totalSets, totalExercises: $totalExercises, caloriesBurned: $caloriesBurned, notes: $notes, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.workoutId, workoutId) ||
                other.workoutId == workoutId) &&
            (identical(other.workoutName, workoutName) ||
                other.workoutName == workoutName) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.totalDurationSeconds, totalDurationSeconds) ||
                other.totalDurationSeconds == totalDurationSeconds) &&
            (identical(other.totalVolumeKg, totalVolumeKg) ||
                other.totalVolumeKg == totalVolumeKg) &&
            (identical(other.totalSets, totalSets) ||
                other.totalSets == totalSets) &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises) &&
            (identical(other.caloriesBurned, caloriesBurned) ||
                other.caloriesBurned == caloriesBurned) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    workoutId,
    workoutName,
    startedAt,
    completedAt,
    totalDurationSeconds,
    totalVolumeKg,
    totalSets,
    totalExercises,
    caloriesBurned,
    notes,
    const DeepCollectionEquality().hash(_exercises),
  );

  /// Create a copy of WorkoutSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionDtoImplCopyWith<_$WorkoutSessionDtoImpl> get copyWith =>
      __$$WorkoutSessionDtoImplCopyWithImpl<_$WorkoutSessionDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSessionDtoImplToJson(this);
  }
}

abstract class _WorkoutSessionDto implements WorkoutSessionDto {
  const factory _WorkoutSessionDto({
    required final String id,
    required final String userId,
    final String? workoutId,
    required final String workoutName,
    required final String startedAt,
    required final String completedAt,
    required final int totalDurationSeconds,
    required final double totalVolumeKg,
    required final int totalSets,
    required final int totalExercises,
    final double? caloriesBurned,
    final String? notes,
    final List<WorkoutSessionExerciseDto> exercises,
  }) = _$WorkoutSessionDtoImpl;

  factory _WorkoutSessionDto.fromJson(Map<String, dynamic> json) =
      _$WorkoutSessionDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get workoutId;
  @override
  String get workoutName;
  @override
  String get startedAt;
  @override
  String get completedAt;
  @override
  int get totalDurationSeconds;
  @override
  double get totalVolumeKg;
  @override
  int get totalSets;
  @override
  int get totalExercises;
  @override
  double? get caloriesBurned;
  @override
  String? get notes;
  @override
  List<WorkoutSessionExerciseDto> get exercises;

  /// Create a copy of WorkoutSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionDtoImplCopyWith<_$WorkoutSessionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
