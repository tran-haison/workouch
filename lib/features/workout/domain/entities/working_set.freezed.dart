// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'working_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkingSet {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int sets, int reps, double weight) weightBased,
    required TResult Function(Duration duration) timeBased,
    required TResult Function(double distance) distanceBased,
    required TResult Function(int sets, int reps) repsOnly,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int sets, int reps, double weight)? weightBased,
    TResult? Function(Duration duration)? timeBased,
    TResult? Function(double distance)? distanceBased,
    TResult? Function(int sets, int reps)? repsOnly,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int sets, int reps, double weight)? weightBased,
    TResult Function(Duration duration)? timeBased,
    TResult Function(double distance)? distanceBased,
    TResult Function(int sets, int reps)? repsOnly,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeightBasedSet value) weightBased,
    required TResult Function(TimeBasedSet value) timeBased,
    required TResult Function(DistanceBasedSet value) distanceBased,
    required TResult Function(RepsOnlySet value) repsOnly,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeightBasedSet value)? weightBased,
    TResult? Function(TimeBasedSet value)? timeBased,
    TResult? Function(DistanceBasedSet value)? distanceBased,
    TResult? Function(RepsOnlySet value)? repsOnly,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeightBasedSet value)? weightBased,
    TResult Function(TimeBasedSet value)? timeBased,
    TResult Function(DistanceBasedSet value)? distanceBased,
    TResult Function(RepsOnlySet value)? repsOnly,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkingSetCopyWith<$Res> {
  factory $WorkingSetCopyWith(
    WorkingSet value,
    $Res Function(WorkingSet) then,
  ) = _$WorkingSetCopyWithImpl<$Res, WorkingSet>;
}

/// @nodoc
class _$WorkingSetCopyWithImpl<$Res, $Val extends WorkingSet>
    implements $WorkingSetCopyWith<$Res> {
  _$WorkingSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WeightBasedSetImplCopyWith<$Res> {
  factory _$$WeightBasedSetImplCopyWith(
    _$WeightBasedSetImpl value,
    $Res Function(_$WeightBasedSetImpl) then,
  ) = __$$WeightBasedSetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int sets, int reps, double weight});
}

/// @nodoc
class __$$WeightBasedSetImplCopyWithImpl<$Res>
    extends _$WorkingSetCopyWithImpl<$Res, _$WeightBasedSetImpl>
    implements _$$WeightBasedSetImplCopyWith<$Res> {
  __$$WeightBasedSetImplCopyWithImpl(
    _$WeightBasedSetImpl _value,
    $Res Function(_$WeightBasedSetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sets = null, Object? reps = null, Object? weight = null}) {
    return _then(
      _$WeightBasedSetImpl(
        sets: null == sets
            ? _value.sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: null == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$WeightBasedSetImpl extends WeightBasedSet {
  const _$WeightBasedSetImpl({this.sets = 0, this.reps = 0, this.weight = 0.0})
    : super._();

  @override
  @JsonKey()
  final int sets;
  @override
  @JsonKey()
  final int reps;
  @override
  @JsonKey()
  final double weight;

  @override
  String toString() {
    return 'WorkingSet.weightBased(sets: $sets, reps: $reps, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightBasedSetImpl &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sets, reps, weight);

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeightBasedSetImplCopyWith<_$WeightBasedSetImpl> get copyWith =>
      __$$WeightBasedSetImplCopyWithImpl<_$WeightBasedSetImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int sets, int reps, double weight) weightBased,
    required TResult Function(Duration duration) timeBased,
    required TResult Function(double distance) distanceBased,
    required TResult Function(int sets, int reps) repsOnly,
  }) {
    return weightBased(sets, reps, weight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int sets, int reps, double weight)? weightBased,
    TResult? Function(Duration duration)? timeBased,
    TResult? Function(double distance)? distanceBased,
    TResult? Function(int sets, int reps)? repsOnly,
  }) {
    return weightBased?.call(sets, reps, weight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int sets, int reps, double weight)? weightBased,
    TResult Function(Duration duration)? timeBased,
    TResult Function(double distance)? distanceBased,
    TResult Function(int sets, int reps)? repsOnly,
    required TResult orElse(),
  }) {
    if (weightBased != null) {
      return weightBased(sets, reps, weight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeightBasedSet value) weightBased,
    required TResult Function(TimeBasedSet value) timeBased,
    required TResult Function(DistanceBasedSet value) distanceBased,
    required TResult Function(RepsOnlySet value) repsOnly,
  }) {
    return weightBased(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeightBasedSet value)? weightBased,
    TResult? Function(TimeBasedSet value)? timeBased,
    TResult? Function(DistanceBasedSet value)? distanceBased,
    TResult? Function(RepsOnlySet value)? repsOnly,
  }) {
    return weightBased?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeightBasedSet value)? weightBased,
    TResult Function(TimeBasedSet value)? timeBased,
    TResult Function(DistanceBasedSet value)? distanceBased,
    TResult Function(RepsOnlySet value)? repsOnly,
    required TResult orElse(),
  }) {
    if (weightBased != null) {
      return weightBased(this);
    }
    return orElse();
  }
}

