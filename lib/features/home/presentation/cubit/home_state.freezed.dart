// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  HomeStateStatus get status => throw _privateConstructorUsedError;
  int get weekStreak => throw _privateConstructorUsedError;
  List<WorkoutSession> get sessions => throw _privateConstructorUsedError;
  List<ExercisePersonalRecord> get personalRecords =>
      throw _privateConstructorUsedError;
  List<ExercisePersonalRecord> get selectedPersonalRecords =>
      throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    HomeStateStatus status,
    int weekStreak,
    List<WorkoutSession> sessions,
    List<ExercisePersonalRecord> personalRecords,
    List<ExercisePersonalRecord> selectedPersonalRecords,
    Error? error,
  });

  $ErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? weekStreak = null,
    Object? sessions = null,
    Object? personalRecords = null,
    Object? selectedPersonalRecords = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as HomeStateStatus,
            weekStreak: null == weekStreak
                ? _value.weekStreak
                : weekStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            sessions: null == sessions
                ? _value.sessions
                : sessions // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutSession>,
            personalRecords: null == personalRecords
                ? _value.personalRecords
                : personalRecords // ignore: cast_nullable_to_non_nullable
                      as List<ExercisePersonalRecord>,
            selectedPersonalRecords: null == selectedPersonalRecords
                ? _value.selectedPersonalRecords
                : selectedPersonalRecords // ignore: cast_nullable_to_non_nullable
                      as List<ExercisePersonalRecord>,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as Error?,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    HomeStateStatus status,
    int weekStreak,
    List<WorkoutSession> sessions,
    List<ExercisePersonalRecord> personalRecords,
    List<ExercisePersonalRecord> selectedPersonalRecords,
    Error? error,
  });

  @override
  $ErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? weekStreak = null,
    Object? sessions = null,
    Object? personalRecords = null,
    Object? selectedPersonalRecords = null,
    Object? error = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as HomeStateStatus,
        weekStreak: null == weekStreak
            ? _value.weekStreak
            : weekStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        sessions: null == sessions
            ? _value._sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutSession>,
        personalRecords: null == personalRecords
            ? _value._personalRecords
            : personalRecords // ignore: cast_nullable_to_non_nullable
                  as List<ExercisePersonalRecord>,
        selectedPersonalRecords: null == selectedPersonalRecords
            ? _value._selectedPersonalRecords
            : selectedPersonalRecords // ignore: cast_nullable_to_non_nullable
                  as List<ExercisePersonalRecord>,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Error?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    this.status = HomeStateStatus.initial,
    this.weekStreak = 0,
    final List<WorkoutSession> sessions = const <WorkoutSession>[],
    final List<ExercisePersonalRecord> personalRecords =
        const <ExercisePersonalRecord>[],
    final List<ExercisePersonalRecord> selectedPersonalRecords =
        const <ExercisePersonalRecord>[],
    this.error,
  }) : _sessions = sessions,
       _personalRecords = personalRecords,
       _selectedPersonalRecords = selectedPersonalRecords;

  @override
  @JsonKey()
  final HomeStateStatus status;
  @override
  @JsonKey()
  final int weekStreak;
  final List<WorkoutSession> _sessions;
  @override
  @JsonKey()
  List<WorkoutSession> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  final List<ExercisePersonalRecord> _personalRecords;
  @override
  @JsonKey()
  List<ExercisePersonalRecord> get personalRecords {
    if (_personalRecords is EqualUnmodifiableListView) return _personalRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_personalRecords);
  }

  final List<ExercisePersonalRecord> _selectedPersonalRecords;
  @override
  @JsonKey()
  List<ExercisePersonalRecord> get selectedPersonalRecords {
    if (_selectedPersonalRecords is EqualUnmodifiableListView)
      return _selectedPersonalRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPersonalRecords);
  }

  @override
  final Error? error;

  @override
  String toString() {
    return 'HomeState(status: $status, weekStreak: $weekStreak, sessions: $sessions, personalRecords: $personalRecords, selectedPersonalRecords: $selectedPersonalRecords, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.weekStreak, weekStreak) ||
                other.weekStreak == weekStreak) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            const DeepCollectionEquality().equals(
              other._personalRecords,
              _personalRecords,
            ) &&
            const DeepCollectionEquality().equals(
              other._selectedPersonalRecords,
              _selectedPersonalRecords,
            ) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    weekStreak,
    const DeepCollectionEquality().hash(_sessions),
    const DeepCollectionEquality().hash(_personalRecords),
    const DeepCollectionEquality().hash(_selectedPersonalRecords),
    error,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    final HomeStateStatus status,
    final int weekStreak,
    final List<WorkoutSession> sessions,
    final List<ExercisePersonalRecord> personalRecords,
    final List<ExercisePersonalRecord> selectedPersonalRecords,
    final Error? error,
  }) = _$HomeStateImpl;

  @override
  HomeStateStatus get status;
  @override
  int get weekStreak;
  @override
  List<WorkoutSession> get sessions;
  @override
  List<ExercisePersonalRecord> get personalRecords;
  @override
  List<ExercisePersonalRecord> get selectedPersonalRecords;
  @override
  Error? get error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
