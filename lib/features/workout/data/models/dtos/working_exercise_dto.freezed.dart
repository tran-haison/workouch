// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'working_exercise_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkingExerciseDto _$WorkingExerciseDtoFromJson(Map<String, dynamic> json) {
  return _WorkingExerciseDto.fromJson(json);
}

/// @nodoc
mixin _$WorkingExerciseDto {
  int get exerciseOrder => throw _privateConstructorUsedError;
  String get exerciseId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get gifUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get targetMuscles => throw _privateConstructorUsedError;
  List<String> get bodyParts => throw _privateConstructorUsedError;
  List<String> get equipments => throw _privateConstructorUsedError;
  List<String> get secondaryMuscles => throw _privateConstructorUsedError;
  List<String> get instructions => throw _privateConstructorUsedError;
  List<WorkingSetDto> get sets => throw _privateConstructorUsedError;
  int get restTimeBetweenSets =>
      throw _privateConstructorUsedError; // in seconds
  String? get setType => throw _privateConstructorUsedError;

  /// Serializes this WorkingExerciseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkingExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkingExerciseDtoCopyWith<WorkingExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkingExerciseDtoCopyWith<$Res> {
  factory $WorkingExerciseDtoCopyWith(
    WorkingExerciseDto value,
    $Res Function(WorkingExerciseDto) then,
  ) = _$WorkingExerciseDtoCopyWithImpl<$Res, WorkingExerciseDto>;
  @useResult
  $Res call({
    int exerciseOrder,
    String exerciseId,
    String name,
    String gifUrl,
    String description,
    List<String> targetMuscles,
    List<String> bodyParts,
    List<String> equipments,
    List<String> secondaryMuscles,
    List<String> instructions,
    List<WorkingSetDto> sets,
    int restTimeBetweenSets,
    String? setType,
  });
}

