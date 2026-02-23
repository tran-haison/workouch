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
  Map<String, List<WorkoutSession>> get sessionsByMonth =>
      throw _privateConstructorUsedError;
  DateTime? get viewingMonth =>
      throw _privateConstructorUsedError; // Month currently being viewed
  HistoryStats get thisMonthHistoryStats => throw _privateConstructorUsedError;
  HistoryStats get lastMonthHistoryStats => throw _privateConstructorUsedError;
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
    Map<String, List<WorkoutSession>> sessionsByMonth,
    DateTime? viewingMonth,
    HistoryStats thisMonthHistoryStats,
    HistoryStats lastMonthHistoryStats,
    List<ExercisePersonalRecord> personalRecords,
    List<ExercisePersonalRecord> selectedPersonalRecords,
    Error? error,
  });

  $HistoryStatsCopyWith<$Res> get thisMonthHistoryStats;
  $HistoryStatsCopyWith<$Res> get lastMonthHistoryStats;
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
    Object? sessionsByMonth = null,
    Object? viewingMonth = freezed,
    Object? thisMonthHistoryStats = null,
    Object? lastMonthHistoryStats = null,
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
            sessionsByMonth: null == sessionsByMonth
                ? _value.sessionsByMonth
                : sessionsByMonth // ignore: cast_nullable_to_non_nullable
                      as Map<String, List<WorkoutSession>>,
            viewingMonth: freezed == viewingMonth
                ? _value.viewingMonth
                : viewingMonth // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            thisMonthHistoryStats: null == thisMonthHistoryStats
                ? _value.thisMonthHistoryStats
                : thisMonthHistoryStats // ignore: cast_nullable_to_non_nullable
                      as HistoryStats,
            lastMonthHistoryStats: null == lastMonthHistoryStats
                ? _value.lastMonthHistoryStats
                : lastMonthHistoryStats // ignore: cast_nullable_to_non_nullable
                      as HistoryStats,
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
  $HistoryStatsCopyWith<$Res> get thisMonthHistoryStats {
    return $HistoryStatsCopyWith<$Res>(_value.thisMonthHistoryStats, (value) {
      return _then(_value.copyWith(thisMonthHistoryStats: value) as $Val);
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HistoryStatsCopyWith<$Res> get lastMonthHistoryStats {
    return $HistoryStatsCopyWith<$Res>(_value.lastMonthHistoryStats, (value) {
      return _then(_value.copyWith(lastMonthHistoryStats: value) as $Val);
    });
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
    Map<String, List<WorkoutSession>> sessionsByMonth,
    DateTime? viewingMonth,
    HistoryStats thisMonthHistoryStats,
    HistoryStats lastMonthHistoryStats,
    List<ExercisePersonalRecord> personalRecords,
    List<ExercisePersonalRecord> selectedPersonalRecords,
    Error? error,
  });

  @override
  $HistoryStatsCopyWith<$Res> get thisMonthHistoryStats;
  @override
  $HistoryStatsCopyWith<$Res> get lastMonthHistoryStats;
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
    Object? sessionsByMonth = null,
    Object? viewingMonth = freezed,
    Object? thisMonthHistoryStats = null,
    Object? lastMonthHistoryStats = null,
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
        sessionsByMonth: null == sessionsByMonth
            ? _value._sessionsByMonth
            : sessionsByMonth // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<WorkoutSession>>,
        viewingMonth: freezed == viewingMonth
            ? _value.viewingMonth
            : viewingMonth // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        thisMonthHistoryStats: null == thisMonthHistoryStats
            ? _value.thisMonthHistoryStats
            : thisMonthHistoryStats // ignore: cast_nullable_to_non_nullable
                  as HistoryStats,
        lastMonthHistoryStats: null == lastMonthHistoryStats
            ? _value.lastMonthHistoryStats
            : lastMonthHistoryStats // ignore: cast_nullable_to_non_nullable
                  as HistoryStats,
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
    final Map<String, List<WorkoutSession>> sessionsByMonth = const {},
    this.viewingMonth,
    this.thisMonthHistoryStats = const HistoryStats(),
    this.lastMonthHistoryStats = const HistoryStats(),
    final List<ExercisePersonalRecord> personalRecords =
        const <ExercisePersonalRecord>[],
    final List<ExercisePersonalRecord> selectedPersonalRecords =
        const <ExercisePersonalRecord>[],
    this.error,
  }) : _sessionsByMonth = sessionsByMonth,
       _personalRecords = personalRecords,
       _selectedPersonalRecords = selectedPersonalRecords;

  @override
  @JsonKey()
  final HomeStateStatus status;
  @override
  @JsonKey()
  final int weekStreak;
  final Map<String, List<WorkoutSession>> _sessionsByMonth;
  @override
  @JsonKey()
  Map<String, List<WorkoutSession>> get sessionsByMonth {
    if (_sessionsByMonth is EqualUnmodifiableMapView) return _sessionsByMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sessionsByMonth);
  }

  @override
  final DateTime? viewingMonth;
  // Month currently being viewed
  @override
  @JsonKey()
  final HistoryStats thisMonthHistoryStats;
  @override
  @JsonKey()
  final HistoryStats lastMonthHistoryStats;
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
    return 'HomeState(status: $status, weekStreak: $weekStreak, sessionsByMonth: $sessionsByMonth, viewingMonth: $viewingMonth, thisMonthHistoryStats: $thisMonthHistoryStats, lastMonthHistoryStats: $lastMonthHistoryStats, personalRecords: $personalRecords, selectedPersonalRecords: $selectedPersonalRecords, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.weekStreak, weekStreak) ||
                other.weekStreak == weekStreak) &&
            const DeepCollectionEquality().equals(
              other._sessionsByMonth,
              _sessionsByMonth,
            ) &&
            (identical(other.viewingMonth, viewingMonth) ||
                other.viewingMonth == viewingMonth) &&
            (identical(other.thisMonthHistoryStats, thisMonthHistoryStats) ||
                other.thisMonthHistoryStats == thisMonthHistoryStats) &&
            (identical(other.lastMonthHistoryStats, lastMonthHistoryStats) ||
                other.lastMonthHistoryStats == lastMonthHistoryStats) &&
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
    const DeepCollectionEquality().hash(_sessionsByMonth),
    viewingMonth,
    thisMonthHistoryStats,
    lastMonthHistoryStats,
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
    final Map<String, List<WorkoutSession>> sessionsByMonth,
    final DateTime? viewingMonth,
    final HistoryStats thisMonthHistoryStats,
    final HistoryStats lastMonthHistoryStats,
    final List<ExercisePersonalRecord> personalRecords,
    final List<ExercisePersonalRecord> selectedPersonalRecords,
    final Error? error,
  }) = _$HomeStateImpl;

  @override
  HomeStateStatus get status;
  @override
  int get weekStreak;
  @override
  Map<String, List<WorkoutSession>> get sessionsByMonth;
  @override
  DateTime? get viewingMonth; // Month currently being viewed
  @override
  HistoryStats get thisMonthHistoryStats;
  @override
  HistoryStats get lastMonthHistoryStats;
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
