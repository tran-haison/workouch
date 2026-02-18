// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkoutSession {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get workoutId => throw _privateConstructorUsedError;
  String get workoutName => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;
  int get totalDurationSeconds => throw _privateConstructorUsedError;
  double get totalVolumeKg => throw _privateConstructorUsedError;
  int get totalSets => throw _privateConstructorUsedError;
  int get totalExercises => throw _privateConstructorUsedError;
  double get caloriesBurned => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  List<WorkoutSessionExercise> get exercises =>
      throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSessionCopyWith<WorkoutSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionCopyWith<$Res> {
  factory $WorkoutSessionCopyWith(
    WorkoutSession value,
    $Res Function(WorkoutSession) then,
  ) = _$WorkoutSessionCopyWithImpl<$Res, WorkoutSession>;
  @useResult
  $Res call({
    String id,
    String userId,
    String workoutId,
    String workoutName,
    DateTime startedAt,
    DateTime completedAt,
    int totalDurationSeconds,
    double totalVolumeKg,
    int totalSets,
    int totalExercises,
    double caloriesBurned,
    String notes,
    List<WorkoutSessionExercise> exercises,
  });
}

/// @nodoc
class _$WorkoutSessionCopyWithImpl<$Res, $Val extends WorkoutSession>
    implements $WorkoutSessionCopyWith<$Res> {
  _$WorkoutSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? workoutId = null,
    Object? workoutName = null,
    Object? startedAt = null,
    Object? completedAt = null,
    Object? totalDurationSeconds = null,
    Object? totalVolumeKg = null,
    Object? totalSets = null,
    Object? totalExercises = null,
    Object? caloriesBurned = null,
    Object? notes = null,
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
            workoutId: null == workoutId
                ? _value.workoutId
                : workoutId // ignore: cast_nullable_to_non_nullable
                      as String,
            workoutName: null == workoutName
                ? _value.workoutName
                : workoutName // ignore: cast_nullable_to_non_nullable
                      as String,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: null == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
            caloriesBurned: null == caloriesBurned
                ? _value.caloriesBurned
                : caloriesBurned // ignore: cast_nullable_to_non_nullable
                      as double,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutSessionExercise>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutSessionImplCopyWith<$Res>
    implements $WorkoutSessionCopyWith<$Res> {
  factory _$$WorkoutSessionImplCopyWith(
    _$WorkoutSessionImpl value,
    $Res Function(_$WorkoutSessionImpl) then,
  ) = __$$WorkoutSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String workoutId,
    String workoutName,
    DateTime startedAt,
    DateTime completedAt,
    int totalDurationSeconds,
    double totalVolumeKg,
    int totalSets,
    int totalExercises,
    double caloriesBurned,
    String notes,
    List<WorkoutSessionExercise> exercises,
  });
}

/// @nodoc
class __$$WorkoutSessionImplCopyWithImpl<$Res>
    extends _$WorkoutSessionCopyWithImpl<$Res, _$WorkoutSessionImpl>
    implements _$$WorkoutSessionImplCopyWith<$Res> {
  __$$WorkoutSessionImplCopyWithImpl(
    _$WorkoutSessionImpl _value,
    $Res Function(_$WorkoutSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? workoutId = null,
    Object? workoutName = null,
    Object? startedAt = null,
    Object? completedAt = null,
    Object? totalDurationSeconds = null,
    Object? totalVolumeKg = null,
    Object? totalSets = null,
    Object? totalExercises = null,
    Object? caloriesBurned = null,
    Object? notes = null,
    Object? exercises = null,
  }) {
    return _then(
      _$WorkoutSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        workoutId: null == workoutId
            ? _value.workoutId
            : workoutId // ignore: cast_nullable_to_non_nullable
                  as String,
        workoutName: null == workoutName
            ? _value.workoutName
            : workoutName // ignore: cast_nullable_to_non_nullable
                  as String,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: null == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
        caloriesBurned: null == caloriesBurned
            ? _value.caloriesBurned
            : caloriesBurned // ignore: cast_nullable_to_non_nullable
                  as double,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutSessionExercise>,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutSessionImpl extends _WorkoutSession {
  const _$WorkoutSessionImpl({
    this.id = '',
    this.userId = '',
    this.workoutId = '',
    this.workoutName = '',
    required this.startedAt,
    required this.completedAt,
    this.totalDurationSeconds = 0,
    this.totalVolumeKg = 0.0,
    this.totalSets = 0,
    this.totalExercises = 0,
    this.caloriesBurned = 0.0,
    this.notes = '',
    final List<WorkoutSessionExercise> exercises = const [],
  }) : _exercises = exercises,
       super._();

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String workoutId;
  @override
  @JsonKey()
  final String workoutName;
  @override
  final DateTime startedAt;
  @override
  final DateTime completedAt;
  @override
  @JsonKey()
  final int totalDurationSeconds;
  @override
  @JsonKey()
  final double totalVolumeKg;
  @override
  @JsonKey()
  final int totalSets;
  @override
  @JsonKey()
  final int totalExercises;
  @override
  @JsonKey()
  final double caloriesBurned;
  @override
  @JsonKey()
  final String notes;
  final List<WorkoutSessionExercise> _exercises;
  @override
  @JsonKey()
  List<WorkoutSessionExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WorkoutSession(id: $id, userId: $userId, workoutId: $workoutId, workoutName: $workoutName, startedAt: $startedAt, completedAt: $completedAt, totalDurationSeconds: $totalDurationSeconds, totalVolumeKg: $totalVolumeKg, totalSets: $totalSets, totalExercises: $totalExercises, caloriesBurned: $caloriesBurned, notes: $notes, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionImpl &&
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

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionImplCopyWith<_$WorkoutSessionImpl> get copyWith =>
      __$$WorkoutSessionImplCopyWithImpl<_$WorkoutSessionImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkoutSession extends WorkoutSession {
  const factory _WorkoutSession({
    final String id,
    final String userId,
    final String workoutId,
    final String workoutName,
    required final DateTime startedAt,
    required final DateTime completedAt,
    final int totalDurationSeconds,
    final double totalVolumeKg,
    final int totalSets,
    final int totalExercises,
    final double caloriesBurned,
    final String notes,
    final List<WorkoutSessionExercise> exercises,
  }) = _$WorkoutSessionImpl;
  const _WorkoutSession._() : super._();

  @override
  String get id;
  @override
  String get userId;
  @override
  String get workoutId;
  @override
  String get workoutName;
  @override
  DateTime get startedAt;
  @override
  DateTime get completedAt;
  @override
  int get totalDurationSeconds;
  @override
  double get totalVolumeKg;
  @override
  int get totalSets;
  @override
  int get totalExercises;
  @override
  double get caloriesBurned;
  @override
  String get notes;
  @override
  List<WorkoutSessionExercise> get exercises;

  /// Create a copy of WorkoutSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionImplCopyWith<_$WorkoutSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