abstract class WeightBasedSet extends WorkingSet {
  const factory WeightBasedSet({
    final int sets,
    final int reps,
    final double weight,
  }) = _$WeightBasedSetImpl;
  const WeightBasedSet._() : super._();

  int get sets;
  int get reps;
  double get weight;

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeightBasedSetImplCopyWith<_$WeightBasedSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeBasedSetImplCopyWith<$Res> {
  factory _$$TimeBasedSetImplCopyWith(
    _$TimeBasedSetImpl value,
    $Res Function(_$TimeBasedSetImpl) then,
  ) = __$$TimeBasedSetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration duration});
}

/// @nodoc
class __$$TimeBasedSetImplCopyWithImpl<$Res>
    extends _$WorkingSetCopyWithImpl<$Res, _$TimeBasedSetImpl>
    implements _$$TimeBasedSetImplCopyWith<$Res> {
  __$$TimeBasedSetImplCopyWithImpl(
    _$TimeBasedSetImpl _value,
    $Res Function(_$TimeBasedSetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? duration = null}) {
    return _then(
      _$TimeBasedSetImpl(
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _$TimeBasedSetImpl extends TimeBasedSet {
  const _$TimeBasedSetImpl({this.duration = Duration.zero}) : super._();

  @override
  @JsonKey()
  final Duration duration;

  @override
  String toString() {
    return 'WorkingSet.timeBased(duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeBasedSetImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration);

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeBasedSetImplCopyWith<_$TimeBasedSetImpl> get copyWith =>
      __$$TimeBasedSetImplCopyWithImpl<_$TimeBasedSetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int sets, int reps, double weight) weightBased,
    required TResult Function(Duration duration) timeBased,
    required TResult Function(double distance) distanceBased,
    required TResult Function(int sets, int reps) repsOnly,
  }) {
    return timeBased(duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int sets, int reps, double weight)? weightBased,
    TResult? Function(Duration duration)? timeBased,
    TResult? Function(double distance)? distanceBased,
    TResult? Function(int sets, int reps)? repsOnly,
  }) {
    return timeBased?.call(duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int sets, int reps, double weight)? weightBased,
    TResult Function(Duration duration)? timeBased,
    TResult Function(double distance)? distanceBased,
    TResult Function(int sets, int reps)? repsOnly,
    required TResult orElse(),
  }) {
    if (timeBased != null) {
      return timeBased(duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeightBasedSet value) weightBased,
    required TResult Function(TimeBasedSet value) timeBased,
    required TResult Function(DistanceBasedSet value) distanceBased,
    required TResult Function(RepsOnlySet value) repsOnly,
  }) {
    return timeBased(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeightBasedSet value)? weightBased,
    TResult? Function(TimeBasedSet value)? timeBased,
    TResult? Function(DistanceBasedSet value)? distanceBased,
    TResult? Function(RepsOnlySet value)? repsOnly,
  }) {
    return timeBased?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeightBasedSet value)? weightBased,
    TResult Function(TimeBasedSet value)? timeBased,
    TResult Function(DistanceBasedSet value)? distanceBased,
    TResult Function(RepsOnlySet value)? repsOnly,
    required TResult orElse(),
  }) {
    if (timeBased != null) {
      return timeBased(this);
    }
    return orElse();
  }
}

