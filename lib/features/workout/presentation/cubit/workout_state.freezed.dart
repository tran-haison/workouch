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
  WorkoutStateStatus get getExercisesStatus =>
      throw _privateConstructorUsedError;
  WorkoutStateStatus get saveWorkoutStatus =>
      throw _privateConstructorUsedError;
  WorkoutStateStatus get getWorkoutsStatus =>
      throw _privateConstructorUsedError;
  WorkoutStateStatus get deleteWorkoutStatus =>
      throw _privateConstructorUsedError;
  WorkoutStateStatus get generateAIWorkoutStatus =>
      throw _privateConstructorUsedError;
  List<Exercise> get exercises => throw _privateConstructorUsedError;
  List<String> get bodyParts => throw _privateConstructorUsedError;
  List<String> get equipments => throw _privateConstructorUsedError;
  List<Workout> get workouts => throw _privateConstructorUsedError;
  Workout get selectedWorkout => throw _privateConstructorUsedError;
  Workout get displayedWorkout => throw _privateConstructorUsedError;
  Workout get aiGeneratedWorkout => throw _privateConstructorUsedError;
  ExerciseFilter get filter => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  int get currentOffset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  Error? get getExercisesError => throw _privateConstructorUsedError;
  Error? get saveWorkoutError => throw _privateConstructorUsedError;
  Error? get getWorkoutsError => throw _privateConstructorUsedError;
  Error? get deleteWorkoutError => throw _privateConstructorUsedError;
  Error? get generateAIWorkoutError => throw _privateConstructorUsedError;

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
    WorkoutStateStatus getExercisesStatus,
    WorkoutStateStatus saveWorkoutStatus,
    WorkoutStateStatus getWorkoutsStatus,
    WorkoutStateStatus deleteWorkoutStatus,
    WorkoutStateStatus generateAIWorkoutStatus,
    List<Exercise> exercises,
    List<String> bodyParts,
    List<String> equipments,
    List<Workout> workouts,
    Workout selectedWorkout,
    Workout displayedWorkout,
    Workout aiGeneratedWorkout,
    ExerciseFilter filter,
    String search,
    int currentOffset,
    int limit,
    bool hasMore,
    Error? getExercisesError,
    Error? saveWorkoutError,
    Error? getWorkoutsError,
    Error? deleteWorkoutError,
    Error? generateAIWorkoutError,
  });

  $WorkoutCopyWith<$Res> get selectedWorkout;
  $WorkoutCopyWith<$Res> get displayedWorkout;
  $WorkoutCopyWith<$Res> get aiGeneratedWorkout;
  $ExerciseFilterCopyWith<$Res> get filter;
  $ErrorCopyWith<$Res>? get getExercisesError;
  $ErrorCopyWith<$Res>? get saveWorkoutError;
  $ErrorCopyWith<$Res>? get getWorkoutsError;
  $ErrorCopyWith<$Res>? get deleteWorkoutError;
  $ErrorCopyWith<$Res>? get generateAIWorkoutError;
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
    Object? getExercisesStatus = null,
    Object? saveWorkoutStatus = null,
    Object? getWorkoutsStatus = null,
    Object? deleteWorkoutStatus = null,
    Object? generateAIWorkoutStatus = null,
    Object? exercises = null,
    Object? bodyParts = null,
    Object? equipments = null,
    Object? workouts = null,
    Object? selectedWorkout = null,
    Object? displayedWorkout = null,
    Object? aiGeneratedWorkout = null,
    Object? filter = null,
    Object? search = null,
    Object? currentOffset = null,
    Object? limit = null,
    Object? hasMore = null,
    Object? getExercisesError = freezed,
    Object? saveWorkoutError = freezed,
    Object? getWorkoutsError = freezed,
    Object? deleteWorkoutError = freezed,
    Object? generateAIWorkoutError = freezed,
  }) {
    return _then(
      _value.copyWith(
            getExercisesStatus: null == getExercisesStatus
                ? _value.getExercisesStatus
                : getExercisesStatus // ignore: cast_nullable_to_non_nullable
                      as WorkoutStateStatus,
            saveWorkoutStatus: null == saveWorkoutStatus
                ? _value.saveWorkoutStatus
                : saveWorkoutStatus // ignore: cast_nullable_to_non_nullable
                      as WorkoutStateStatus,
            getWorkoutsStatus: null == getWorkoutsStatus
                ? _value.getWorkoutsStatus
                : getWorkoutsStatus // ignore: cast_nullable_to_non_nullable
                      as WorkoutStateStatus,
            deleteWorkoutStatus: null == deleteWorkoutStatus
                ? _value.deleteWorkoutStatus
                : deleteWorkoutStatus // ignore: cast_nullable_to_non_nullable
                      as WorkoutStateStatus,
            generateAIWorkoutStatus: null == generateAIWorkoutStatus
                ? _value.generateAIWorkoutStatus
                : generateAIWorkoutStatus // ignore: cast_nullable_to_non_nullable
                      as WorkoutStateStatus,
            exercises: null == exercises
                ? _value.exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                      as List<Exercise>,
            bodyParts: null == bodyParts
                ? _value.bodyParts
                : bodyParts // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            equipments: null == equipments
                ? _value.equipments
                : equipments // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            workouts: null == workouts
                ? _value.workouts
                : workouts // ignore: cast_nullable_to_non_nullable
                      as List<Workout>,
            selectedWorkout: null == selectedWorkout
                ? _value.selectedWorkout
                : selectedWorkout // ignore: cast_nullable_to_non_nullable
                      as Workout,
            displayedWorkout: null == displayedWorkout
                ? _value.displayedWorkout
                : displayedWorkout // ignore: cast_nullable_to_non_nullable
                      as Workout,
            aiGeneratedWorkout: null == aiGeneratedWorkout
                ? _value.aiGeneratedWorkout
                : aiGeneratedWorkout // ignore: cast_nullable_to_non_nullable
                      as Workout,
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
            getExercisesError: freezed == getExercisesError
                ? _value.getExercisesError
                : getExercisesError // ignore: cast_nullable_to_non_nullable
                      as Error?,
            saveWorkoutError: freezed == saveWorkoutError
                ? _value.saveWorkoutError
                : saveWorkoutError // ignore: cast_nullable_to_non_nullable
                      as Error?,
            getWorkoutsError: freezed == getWorkoutsError
                ? _value.getWorkoutsError
                : getWorkoutsError // ignore: cast_nullable_to_non_nullable
                      as Error?,
            deleteWorkoutError: freezed == deleteWorkoutError
                ? _value.deleteWorkoutError
                : deleteWorkoutError // ignore: cast_nullable_to_non_nullable
                      as Error?,
            generateAIWorkoutError: freezed == generateAIWorkoutError
                ? _value.generateAIWorkoutError
                : generateAIWorkoutError // ignore: cast_nullable_to_non_nullable
                      as Error?,
          )
          as $Val,
    );
  }

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get selectedWorkout {
    return $WorkoutCopyWith<$Res>(_value.selectedWorkout, (value) {
      return _then(_value.copyWith(selectedWorkout: value) as $Val);
    });
  }

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get displayedWorkout {
    return $WorkoutCopyWith<$Res>(_value.displayedWorkout, (value) {
      return _then(_value.copyWith(displayedWorkout: value) as $Val);
    });
  }

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkoutCopyWith<$Res> get aiGeneratedWorkout {
    return $WorkoutCopyWith<$Res>(_value.aiGeneratedWorkout, (value) {
      return _then(_value.copyWith(aiGeneratedWorkout: value) as $Val);
    });
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
  $ErrorCopyWith<$Res>? get getExercisesError {
    if (_value.getExercisesError == null) {
      return null;
    }

    return $ErrorCopyWith<$Res>(_value.getExercisesError!, (value) {
      return _then(_value.copyWith(getExercisesError: value) as $Val);
    });
  }

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<$Res>? get saveWorkoutError {
    if (_value.saveWorkoutError == null) {
      return null;
    }

    return $ErrorCopyWith<$Res>(_value.saveWorkoutError!, (value) {
      return _then(_value.copyWith(saveWorkoutError: value) as $Val);
    });
  }

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<$Res>? get getWorkoutsError {
    if (_value.getWorkoutsError == null) {
      return null;
    }

    return $ErrorCopyWith<$Res>(_value.getWorkoutsError!, (value) {
      return _then(_value.copyWith(getWorkoutsError: value) as $Val);
    });
  }

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<$Res>? get deleteWorkoutError {
    if (_value.deleteWorkoutError == null) {
      return null;
    }

    return $ErrorCopyWith<$Res>(_value.deleteWorkoutError!, (value) {
      return _then(_value.copyWith(deleteWorkoutError: value) as $Val);
    });
  }

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<$Res>? get generateAIWorkoutError {
    if (_value.generateAIWorkoutError == null) {
      return null;
    }

    return $ErrorCopyWith<$Res>(_value.generateAIWorkoutError!, (value) {
      return _then(_value.copyWith(generateAIWorkoutError: value) as $Val);
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
    WorkoutStateStatus getExercisesStatus,
    WorkoutStateStatus saveWorkoutStatus,
    WorkoutStateStatus getWorkoutsStatus,
    WorkoutStateStatus deleteWorkoutStatus,
    WorkoutStateStatus generateAIWorkoutStatus,
    List<Exercise> exercises,
    List<String> bodyParts,
    List<String> equipments,
    List<Workout> workouts,
    Workout selectedWorkout,
    Workout displayedWorkout,
    Workout aiGeneratedWorkout,
    ExerciseFilter filter,
    String search,
    int currentOffset,
    int limit,
    bool hasMore,
    Error? getExercisesError,
    Error? saveWorkoutError,
    Error? getWorkoutsError,
    Error? deleteWorkoutError,
    Error? generateAIWorkoutError,
  });

  @override
  $WorkoutCopyWith<$Res> get selectedWorkout;
  @override
  $WorkoutCopyWith<$Res> get displayedWorkout;
  @override
  $WorkoutCopyWith<$Res> get aiGeneratedWorkout;
  @override
  $ExerciseFilterCopyWith<$Res> get filter;
  @override
  $ErrorCopyWith<$Res>? get getExercisesError;
  @override
  $ErrorCopyWith<$Res>? get saveWorkoutError;
  @override
  $ErrorCopyWith<$Res>? get getWorkoutsError;
  @override
  $ErrorCopyWith<$Res>? get deleteWorkoutError;
  @override
  $ErrorCopyWith<$Res>? get generateAIWorkoutError;
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
    Object? getExercisesStatus = null,
    Object? saveWorkoutStatus = null,
    Object? getWorkoutsStatus = null,
    Object? deleteWorkoutStatus = null,
    Object? generateAIWorkoutStatus = null,
    Object? exercises = null,
    Object? bodyParts = null,
    Object? equipments = null,
    Object? workouts = null,
    Object? selectedWorkout = null,
    Object? displayedWorkout = null,
    Object? aiGeneratedWorkout = null,
    Object? filter = null,
    Object? search = null,
    Object? currentOffset = null,
    Object? limit = null,
    Object? hasMore = null,
    Object? getExercisesError = freezed,
    Object? saveWorkoutError = freezed,
    Object? getWorkoutsError = freezed,
    Object? deleteWorkoutError = freezed,
    Object? generateAIWorkoutError = freezed,
  }) {
    return _then(
      _$WorkoutStateImpl(
        getExercisesStatus: null == getExercisesStatus
            ? _value.getExercisesStatus
            : getExercisesStatus // ignore: cast_nullable_to_non_nullable
                  as WorkoutStateStatus,
        saveWorkoutStatus: null == saveWorkoutStatus
            ? _value.saveWorkoutStatus
            : saveWorkoutStatus // ignore: cast_nullable_to_non_nullable
                  as WorkoutStateStatus,
        getWorkoutsStatus: null == getWorkoutsStatus
            ? _value.getWorkoutsStatus
            : getWorkoutsStatus // ignore: cast_nullable_to_non_nullable
                  as WorkoutStateStatus,
        deleteWorkoutStatus: null == deleteWorkoutStatus
            ? _value.deleteWorkoutStatus
            : deleteWorkoutStatus // ignore: cast_nullable_to_non_nullable
                  as WorkoutStateStatus,
        generateAIWorkoutStatus: null == generateAIWorkoutStatus
            ? _value.generateAIWorkoutStatus
            : generateAIWorkoutStatus // ignore: cast_nullable_to_non_nullable
                  as WorkoutStateStatus,
        exercises: null == exercises
            ? _value._exercises
            : exercises // ignore: cast_nullable_to_non_nullable
                  as List<Exercise>,
        bodyParts: null == bodyParts
            ? _value._bodyParts
            : bodyParts // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        equipments: null == equipments
            ? _value._equipments
            : equipments // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        workouts: null == workouts
            ? _value._workouts
            : workouts // ignore: cast_nullable_to_non_nullable
                  as List<Workout>,
        selectedWorkout: null == selectedWorkout
            ? _value.selectedWorkout
            : selectedWorkout // ignore: cast_nullable_to_non_nullable
                  as Workout,
        displayedWorkout: null == displayedWorkout
            ? _value.displayedWorkout
            : displayedWorkout // ignore: cast_nullable_to_non_nullable
                  as Workout,
        aiGeneratedWorkout: null == aiGeneratedWorkout
            ? _value.aiGeneratedWorkout
            : aiGeneratedWorkout // ignore: cast_nullable_to_non_nullable
                  as Workout,
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
        getExercisesError: freezed == getExercisesError
            ? _value.getExercisesError
            : getExercisesError // ignore: cast_nullable_to_non_nullable
                  as Error?,
        saveWorkoutError: freezed == saveWorkoutError
            ? _value.saveWorkoutError
            : saveWorkoutError // ignore: cast_nullable_to_non_nullable
                  as Error?,
        getWorkoutsError: freezed == getWorkoutsError
            ? _value.getWorkoutsError
            : getWorkoutsError // ignore: cast_nullable_to_non_nullable
                  as Error?,
        deleteWorkoutError: freezed == deleteWorkoutError
            ? _value.deleteWorkoutError
            : deleteWorkoutError // ignore: cast_nullable_to_non_nullable
                  as Error?,
        generateAIWorkoutError: freezed == generateAIWorkoutError
            ? _value.generateAIWorkoutError
            : generateAIWorkoutError // ignore: cast_nullable_to_non_nullable
                  as Error?,
      ),
    );
  }
}

