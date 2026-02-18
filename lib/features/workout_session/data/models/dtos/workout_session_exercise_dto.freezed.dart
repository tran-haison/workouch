// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_exercise_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkoutSessionExerciseDto _$WorkoutSessionExerciseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _WorkoutSessionExerciseDto.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSessionExerciseDto {
  String get id => throw _privateConstructorUsedError;
  String get workoutSessionId => throw _privateConstructorUsedError;
  int get exerciseOrder => throw _privateConstructorUsedError;
  String get exerciseId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get gifUrl => throw _privateConstructorUsedError;
  String get setType => throw _privateConstructorUsedError;
  List<WorkingSetDto> get sets => throw _privateConstructorUsedError;
  int get restTimeBetweenSets => throw _privateConstructorUsedError;
  double get totalVolumeKg => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSessionExerciseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSessionExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSessionExerciseDtoCopyWith<WorkoutSessionExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionExerciseDtoCopyWith<$Res> {
  factory $WorkoutSessionExerciseDtoCopyWith(
    WorkoutSessionExerciseDto value,
    $Res Function(WorkoutSessionExerciseDto) then,
  ) = _$WorkoutSessionExerciseDtoCopyWithImpl<$Res, WorkoutSessionExerciseDto>;
  @useResult
  $Res call({
    String id,
    String workoutSessionId,
    int exerciseOrder,
    String exerciseId,
    String name,
    String gifUrl,
    String setType,
    List<WorkingSetDto> sets,
    int restTimeBetweenSets,
    double totalVolumeKg,
  });
}

/// @nodoc
class _$WorkoutSessionExerciseDtoCopyWithImpl<
  $Res,
  $Val extends WorkoutSessionExerciseDto
>
    implements $WorkoutSessionExerciseDtoCopyWith<$Res> {
  _$WorkoutSessionExerciseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSessionExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workoutSessionId = null,
    Object? exerciseOrder = null,
    Object? exerciseId = null,
    Object? name = null,
    Object? gifUrl = null,
    Object? setType = null,
    Object? sets = null,
    Object? restTimeBetweenSets = null,
    Object? totalVolumeKg = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            workoutSessionId: null == workoutSessionId
                ? _value.workoutSessionId
                : workoutSessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            exerciseOrder: null == exerciseOrder
                ? _value.exerciseOrder
                : exerciseOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            exerciseId: null == exerciseId
                ? _value.exerciseId
                : exerciseId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            gifUrl: null == gifUrl
                ? _value.gifUrl
                : gifUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            setType: null == setType
                ? _value.setType
                : setType // ignore: cast_nullable_to_non_nullable
                      as String,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as List<WorkingSetDto>,
            restTimeBetweenSets: null == restTimeBetweenSets
                ? _value.restTimeBetweenSets
                : restTimeBetweenSets // ignore: cast_nullable_to_non_nullable
                      as int,
            totalVolumeKg: null == totalVolumeKg
                ? _value.totalVolumeKg
                : totalVolumeKg // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkoutSessionExerciseDtoImplCopyWith<$Res>
    implements $WorkoutSessionExerciseDtoCopyWith<$Res> {
  factory _$$WorkoutSessionExerciseDtoImplCopyWith(
    _$WorkoutSessionExerciseDtoImpl value,
    $Res Function(_$WorkoutSessionExerciseDtoImpl) then,
  ) = __$$WorkoutSessionExerciseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String workoutSessionId,
    int exerciseOrder,
    String exerciseId,
    String name,
    String gifUrl,
    String setType,
    List<WorkingSetDto> sets,
    int restTimeBetweenSets,
    double totalVolumeKg,
  });
}