abstract class TimeBasedSet extends WorkingSet {
  const factory TimeBasedSet({final Duration duration}) = _$TimeBasedSetImpl;
  const TimeBasedSet._() : super._();

  Duration get duration;

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeBasedSetImplCopyWith<_$TimeBasedSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DistanceBasedSetImplCopyWith<$Res> {
  factory _$$DistanceBasedSetImplCopyWith(
    _$DistanceBasedSetImpl value,
    $Res Function(_$DistanceBasedSetImpl) then,
  ) = __$$DistanceBasedSetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double distance});
}

/// @nodoc
class __$$DistanceBasedSetImplCopyWithImpl<$Res>
    extends _$WorkingSetCopyWithImpl<$Res, _$DistanceBasedSetImpl>
    implements _$$DistanceBasedSetImplCopyWith<$Res> {
  __$$DistanceBasedSetImplCopyWithImpl(
    _$DistanceBasedSetImpl _value,
    $Res Function(_$DistanceBasedSetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? distance = null}) {
    return _then(
      _$DistanceBasedSetImpl(
        distance: null == distance
            ? _value.distance
            : distance // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DistanceBasedSetImpl extends DistanceBasedSet {
  const _$DistanceBasedSetImpl({this.distance = 0.0}) : super._();

  @override
  @JsonKey()
  final double distance;

  @override
  String toString() {
    return 'WorkingSet.distanceBased(distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistanceBasedSetImpl &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, distance);

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistanceBasedSetImplCopyWith<_$DistanceBasedSetImpl> get copyWith =>
      __$$DistanceBasedSetImplCopyWithImpl<_$DistanceBasedSetImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int sets, int reps, double weight) weightBased,
    required TResult Function(Duration duration) timeBased,
    required TResult Function(double distance) distanceBased,
    required TResult Function(int sets, int reps) repsOnly,
  }) {
    return distanceBased(distance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int sets, int reps, double weight)? weightBased,
    TResult? Function(Duration duration)? timeBased,
    TResult? Function(double distance)? distanceBased,
    TResult? Function(int sets, int reps)? repsOnly,
  }) {
    return distanceBased?.call(distance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int sets, int reps, double weight)? weightBased,
    TResult Function(Duration duration)? timeBased,
    TResult Function(double distance)? distanceBased,
    TResult Function(int sets, int reps)? repsOnly,
    required TResult orElse(),
  }) {
    if (distanceBased != null) {
      return distanceBased(distance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeightBasedSet value) weightBased,
    required TResult Function(TimeBasedSet value) timeBased,
    required TResult Function(DistanceBasedSet value) distanceBased,
    required TResult Function(RepsOnlySet value) repsOnly,
  }) {
    return distanceBased(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeightBasedSet value)? weightBased,
    TResult? Function(TimeBasedSet value)? timeBased,
    TResult? Function(DistanceBasedSet value)? distanceBased,
    TResult? Function(RepsOnlySet value)? repsOnly,
  }) {
    return distanceBased?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeightBasedSet value)? weightBased,
    TResult Function(TimeBasedSet value)? timeBased,
    TResult Function(DistanceBasedSet value)? distanceBased,
    TResult Function(RepsOnlySet value)? repsOnly,
    required TResult orElse(),
  }) {
    if (distanceBased != null) {
      return distanceBased(this);
    }
    return orElse();
  }
}

