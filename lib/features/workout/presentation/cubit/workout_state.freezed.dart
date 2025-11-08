// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkoutState {
  WorkoutStateStatus get status => throw _privateConstructorUsedError;
  List<Exercise> get exercises => throw _privateConstructorUsedError;
  List<WorkingExercise> get selectedExercises =>
      throw _privateConstructorUsedError;
  List<String> get bodyParts => throw _privateConstructorUsedError;
  List<String> get equipments => throw _privateConstructorUsedError;
  ExerciseFilter get filter => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  int get currentOffset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutStateCopyWith<WorkoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutStateCopyWith<$Res> {
  factory $WorkoutStateCopyWith(
    WorkoutState value,
    $Res Function(WorkoutState) then,
  ) = _$WorkoutStateCopyWithImpl<$Res, WorkoutState>;
  @useResult
  $Res call({
    WorkoutStateStatus status,
    List<Exercise> exercises,
    List<WorkingExercise> selectedExercises,
    List<String> bodyParts,
    List<String> equipments,
    ExerciseFilter filter,
    String search,
    int currentOffset,
    int limit,
    bool hasMore,
    Error? error,
  });

  $ExerciseFilterCopyWith<$Res> get filter;
  $ErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$WorkoutStateCopyWithImpl<$Res, $Val extends WorkoutState>
    implements $WorkoutStateCopyWith<$Res> {
  _$WorkoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? exercises = null,
    Object? selectedExercises = null,
    Object? bodyParts = null,
    Object? equipments = null,
    Object? filter = null,
    Object? search = null,
    Object? currentOffset = null,
    Object? limit = null,
    Object? hasMore = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as WorkoutStateStatus,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<Exercise>,
            selectedExercises: null == selectedExercises
                ? _value.selectedExercises
                : selectedExercises // ignore: cast_nullable_to_non_nullable
                      as List<WorkingExercise>,
            bodyParts: null == bodyParts
                ? _value.bodyParts
                : bodyParts // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            equipments: null == equipments
                ? _value.equipments
                : equipments // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            filter: null == filter
                ? _value.filter
                : filter // ignore: cast_nullable_to_non_nullable
                      as ExerciseFilter,
            search: null == search
                ? _value.search
                : search // ignore: cast_nullable_to_non_nullable
                      as String,
            currentOffset: null == currentOffset
                ? _value.currentOffset
                : currentOffset // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as Error?,
          )
          as $Val,
    );
  }

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExerciseFilterCopyWith<$Res> get filter {
    return $ExerciseFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  /// Create a copy of WorkoutState
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
abstract class _$$WorkoutStateImplCopyWith<$Res>
    implements $WorkoutStateCopyWith<$Res> {
  factory _$$WorkoutStateImplCopyWith(
    _$WorkoutStateImpl value,
    $Res Function(_$WorkoutStateImpl) then,
  ) = __$$WorkoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    WorkoutStateStatus status,
    List<Exercise> exercises,
    List<WorkingExercise> selectedExercises,
    List<String> bodyParts,
    List<String> equipments,
    ExerciseFilter filter,
    String search,
    int currentOffset,
    int limit,
    bool hasMore,
    Error? error,
  });

  @override
  $ExerciseFilterCopyWith<$Res> get filter;
  @override
  $ErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$WorkoutStateImplCopyWithImpl<$Res>
    extends _$WorkoutStateCopyWithImpl<$Res, _$WorkoutStateImpl>
    implements _$$WorkoutStateImplCopyWith<$Res> {
  __$$WorkoutStateImplCopyWithImpl(
    _$WorkoutStateImpl _value,
    $Res Function(_$WorkoutStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? exercises = null,
    Object? selectedExercises = null,
    Object? bodyParts = null,
    Object? equipments = null,
    Object? filter = null,
    Object? search = null,
    Object? currentOffset = null,
    Object? limit = null,
    Object? hasMore = null,
    Object? error = freezed,
  }) {
    return _then(
      _$WorkoutStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as WorkoutStateStatus,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<Exercise>,
        selectedExercises: null == selectedExercises
            ? _value._selectedExercises
            : selectedExercises // ignore: cast_nullable_to_non_nullable
                  as List<WorkingExercise>,
        bodyParts: null == bodyParts
            ? _value._bodyParts
            : bodyParts // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        equipments: null == equipments
            ? _value._equipments
            : equipments // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        filter: null == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as ExerciseFilter,
        search: null == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String,
        currentOffset: null == currentOffset
            ? _value.currentOffset
            : currentOffset // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Error?,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutStateImpl implements _WorkoutState {
  const _$WorkoutStateImpl({
    this.status = WorkoutStateStatus.initial,
    final List<Exercise> exercises = const [],
    final List<WorkingExercise> selectedExercises = const [],
    final List<String> bodyParts = const [],
    final List<String> equipments = const [],
    this.filter = const ExerciseFilter(),
    this.search = '',
    this.currentOffset = 0,
    this.limit = 20,
    this.hasMore = true,
    this.error,
  }) : _exercises = exercises,
       _selectedExercises = selectedExercises,
       _bodyParts = bodyParts,
       _equipments = equipments;

  @override
  @JsonKey()
  final WorkoutStateStatus status;
  final List<Exercise> _exercises;
  @override
  @JsonKey()
  List<Exercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  final List<WorkingExercise> _selectedExercises;
  @override
  @JsonKey()
  List<WorkingExercise> get selectedExercises {
    if (_selectedExercises is EqualUnmodifiableListView)
      return _selectedExercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedExercises);
  }

  final List<String> _bodyParts;
  @override
  @JsonKey()
  List<String> get bodyParts {
    if (_bodyParts is EqualUnmodifiableListView) return _bodyParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bodyParts);
  }

  final List<String> _equipments;
  @override
  @JsonKey()
  List<String> get equipments {
    if (_equipments is EqualUnmodifiableListView) return _equipments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipments);
  }

  @override
  @JsonKey()
  final ExerciseFilter filter;
  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final int currentOffset;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  final Error? error;

  @override
  String toString() {
    return 'WorkoutState(status: $status, exercises: $exercises, selectedExercises: $selectedExercises, bodyParts: $bodyParts, equipments: $equipments, filter: $filter, search: $search, currentOffset: $currentOffset, limit: $limit, hasMore: $hasMore, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            const DeepCollectionEquality().equals(
              other._selectedExercises,
              _selectedExercises,
            ) &&
            const DeepCollectionEquality().equals(
              other._bodyParts,
              _bodyParts,
            ) &&
            const DeepCollectionEquality().equals(
              other._equipments,
              _equipments,
            ) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_exercises),
    const DeepCollectionEquality().hash(_selectedExercises),
    const DeepCollectionEquality().hash(_bodyParts),
    const DeepCollectionEquality().hash(_equipments),
    filter,
    search,
    currentOffset,
    limit,
    hasMore,
    error,
  );

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutStateImplCopyWith<_$WorkoutStateImpl> get copyWith =>
      __$$WorkoutStateImplCopyWithImpl<_$WorkoutStateImpl>(this, _$identity);
}

abstract class _WorkoutState implements WorkoutState {
  const factory _WorkoutState({
    final WorkoutStateStatus status,
    final List<Exercise> exercises,
    final List<WorkingExercise> selectedExercises,
    final List<String> bodyParts,
    final List<String> equipments,
    final ExerciseFilter filter,
    final String search,
    final int currentOffset,
    final int limit,
    final bool hasMore,
    final Error? error,
  }) = _$WorkoutStateImpl;

  @override
  WorkoutStateStatus get status;
  @override
  List<Exercise> get exercises;
  @override
  List<WorkingExercise> get selectedExercises;
  @override
  List<String> get bodyParts;
  @override
  List<String> get equipments;
  @override
  ExerciseFilter get filter;
  @override
  String get search;
  @override
  int get currentOffset;
  @override
  int get limit;
  @override
  bool get hasMore;
  @override
  Error? get error;

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutStateImplCopyWith<_$WorkoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