/// @nodoc

class _$WorkoutStateImpl implements _WorkoutState {
  const _$WorkoutStateImpl({
    this.getExercisesStatus = WorkoutStateStatus.initial,
    this.saveWorkoutStatus = WorkoutStateStatus.initial,
    this.getWorkoutsStatus = WorkoutStateStatus.initial,
    this.deleteWorkoutStatus = WorkoutStateStatus.initial,
    this.generateAIWorkoutStatus = WorkoutStateStatus.initial,
    final List<Exercise> exercises = const [],
    final List<String> bodyParts = const [],
    final List<String> equipments = const [],
    final List<Workout> workouts = const [],
    this.selectedWorkout = const Workout(),
    this.displayedWorkout = const Workout(),
    this.aiGeneratedWorkout = const Workout(),
    this.filter = const ExerciseFilter(),
    this.search = '',
    this.currentOffset = 0,
    this.limit = 20,
    this.hasMore = true,
    this.getExercisesError,
    this.saveWorkoutError,
    this.getWorkoutsError,
    this.deleteWorkoutError,
    this.generateAIWorkoutError,
  }) : _exercises = exercises,
       _bodyParts = bodyParts,
       _equipments = equipments,
       _workouts = workouts;

  @override
  @JsonKey()
  final WorkoutStateStatus getExercisesStatus;
  @override
  @JsonKey()
  final WorkoutStateStatus saveWorkoutStatus;
  @override
  @JsonKey()
  final WorkoutStateStatus getWorkoutsStatus;
  @override
  @JsonKey()
  final WorkoutStateStatus deleteWorkoutStatus;
  @override
  @JsonKey()
  final WorkoutStateStatus generateAIWorkoutStatus;
  final List<Exercise> _exercises;
  @override
  @JsonKey()
  List<Exercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
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

