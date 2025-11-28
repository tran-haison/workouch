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
  $Res call({Workout workout});

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
  $Res call({Object? workout = null}) {
    return _then(
      _value.copyWith(
            workout: null == workout
                ? _value.workout
                : workout // ignore: cast_nullable_to_non_nullable
                      as Workout,
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
  $Res call({Workout workout});

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
  $Res call({Object? workout = null}) {
    return _then(
      _$WorkoutSessionStateImpl(
        workout: null == workout
            ? _value.workout
            : workout // ignore: cast_nullable_to_non_nullable
                  as Workout,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutSessionStateImpl implements _WorkoutSessionState {
  const _$WorkoutSessionStateImpl({this.workout = const Workout()});

  @override
  @JsonKey()
  final Workout workout;

  @override
  String toString() {
    return 'WorkoutSessionState(workout: $workout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionStateImpl &&
            (identical(other.workout, workout) || other.workout == workout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workout);

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
  const factory _WorkoutSessionState({final Workout workout}) =
      _$WorkoutSessionStateImpl;

  @override
  Workout get workout;

  /// Create a copy of WorkoutSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionStateImplCopyWith<_$WorkoutSessionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
