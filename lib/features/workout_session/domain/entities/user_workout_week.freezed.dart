// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_workout_week.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserWorkoutWeek {
  String get userId => throw _privateConstructorUsedError;
  DateTime get weekStartDate => throw _privateConstructorUsedError;
  int get workoutCount => throw _privateConstructorUsedError;

  /// Create a copy of UserWorkoutWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserWorkoutWeekCopyWith<UserWorkoutWeek> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWorkoutWeekCopyWith<$Res> {
  factory $UserWorkoutWeekCopyWith(
    UserWorkoutWeek value,
    $Res Function(UserWorkoutWeek) then,
  ) = _$UserWorkoutWeekCopyWithImpl<$Res, UserWorkoutWeek>;
  @useResult
  $Res call({String userId, DateTime weekStartDate, int workoutCount});
}

/// @nodoc
class _$UserWorkoutWeekCopyWithImpl<$Res, $Val extends UserWorkoutWeek>
    implements $UserWorkoutWeekCopyWith<$Res> {
  _$UserWorkoutWeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserWorkoutWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? weekStartDate = null,
    Object? workoutCount = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            weekStartDate: null == weekStartDate
                ? _value.weekStartDate
                : weekStartDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            workoutCount: null == workoutCount
                ? _value.workoutCount
                : workoutCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserWorkoutWeekImplCopyWith<$Res>
    implements $UserWorkoutWeekCopyWith<$Res> {
  factory _$$UserWorkoutWeekImplCopyWith(
    _$UserWorkoutWeekImpl value,
    $Res Function(_$UserWorkoutWeekImpl) then,
  ) = __$$UserWorkoutWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, DateTime weekStartDate, int workoutCount});
}

/// @nodoc
class __$$UserWorkoutWeekImplCopyWithImpl<$Res>
    extends _$UserWorkoutWeekCopyWithImpl<$Res, _$UserWorkoutWeekImpl>
    implements _$$UserWorkoutWeekImplCopyWith<$Res> {
  __$$UserWorkoutWeekImplCopyWithImpl(
    _$UserWorkoutWeekImpl _value,
    $Res Function(_$UserWorkoutWeekImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserWorkoutWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? weekStartDate = null,
    Object? workoutCount = null,
  }) {
    return _then(
      _$UserWorkoutWeekImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        weekStartDate: null == weekStartDate
            ? _value.weekStartDate
            : weekStartDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        workoutCount: null == workoutCount
            ? _value.workoutCount
            : workoutCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$UserWorkoutWeekImpl extends _UserWorkoutWeek {
  const _$UserWorkoutWeekImpl({
    this.userId = '',
    required this.weekStartDate,
    this.workoutCount = 1,
  }) : super._();

  @override
  @JsonKey()
  final String userId;
  @override
  final DateTime weekStartDate;
  @override
  @JsonKey()
  final int workoutCount;

  @override
  String toString() {
    return 'UserWorkoutWeek(userId: $userId, weekStartDate: $weekStartDate, workoutCount: $workoutCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWorkoutWeekImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.weekStartDate, weekStartDate) ||
                other.weekStartDate == weekStartDate) &&
            (identical(other.workoutCount, workoutCount) ||
                other.workoutCount == workoutCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, weekStartDate, workoutCount);

  /// Create a copy of UserWorkoutWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWorkoutWeekImplCopyWith<_$UserWorkoutWeekImpl> get copyWith =>
      __$$UserWorkoutWeekImplCopyWithImpl<_$UserWorkoutWeekImpl>(
        this,
        _$identity,
      );
}

abstract class _UserWorkoutWeek extends UserWorkoutWeek {
  const factory _UserWorkoutWeek({
    final String userId,
    required final DateTime weekStartDate,
    final int workoutCount,
  }) = _$UserWorkoutWeekImpl;
  const _UserWorkoutWeek._() : super._();

  @override
  String get userId;
  @override
  DateTime get weekStartDate;
  @override
  int get workoutCount;

  /// Create a copy of UserWorkoutWeek
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserWorkoutWeekImplCopyWith<_$UserWorkoutWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