/// @nodoc
class _$WorkingExerciseDtoCopyWithImpl<$Res, $Val extends WorkingExerciseDto>
    implements $WorkingExerciseDtoCopyWith<$Res> {
  _$WorkingExerciseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkingExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseOrder = null,
    Object? exerciseId = null,
    Object? name = null,
    Object? gifUrl = null,
    Object? description = null,
    Object? targetMuscles = null,
    Object? bodyParts = null,
    Object? equipments = null,
    Object? secondaryMuscles = null,
    Object? instructions = null,
    Object? sets = null,
    Object? restTimeBetweenSets = null,
    Object? setType = freezed,
  }) {
    return _then(
      _value.copyWith(
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            targetMuscles: null == targetMuscles
                ? _value.targetMuscles
                : targetMuscles // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            bodyParts: null == bodyParts
                ? _value.bodyParts
                : bodyParts // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            equipments: null == equipments
                ? _value.equipments
                : equipments // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            secondaryMuscles: null == secondaryMuscles
                ? _value.secondaryMuscles
                : secondaryMuscles // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            instructions: null == instructions
                ? _value.instructions
                : instructions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            sets: null == sets
                ? _value.sets
                : sets // ignore: cast_nullable_to_non_nullable
                      as List<WorkingSetDto>,
            restTimeBetweenSets: null == restTimeBetweenSets
                ? _value.restTimeBetweenSets
                : restTimeBetweenSets // ignore: cast_nullable_to_non_nullable
                      as int,
            setType: freezed == setType
                ? _value.setType
                : setType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkingExerciseDtoImplCopyWith<$Res>
    implements $WorkingExerciseDtoCopyWith<$Res> {
  factory _$$WorkingExerciseDtoImplCopyWith(
    _$WorkingExerciseDtoImpl value,
    $Res Function(_$WorkingExerciseDtoImpl) then,
  ) = __$$WorkingExerciseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int exerciseOrder,
    String exerciseId,
    String name,
    String gifUrl,
    String description,
    List<String> targetMuscles,
    List<String> bodyParts,
    List<String> equipments,
    List<String> secondaryMuscles,
    List<String> instructions,
    List<WorkingSetDto> sets,
    int restTimeBetweenSets,
    String? setType,
  });
}

/// @nodoc
class __$$WorkingExerciseDtoImplCopyWithImpl<$Res>
    extends _$WorkingExerciseDtoCopyWithImpl<$Res, _$WorkingExerciseDtoImpl>
    implements _$$WorkingExerciseDtoImplCopyWith<$Res> {
  __$$WorkingExerciseDtoImplCopyWithImpl(
    _$WorkingExerciseDtoImpl _value,
    $Res Function(_$WorkingExerciseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkingExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseOrder = null,
    Object? exerciseId = null,
    Object? name = null,
    Object? gifUrl = null,
    Object? description = null,
    Object? targetMuscles = null,
    Object? bodyParts = null,
    Object? equipments = null,
    Object? secondaryMuscles = null,
    Object? instructions = null,
    Object? sets = null,
    Object? restTimeBetweenSets = null,
    Object? setType = freezed,
  }) {
    return _then(
      _$WorkingExerciseDtoImpl(
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
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        targetMuscles: null == targetMuscles
            ? _value._targetMuscles
            : targetMuscles // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        bodyParts: null == bodyParts
            ? _value._bodyParts
            : bodyParts // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        equipments: null == equipments
            ? _value._equipments
            : equipments // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        secondaryMuscles: null == secondaryMuscles
            ? _value._secondaryMuscles
            : secondaryMuscles // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        instructions: null == instructions
            ? _value._instructions
            : instructions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        sets: null == sets
            ? _value._sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as List<WorkingSetDto>,
        restTimeBetweenSets: null == restTimeBetweenSets
            ? _value.restTimeBetweenSets
            : restTimeBetweenSets // ignore: cast_nullable_to_non_nullable
                  as int,
        setType: freezed == setType
            ? _value.setType
            : setType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkingExerciseDtoImpl implements _WorkingExerciseDto {
  const _$WorkingExerciseDtoImpl({
    required this.exerciseOrder,
    required this.exerciseId,
    required this.name,
    required this.gifUrl,
    required this.description,
    required final List<String> targetMuscles,
    required final List<String> bodyParts,
    required final List<String> equipments,
    required final List<String> secondaryMuscles,
    required final List<String> instructions,
    required final List<WorkingSetDto> sets,
    required this.restTimeBetweenSets,
    this.setType,
  }) : _targetMuscles = targetMuscles,
       _bodyParts = bodyParts,
       _equipments = equipments,
       _secondaryMuscles = secondaryMuscles,
       _instructions = instructions,
       _sets = sets;

  factory _$WorkingExerciseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkingExerciseDtoImplFromJson(json);

  @override
  final int exerciseOrder;
  @override
  final String exerciseId;
  @override
  final String name;
  @override
  final String gifUrl;
  @override
  final String description;
  final List<String> _targetMuscles;
  @override
  List<String> get targetMuscles {
    if (_targetMuscles is EqualUnmodifiableListView) return _targetMuscles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetMuscles);
  }

  final List<String> _bodyParts;
  @override
  List<String> get bodyParts {
    if (_bodyParts is EqualUnmodifiableListView) return _bodyParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bodyParts);
  }

  final List<String> _equipments;
  @override
  List<String> get equipments {
    if (_equipments is EqualUnmodifiableListView) return _equipments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equipments);
  }

  final List<String> _secondaryMuscles;
  @override
  List<String> get secondaryMuscles {
    if (_secondaryMuscles is EqualUnmodifiableListView)
      return _secondaryMuscles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondaryMuscles);
  }

  final List<String> _instructions;
  @override
  List<String> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  final List<WorkingSetDto> _sets;
  @override
  List<WorkingSetDto> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  final int restTimeBetweenSets;
  // in seconds
  @override
  final String? setType;

  @override
  String toString() {
    return 'WorkingExerciseDto(exerciseOrder: $exerciseOrder, exerciseId: $exerciseId, name: $name, gifUrl: $gifUrl, description: $description, targetMuscles: $targetMuscles, bodyParts: $bodyParts, equipments: $equipments, secondaryMuscles: $secondaryMuscles, instructions: $instructions, sets: $sets, restTimeBetweenSets: $restTimeBetweenSets, setType: $setType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkingExerciseDtoImpl &&
            (identical(other.exerciseOrder, exerciseOrder) ||
                other.exerciseOrder == exerciseOrder) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gifUrl, gifUrl) || other.gifUrl == gifUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._targetMuscles,
              _targetMuscles,
            ) &&
            const DeepCollectionEquality().equals(
              other._bodyParts,
              _bodyParts,
            ) &&
            const DeepCollectionEquality().equals(
              other._equipments,
              _equipments,
            ) &&
            const DeepCollectionEquality().equals(
              other._secondaryMuscles,
              _secondaryMuscles,
            ) &&
            const DeepCollectionEquality().equals(
              other._instructions,
              _instructions,
            ) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.restTimeBetweenSets, restTimeBetweenSets) ||
                other.restTimeBetweenSets == restTimeBetweenSets) &&
            (identical(other.setType, setType) || other.setType == setType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    exerciseOrder,
    exerciseId,
    name,
    gifUrl,
    description,
    const DeepCollectionEquality().hash(_targetMuscles),
    const DeepCollectionEquality().hash(_bodyParts),
    const DeepCollectionEquality().hash(_equipments),
    const DeepCollectionEquality().hash(_secondaryMuscles),
    const DeepCollectionEquality().hash(_instructions),
    const DeepCollectionEquality().hash(_sets),
    restTimeBetweenSets,
    setType,
  );

  /// Create a copy of WorkingExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkingExerciseDtoImplCopyWith<_$WorkingExerciseDtoImpl> get copyWith =>
      __$$WorkingExerciseDtoImplCopyWithImpl<_$WorkingExerciseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkingExerciseDtoImplToJson(this);
  }
}

abstract class _WorkingExerciseDto implements WorkingExerciseDto {
  const factory _WorkingExerciseDto({
    required final int exerciseOrder,
    required final String exerciseId,
    required final String name,
    required final String gifUrl,
    required final String description,
    required final List<String> targetMuscles,
    required final List<String> bodyParts,
    required final List<String> equipments,
    required final List<String> secondaryMuscles,
    required final List<String> instructions,
    required final List<WorkingSetDto> sets,
    required final int restTimeBetweenSets,
    final String? setType,
  }) = _$WorkingExerciseDtoImpl;

  factory _WorkingExerciseDto.fromJson(Map<String, dynamic> json) =
      _$WorkingExerciseDtoImpl.fromJson;

  @override
  int get exerciseOrder;
  @override
  String get exerciseId;
  @override
  String get name;
  @override
  String get gifUrl;
  @override
  String get description;
  @override
  List<String> get targetMuscles;
  @override
  List<String> get bodyParts;
  @override
  List<String> get equipments;
  @override
  List<String> get secondaryMuscles;
  @override
  List<String> get instructions;
  @override
  List<WorkingSetDto> get sets;
  @override
  int get restTimeBetweenSets; // in seconds
  @override
  String? get setType;

  /// Create a copy of WorkingExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkingExerciseDtoImplCopyWith<_$WorkingExerciseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