  final List<Workout> _workouts;
  @override
  @JsonKey()
  List<Workout> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  @JsonKey()
  final Workout selectedWorkout;
  @override
  @JsonKey()
  final Workout displayedWorkout;
  @override
  @JsonKey()
  final Workout aiGeneratedWorkout;
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
  final Error? getExercisesError;
  @override
  final Error? saveWorkoutError;
  @override
  final Error? getWorkoutsError;
  @override
  final Error? deleteWorkoutError;
  @override
  final Error? generateAIWorkoutError;

  @override
  String toString() {
    return 'WorkoutState(getExercisesStatus: $getExercisesStatus, saveWorkoutStatus: $saveWorkoutStatus, getWorkoutsStatus: $getWorkoutsStatus, deleteWorkoutStatus: $deleteWorkoutStatus, generateAIWorkoutStatus: $generateAIWorkoutStatus, exercises: $exercises, bodyParts: $bodyParts, equipments: $equipments, workouts: $workouts, selectedWorkout: $selectedWorkout, displayedWorkout: $displayedWorkout, aiGeneratedWorkout: $aiGeneratedWorkout, filter: $filter, search: $search, currentOffset: $currentOffset, limit: $limit, hasMore: $hasMore, getExercisesError: $getExercisesError, saveWorkoutError: $saveWorkoutError, getWorkoutsError: $getWorkoutsError, deleteWorkoutError: $deleteWorkoutError, generateAIWorkoutError: $generateAIWorkoutError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutStateImpl &&
            (identical(other.getExercisesStatus, getExercisesStatus) ||
                other.getExercisesStatus == getExercisesStatus) &&
            (identical(other.saveWorkoutStatus, saveWorkoutStatus) ||
                other.saveWorkoutStatus == saveWorkoutStatus) &&
            (identical(other.getWorkoutsStatus, getWorkoutsStatus) ||
                other.getWorkoutsStatus == getWorkoutsStatus) &&
            (identical(other.deleteWorkoutStatus, deleteWorkoutStatus) ||
                other.deleteWorkoutStatus == deleteWorkoutStatus) &&
            (identical(
                  other.generateAIWorkoutStatus,
                  generateAIWorkoutStatus,
                ) ||
                other.generateAIWorkoutStatus == generateAIWorkoutStatus) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            const DeepCollectionEquality().equals(
              other._bodyParts,
              _bodyParts,
            ) &&
            const DeepCollectionEquality().equals(
              other._equipments,
              _equipments,
            ) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts) &&
            (identical(other.selectedWorkout, selectedWorkout) ||
                other.selectedWorkout == selectedWorkout) &&
            (identical(other.displayedWorkout, displayedWorkout) ||
                other.displayedWorkout == displayedWorkout) &&
            (identical(other.aiGeneratedWorkout, aiGeneratedWorkout) ||
                other.aiGeneratedWorkout == aiGeneratedWorkout) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.getExercisesError, getExercisesError) ||
                other.getExercisesError == getExercisesError) &&
            (identical(other.saveWorkoutError, saveWorkoutError) ||
                other.saveWorkoutError == saveWorkoutError) &&
            (identical(other.getWorkoutsError, getWorkoutsError) ||
                other.getWorkoutsError == getWorkoutsError) &&
            (identical(other.deleteWorkoutError, deleteWorkoutError) ||
                other.deleteWorkoutError == deleteWorkoutError) &&
            (identical(other.generateAIWorkoutError, generateAIWorkoutError) ||
                other.generateAIWorkoutError == generateAIWorkoutError));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    getExercisesStatus,
    saveWorkoutStatus,
    getWorkoutsStatus,
    deleteWorkoutStatus,
    generateAIWorkoutStatus,
    const DeepCollectionEquality().hash(_exercises),
    const DeepCollectionEquality().hash(_bodyParts),
    const DeepCollectionEquality().hash(_equipments),
    const DeepCollectionEquality().hash(_workouts),
    selectedWorkout,
    displayedWorkout,
    aiGeneratedWorkout,
    filter,
    search,
    currentOffset,
    limit,
    hasMore,
    getExercisesError,
    saveWorkoutError,
    getWorkoutsError,
    deleteWorkoutError,
    generateAIWorkoutError,
  ]);

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
    final WorkoutStateStatus getExercisesStatus,
    final WorkoutStateStatus saveWorkoutStatus,
    final WorkoutStateStatus getWorkoutsStatus,
    final WorkoutStateStatus deleteWorkoutStatus,
    final WorkoutStateStatus generateAIWorkoutStatus,
    final List<Exercise> exercises,
    final List<String> bodyParts,
    final List<String> equipments,
    final List<Workout> workouts,
    final Workout selectedWorkout,
    final Workout displayedWorkout,
    final Workout aiGeneratedWorkout,
    final ExerciseFilter filter,
    final String search,
    final int currentOffset,
    final int limit,
    final bool hasMore,
    final Error? getExercisesError,
    final Error? saveWorkoutError,
    final Error? getWorkoutsError,
    final Error? deleteWorkoutError,
    final Error? generateAIWorkoutError,
  }) = _$WorkoutStateImpl;

  @override
  WorkoutStateStatus get getExercisesStatus;
  @override
  WorkoutStateStatus get saveWorkoutStatus;
  @override
  WorkoutStateStatus get getWorkoutsStatus;
  @override
  WorkoutStateStatus get deleteWorkoutStatus;
  @override
  WorkoutStateStatus get generateAIWorkoutStatus;
  @override
  List<Exercise> get exercises;
  @override
  List<String> get bodyParts;
  @override
  List<String> get equipments;
  @override
  List<Workout> get workouts;
  @override
  Workout get selectedWorkout;
  @override
  Workout get displayedWorkout;
  @override
  Workout get aiGeneratedWorkout;
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
  Error? get getExercisesError;
  @override
  Error? get saveWorkoutError;
  @override
  Error? get getWorkoutsError;
  @override
  Error? get deleteWorkoutError;
  @override
  Error? get generateAIWorkoutError;

  /// Create a copy of WorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutStateImplCopyWith<_$WorkoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