abstract class DistanceBasedSet extends WorkingSet {
  const factory DistanceBasedSet({final double distance}) =
      _$DistanceBasedSetImpl;
  const DistanceBasedSet._() : super._();

  double get distance;

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistanceBasedSetImplCopyWith<_$DistanceBasedSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RepsOnlySetImplCopyWith<$Res> {
  factory _$$RepsOnlySetImplCopyWith(
    _$RepsOnlySetImpl value,
    $Res Function(_$RepsOnlySetImpl) then,
  ) = __$$RepsOnlySetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int sets, int reps});
}

/// @nodoc
class __$$RepsOnlySetImplCopyWithImpl<$Res>
    extends _$WorkingSetCopyWithImpl<$Res, _$RepsOnlySetImpl>
    implements _$$RepsOnlySetImplCopyWith<$Res> {
  __$$RepsOnlySetImplCopyWithImpl(
    _$RepsOnlySetImpl _value,
    $Res Function(_$RepsOnlySetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? sets = null, Object? reps = null}) {
    return _then(
      _$RepsOnlySetImpl(
        sets: null == sets
            ? _value.sets
            : sets // ignore: cast_nullable_to_non_nullable
                  as int,
        reps: null == reps
            ? _value.reps
            : reps // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$RepsOnlySetImpl extends RepsOnlySet {
  const _$RepsOnlySetImpl({this.sets = 0, this.reps = 0}) : super._();

  @override
  @JsonKey()
  final int sets;
  @override
  @JsonKey()
  final int reps;

  @override
  String toString() {
    return 'WorkingSet.repsOnly(sets: $sets, reps: $reps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepsOnlySetImpl &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sets, reps);

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepsOnlySetImplCopyWith<_$RepsOnlySetImpl> get copyWith =>
      __$$RepsOnlySetImplCopyWithImpl<_$RepsOnlySetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int sets, int reps, double weight) weightBased,
    required TResult Function(Duration duration) timeBased,
    required TResult Function(double distance) distanceBased,
    required TResult Function(int sets, int reps) repsOnly,
  }) {
    return repsOnly(sets, reps);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int sets, int reps, double weight)? weightBased,
    TResult? Function(Duration duration)? timeBased,
    TResult? Function(double distance)? distanceBased,
    TResult? Function(int sets, int reps)? repsOnly,
  }) {
    return repsOnly?.call(sets, reps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int sets, int reps, double weight)? weightBased,
    TResult Function(Duration duration)? timeBased,
    TResult Function(double distance)? distanceBased,
    TResult Function(int sets, int reps)? repsOnly,
    required TResult orElse(),
  }) {
    if (repsOnly != null) {
      return repsOnly(sets, reps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeightBasedSet value) weightBased,
    required TResult Function(TimeBasedSet value) timeBased,
    required TResult Function(DistanceBasedSet value) distanceBased,
    required TResult Function(RepsOnlySet value) repsOnly,
  }) {
    return repsOnly(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeightBasedSet value)? weightBased,
    TResult? Function(TimeBasedSet value)? timeBased,
    TResult? Function(DistanceBasedSet value)? distanceBased,
    TResult? Function(RepsOnlySet value)? repsOnly,
  }) {
    return repsOnly?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeightBasedSet value)? weightBased,
    TResult Function(TimeBasedSet value)? timeBased,
    TResult Function(DistanceBasedSet value)? distanceBased,
    TResult Function(RepsOnlySet value)? repsOnly,
    required TResult orElse(),
  }) {
    if (repsOnly != null) {
      return repsOnly(this);
    }
    return orElse();
  }
}

abstract class RepsOnlySet extends WorkingSet {
  const factory RepsOnlySet({final int sets, final int reps}) =
      _$RepsOnlySetImpl;
  const RepsOnlySet._() : super._();

  int get sets;
  int get reps;

  /// Create a copy of WorkingSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepsOnlySetImplCopyWith<_$RepsOnlySetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
