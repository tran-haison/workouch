// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkoutSessionState {
  Workout get workout => throw _privateConstructorUsedError;
  int get currentExerciseIndex => throw _privateConstructorUsedError;
  Map<String, int> get setIndexTracker =>
      throw _privateConstructorUsedError; // {exerciseId: currSetIdx}
  Duration get totalTime => throw _privateConstructorUsedError;
  Duration get restSetsRemain => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSessionStateCopyWith<WorkoutSessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionStateCopyWith<$Res> {
  factory $WorkoutSessionStateCopyWith(
    WorkoutSessionState value,
    $Res Function(WorkoutSessionState) then,
  ) = _$WorkoutSessionStateCopyWithImpl<$Res, WorkoutSessionState>;
  @useResult
  $Res call({
    Workout workout,
    int currentExerciseIndex,
    Map<String, int> setIndexTracker,
    Duration totalTime,
    Duration restSetsRemain,
  });

  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class _$WorkoutSessionStateCopyWithImpl<$Res, $Val extends WorkoutSessionState>
    implements $WorkoutSessionStateCopyWith<$Res> {
  _$WorkoutSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
    Object? currentExerciseIndex = null,
    Object? setIndexTracker = null,
    Object? totalTime = null,
    Object? restSetsRemain = null,
  }) {
    return _then(
      _value.copyWith(
            workout: null == workout
                ? _value.workout
                : workout // ignore: cast_nullable_to_non_nullable
                      as Workout,
            currentExerciseIndex: null == currentExerciseIndex
                ? _value.currentExerciseIndex
                : currentExerciseIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            setIndexTracker: null == setIndexTracker
                ? _value.setIndexTracker
                : setIndexTracker // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            totalTime: null == totalTime
                ? _value.totalTime
                : totalTime // ignore: cast_nullable_to_non_nullable
                      as Duration,
            restSetsRemain: null == restSetsRemain
                ? _value.restSetsRemain
                : restSetsRemain // ignore: cast_nullable_to_non_nullable
                      as Duration,
          )
          as $Val,
    );
  }

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get workout {
    return $WorkoutCopyWith<$Res>(_value.workout, (value) {
      return _then(_value.copyWith(workout: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkoutSessionStateImplCopyWith<$Res>
    implements $WorkoutSessionStateCopyWith<$Res> {
  factory _$$WorkoutSessionStateImplCopyWith(
    _$WorkoutSessionStateImpl value,
    $Res Function(_$WorkoutSessionStateImpl) then,
  ) = __$$WorkoutSessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Workout workout,
    int currentExerciseIndex,
    Map<String, int> setIndexTracker,
    Duration totalTime,
    Duration restSetsRemain,
  });

  @override
  $WorkoutCopyWith<$Res> get workout;
}

/// @nodoc
class __$$WorkoutSessionStateImplCopyWithImpl<$Res>
    extends _$WorkoutSessionStateCopyWithImpl<$Res, _$WorkoutSessionStateImpl>
    implements _$$WorkoutSessionStateImplCopyWith<$Res> {
  __$$WorkoutSessionStateImplCopyWithImpl(
    _$WorkoutSessionStateImpl _value,
    $Res Function(_$WorkoutSessionStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workout = null,
    Object? currentExerciseIndex = null,
    Object? setIndexTracker = null,
    Object? totalTime = null,
    Object? restSetsRemain = null,
  }) {
    return _then(
      _$WorkoutSessionStateImpl(
        workout: null == workout
            ? _value.workout
            : workout // ignore: cast_nullable_to_non_nullable
                  as Workout,
        currentExerciseIndex: null == currentExerciseIndex
            ? _value.currentExerciseIndex
            : currentExerciseIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        setIndexTracker: null == setIndexTracker
            ? _value._setIndexTracker
            : setIndexTracker // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        totalTime: null == totalTime
            ? _value.totalTime
            : totalTime // ignore: cast_nullable_to_non_nullable
                  as Duration,
        restSetsRemain: null == restSetsRemain
            ? _value.restSetsRemain
            : restSetsRemain // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutSessionStateImpl implements _WorkoutSessionState {
  const _$WorkoutSessionStateImpl({
    this.workout = const Workout(),
    this.currentExerciseIndex = 0,
    final Map<String, int> setIndexTracker = const {},
    this.totalTime = Duration.zero,
    this.restSetsRemain = Duration.zero,
  }) : _setIndexTracker = setIndexTracker;

  @override
  @JsonKey()
  final Workout workout;
  @override
  @JsonKey()
  final int currentExerciseIndex;
  final Map<String, int> _setIndexTracker;
  @override
  @JsonKey()
  Map<String, int> get setIndexTracker {
    if (_setIndexTracker is EqualUnmodifiableMapView) return _setIndexTracker;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_setIndexTracker);
  }

  // {exerciseId: currSetIdx}
  @override
  @JsonKey()
  final Duration totalTime;
  @override
  @JsonKey()
  final Duration restSetsRemain;

  @override
  String toString() {
    return 'WorkoutSessionState(workout: $workout, currentExerciseIndex: $currentExerciseIndex, setIndexTracker: $setIndexTracker, totalTime: $totalTime, restSetsRemain: $restSetsRemain)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionStateImpl &&
            (identical(other.workout, workout) || other.workout == workout) &&
            (identical(other.currentExerciseIndex, currentExerciseIndex) ||
                other.currentExerciseIndex == currentExerciseIndex) &&
            const DeepCollectionEquality().equals(
              other._setIndexTracker,
              _setIndexTracker,
            ) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            (identical(other.restSetsRemain, restSetsRemain) ||
                other.restSetsRemain == restSetsRemain));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    workout,
    currentExerciseIndex,
    const DeepCollectionEquality().hash(_setIndexTracker),
    totalTime,
    restSetsRemain,
  );

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionStateImplCopyWith<_$WorkoutSessionStateImpl> get copyWith =>
      __$$WorkoutSessionStateImplCopyWithImpl<_$WorkoutSessionStateImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkoutSessionState implements WorkoutSessionState {
  const factory _WorkoutSessionState({
    final Workout workout,
    final int currentExerciseIndex,
    final Map<String, int> setIndexTracker,
    final Duration totalTime,
    final Duration restSetsRemain,
  }) = _$WorkoutSessionStateImpl;

  @override
  Workout get workout;
  @override
  int get currentExerciseIndex;
  @override
  Map<String, int> get setIndexTracker; // {exerciseId: currSetIdx}
  @override
  Duration get totalTime;
  @override
  Duration get restSetsRemain;

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionStateImplCopyWith<_$WorkoutSessionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