/// @nodoc
class __$$WorkoutSessionExerciseDtoImplCopyWithImpl<$Res>
    extends
        _$WorkoutSessionExerciseDtoCopyWithImpl<
          $Res,
          _$WorkoutSessionExerciseDtoImpl
        >
    implements _$$WorkoutSessionExerciseDtoImplCopyWith<$Res> {
  __$$WorkoutSessionExerciseDtoImplCopyWithImpl(
    _$WorkoutSessionExerciseDtoImpl _value,
    $Res Function(_$WorkoutSessionExerciseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkoutSessionExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workoutSessionId = null,
    Object? exerciseOrder = null,
    Object? exerciseId = null,
    Object? name = null,
    Object? gifUrl = null,
    Object? setType = null,
    Object? sets = null,
    Object? restTimeBetweenSets = null,
    Object? totalVolumeKg = null,
  }) {
    return _then(
      _$WorkoutSessionExerciseDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        workoutSessionId: null == workoutSessionId
            ? _value.workoutSessionId
            : workoutSessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        exerciseOrder: null == exerciseOrder
            ? _value.exerciseOrder
            : exerciseOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        exerciseId: null == exerciseId
            ? _value.exerciseId
            : exerciseId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        gifUrl: null == gifUrl
            ? _value.gifUrl
            : gifUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        setType: null == setType
            ? _value.setType
            : setType // ignore: cast_nullable_to_non_nullable
                  as String,
        sets: null == sets
            ? _value._sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as List<WorkingSetDto>,
        restTimeBetweenSets: null == restTimeBetweenSets
            ? _value.restTimeBetweenSets
            : restTimeBetweenSets // ignore: cast_nullable_to_non_nullable
                  as int,
        totalVolumeKg: null == totalVolumeKg
            ? _value.totalVolumeKg
            : totalVolumeKg // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WorkoutSessionExerciseDtoImpl implements _WorkoutSessionExerciseDto {
  const _$WorkoutSessionExerciseDtoImpl({
    required this.id,
    required this.workoutSessionId,
    required this.exerciseOrder,
    required this.exerciseId,
    required this.name,
    required this.gifUrl,
    required this.setType,
    required final List<WorkingSetDto> sets,
    required this.restTimeBetweenSets,
    required this.totalVolumeKg,
  }) : _sets = sets;

  factory _$WorkoutSessionExerciseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSessionExerciseDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String workoutSessionId;
  @override
  final int exerciseOrder;
  @override
  final String exerciseId;
  @override
  final String name;
  @override
  final String gifUrl;
  @override
  final String setType;
  final List<WorkingSetDto> _sets;
  @override
  List<WorkingSetDto> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  final int restTimeBetweenSets;
  @override
  final double totalVolumeKg;

  @override
  String toString() {
    return 'WorkoutSessionExerciseDto(id: $id, workoutSessionId: $workoutSessionId, exerciseOrder: $exerciseOrder, exerciseId: $exerciseId, name: $name, gifUrl: $gifUrl, setType: $setType, sets: $sets, restTimeBetweenSets: $restTimeBetweenSets, totalVolumeKg: $totalVolumeKg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionExerciseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workoutSessionId, workoutSessionId) ||
                other.workoutSessionId == workoutSessionId) &&
            (identical(other.exerciseOrder, exerciseOrder) ||
                other.exerciseOrder == exerciseOrder) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gifUrl, gifUrl) || other.gifUrl == gifUrl) &&
            (identical(other.setType, setType) || other.setType == setType) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.restTimeBetweenSets, restTimeBetweenSets) ||
                other.restTimeBetweenSets == restTimeBetweenSets) &&
            (identical(other.totalVolumeKg, totalVolumeKg) ||
                other.totalVolumeKg == totalVolumeKg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    workoutSessionId,
    exerciseOrder,
    exerciseId,
    name,
    gifUrl,
    setType,
    const DeepCollectionEquality().hash(_sets),
    restTimeBetweenSets,
    totalVolumeKg,
  );

  /// Create a copy of WorkoutSessionExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionExerciseDtoImplCopyWith<_$WorkoutSessionExerciseDtoImpl>
  get copyWith =>
      __$$WorkoutSessionExerciseDtoImplCopyWithImpl<
        _$WorkoutSessionExerciseDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSessionExerciseDtoImplToJson(this);
  }
}

abstract class _WorkoutSessionExerciseDto implements WorkoutSessionExerciseDto {
  const factory _WorkoutSessionExerciseDto({
    required final String id,
    required final String workoutSessionId,
    required final int exerciseOrder,
    required final String exerciseId,
    required final String name,
    required final String gifUrl,
    required final String setType,
    required final List<WorkingSetDto> sets,
    required final int restTimeBetweenSets,
    required final double totalVolumeKg,
  }) = _$WorkoutSessionExerciseDtoImpl;

  factory _WorkoutSessionExerciseDto.fromJson(Map<String, dynamic> json) =
      _$WorkoutSessionExerciseDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get workoutSessionId;
  @override
  int get exerciseOrder;
  @override
  String get exerciseId;
  @override
  String get name;
  @override
  String get gifUrl;
  @override
  String get setType;
  @override
  List<WorkingSetDto> get sets;
  @override
  int get restTimeBetweenSets;
  @override
  double get totalVolumeKg;

  /// Create a copy of WorkoutSessionExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionExerciseDtoImplCopyWith<_$WorkoutSessionExerciseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
