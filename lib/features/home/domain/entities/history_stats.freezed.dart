// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HistoryStats {
  int get totalWorkouts => throw _privateConstructorUsedError;
  double get totalTrainingVolume => throw _privateConstructorUsedError;
  Duration get totalTime => throw _privateConstructorUsedError;

  /// Create a copy of HistoryStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryStatsCopyWith<HistoryStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStatsCopyWith<$Res> {
  factory $HistoryStatsCopyWith(
    HistoryStats value,
    $Res Function(HistoryStats) then,
  ) = _$HistoryStatsCopyWithImpl<$Res, HistoryStats>;
  @useResult
  $Res call({
    int totalWorkouts,
    double totalTrainingVolume,
    Duration totalTime,
  });
}

/// @nodoc
class _$HistoryStatsCopyWithImpl<$Res, $Val extends HistoryStats>
    implements $HistoryStatsCopyWith<$Res> {
  _$HistoryStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalWorkouts = null,
    Object? totalTrainingVolume = null,
    Object? totalTime = null,
  }) {
    return _then(
      _value.copyWith(
            totalWorkouts: null == totalWorkouts
                ? _value.totalWorkouts
                : totalWorkouts // ignore: cast_nullable_to_non_nullable
                      as int,
            totalTrainingVolume: null == totalTrainingVolume
                ? _value.totalTrainingVolume
                : totalTrainingVolume // ignore: cast_nullable_to_non_nullable
                      as double,
            totalTime: null == totalTime
                ? _value.totalTime
                : totalTime // ignore: cast_nullable_to_non_nullable
                      as Duration,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HistoryStatsImplCopyWith<$Res>
    implements $HistoryStatsCopyWith<$Res> {
  factory _$$HistoryStatsImplCopyWith(
    _$HistoryStatsImpl value,
    $Res Function(_$HistoryStatsImpl) then,
  ) = __$$HistoryStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalWorkouts,
    double totalTrainingVolume,
    Duration totalTime,
  });
}

/// @nodoc
class __$$HistoryStatsImplCopyWithImpl<$Res>
    extends _$HistoryStatsCopyWithImpl<$Res, _$HistoryStatsImpl>
    implements _$$HistoryStatsImplCopyWith<$Res> {
  __$$HistoryStatsImplCopyWithImpl(
    _$HistoryStatsImpl _value,
    $Res Function(_$HistoryStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HistoryStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalWorkouts = null,
    Object? totalTrainingVolume = null,
    Object? totalTime = null,
  }) {
    return _then(
      _$HistoryStatsImpl(
        totalWorkouts: null == totalWorkouts
            ? _value.totalWorkouts
            : totalWorkouts // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTrainingVolume: null == totalTrainingVolume
            ? _value.totalTrainingVolume
            : totalTrainingVolume // ignore: cast_nullable_to_non_nullable
                  as double,
        totalTime: null == totalTime
            ? _value.totalTime
            : totalTime // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _$HistoryStatsImpl extends _HistoryStats {
  const _$HistoryStatsImpl({
    this.totalWorkouts = 0,
    this.totalTrainingVolume = 0.0,
    this.totalTime = Duration.zero,
  }) : super._();

  @override
  @JsonKey()
  final int totalWorkouts;
  @override
  @JsonKey()
  final double totalTrainingVolume;
  @override
  @JsonKey()
  final Duration totalTime;

  @override
  String toString() {
    return 'HistoryStats(totalWorkouts: $totalWorkouts, totalTrainingVolume: $totalTrainingVolume, totalTime: $totalTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStatsImpl &&
            (identical(other.totalWorkouts, totalWorkouts) ||
                other.totalWorkouts == totalWorkouts) &&
            (identical(other.totalTrainingVolume, totalTrainingVolume) ||
                other.totalTrainingVolume == totalTrainingVolume) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, totalWorkouts, totalTrainingVolume, totalTime);

  /// Create a copy of HistoryStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStatsImplCopyWith<_$HistoryStatsImpl> get copyWith =>
      __$$HistoryStatsImplCopyWithImpl<_$HistoryStatsImpl>(this, _$identity);
}

abstract class _HistoryStats extends HistoryStats {
  const factory _HistoryStats({
    final int totalWorkouts,
    final double totalTrainingVolume,
    final Duration totalTime,
  }) = _$HistoryStatsImpl;
  const _HistoryStats._() : super._();

  @override
  int get totalWorkouts;
  @override
  double get totalTrainingVolume;
  @override
  Duration get totalTime;

  /// Create a copy of HistoryStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryStatsImplCopyWith<_$HistoryStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
