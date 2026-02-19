// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'working_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkingExercise {
  String get exerciseId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get gifUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get targetMuscles => throw _privateConstructorUsedError;
  List<String> get bodyParts => throw _privateConstructorUsedError;
  List<String> get equipments => throw _privateConstructorUsedError;
  List<String> get secondaryMuscles => throw _privateConstructorUsedError;
  List<String> get instructions => throw _privateConstructorUsedError;
  List<WorkingSet> get sets => throw _privateConstructorUsedError;
  Duration get restTimeBetweenSets => throw _privateConstructorUsedError;
  int get exerciseOrder => throw _privateConstructorUsedError;
  WorkingSetType? get setType => throw _privateConstructorUsedError;

  /// Create a copy of WorkingExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkingExerciseCopyWith<WorkingExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkingExerciseCopyWith<$Res> {
  factory $WorkingExerciseCopyWith(
    WorkingExercise value,
    $Res Function(WorkingExercise) then,
  ) = _$WorkingExerciseCopyWithImpl<$Res, WorkingExercise>;
  @useResult
  $Res call({
    String exerciseId,
    String name,
    String gifUrl,
    String description,
    List<String> targetMuscles,
    List<String> bodyParts,
    List<String> equipments,
    List<String> secondaryMuscles,
    List<String> instructions,
    List<WorkingSet> sets,
    Duration restTimeBetweenSets,
    int exerciseOrder,
    WorkingSetType? setType,
  });
}

/// @nodoc
class _$WorkingExerciseCopyWithImpl<$Res, $Val extends WorkingExercise>
    implements $WorkingExerciseCopyWith<$Res> {
  _$WorkingExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkingExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
    Object? exerciseOrder = null,
    Object? setType = freezed,
  }) {
    return _then(
      _value.copyWith(
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
                      as List<WorkingSet>,
            restTimeBetweenSets: null == restTimeBetweenSets
                ? _value.restTimeBetweenSets
                : restTimeBetweenSets // ignore: cast_nullable_to_non_nullable
                      as Duration,
            exerciseOrder: null == exerciseOrder
                ? _value.exerciseOrder
                : exerciseOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            setType: freezed == setType
                ? _value.setType
                : setType // ignore: cast_nullable_to_non_nullable
                      as WorkingSetType?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkingExerciseImplCopyWith<$Res>
    implements $WorkingExerciseCopyWith<$Res> {
  factory _$$WorkingExerciseImplCopyWith(
    _$WorkingExerciseImpl value,
    $Res Function(_$WorkingExerciseImpl) then,
  ) = __$$WorkingExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String exerciseId,
    String name,
    String gifUrl,
    String description,
    List<String> targetMuscles,
    List<String> bodyParts,
    List<String> equipments,
    List<String> secondaryMuscles,
    List<String> instructions,
    List<WorkingSet> sets,
    Duration restTimeBetweenSets,
    int exerciseOrder,
    WorkingSetType? setType,
  });
}

/// @nodoc
class __$$WorkingExerciseImplCopyWithImpl<$Res>
    extends _$WorkingExerciseCopyWithImpl<$Res, _$WorkingExerciseImpl>
    implements _$$WorkingExerciseImplCopyWith<$Res> {
  __$$WorkingExerciseImplCopyWithImpl(
    _$WorkingExerciseImpl _value,
    $Res Function(_$WorkingExerciseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkingExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
    Object? exerciseOrder = null,
    Object? setType = freezed,
  }) {
    return _then(
      _$WorkingExerciseImpl(
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
                  as List<WorkingSet>,
        restTimeBetweenSets: null == restTimeBetweenSets
            ? _value.restTimeBetweenSets
            : restTimeBetweenSets // ignore: cast_nullable_to_non_nullable
                  as Duration,
        exerciseOrder: null == exerciseOrder
            ? _value.exerciseOrder
            : exerciseOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        setType: freezed == setType
            ? _value.setType
            : setType // ignore: cast_nullable_to_non_nullable
                  as WorkingSetType?,
      ),
    );
  }
}

/// @nodoc

class _$WorkingExerciseImpl extends _WorkingExercise {
  const _$WorkingExerciseImpl({
    this.exerciseId = '',
    this.name = '',
    this.gifUrl = '',
    this.description = '',
    final List<String> targetMuscles = const [],
    final List<String> bodyParts = const [],
    final List<String> equipments = const [],
    final List<String> secondaryMuscles = const [],
    final List<String> instructions = const [],
    final List<WorkingSet> sets = const [],
    this.restTimeBetweenSets = Duration.zero,
    this.exerciseOrder = 0,
    this.setType,
  }) : _targetMuscles = targetMuscles,
       _bodyParts = bodyParts,
       _equipments = equipments,
       _secondaryMuscles = secondaryMuscles,
       _instructions = instructions,
       _sets = sets,
       super._();

  @override
  @JsonKey()
  final String exerciseId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String gifUrl;
  @override
  @JsonKey()
  final String description;
  final List<String> _targetMuscles;
  @override
  @JsonKey()
  List<String> get targetMuscles {
    if (_targetMuscles is EqualUnmodifiableListView) return _targetMuscles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetMuscles);
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

  final List<String> _secondaryMuscles;
  @override
  @JsonKey()
  List<String> get secondaryMuscles {
    if (_secondaryMuscles is EqualUnmodifiableListView)
      return _secondaryMuscles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondaryMuscles);
  }

  final List<String> _instructions;
  @override
  @JsonKey()
  List<String> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  final List<WorkingSet> _sets;
  @override
  @JsonKey()
  List<WorkingSet> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  @JsonKey()
  final Duration restTimeBetweenSets;
  @override
  @JsonKey()
  final int exerciseOrder;
  @override
  final WorkingSetType? setType;

  @override
  String toString() {
    return 'WorkingExercise(exerciseId: $exerciseId, name: $name, gifUrl: $gifUrl, description: $description, targetMuscles: $targetMuscles, bodyParts: $bodyParts, equipments: $equipments, secondaryMuscles: $secondaryMuscles, instructions: $instructions, sets: $sets, restTimeBetweenSets: $restTimeBetweenSets, exerciseOrder: $exerciseOrder, setType: $setType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkingExerciseImpl &&
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
            (identical(other.exerciseOrder, exerciseOrder) ||
                other.exerciseOrder == exerciseOrder) &&
            (identical(other.setType, setType) || other.setType == setType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
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
    exerciseOrder,
    setType,
  );

  /// Create a copy of WorkingExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkingExerciseImplCopyWith<_$WorkingExerciseImpl> get copyWith =>
      __$$WorkingExerciseImplCopyWithImpl<_$WorkingExerciseImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkingExercise extends WorkingExercise {
  const factory _WorkingExercise({
    final String exerciseId,
    final String name,
    final String gifUrl,
    final String description,
    final List<String> targetMuscles,
    final List<String> bodyParts,
    final List<String> equipments,
    final List<String> secondaryMuscles,
    final List<String> instructions,
    final List<WorkingSet> sets,
    final Duration restTimeBetweenSets,
    final int exerciseOrder,
    final WorkingSetType? setType,
  }) = _$WorkingExerciseImpl;
  const _WorkingExercise._() : super._();

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
  List<WorkingSet> get sets;
  @override
  Duration get restTimeBetweenSets;
  @override
  int get exerciseOrder;
  @override
  WorkingSetType? get setType;

  /// Create a copy of WorkingExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkingExerciseImplCopyWith<_$WorkingExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
