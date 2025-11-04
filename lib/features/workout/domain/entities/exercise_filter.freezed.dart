// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ExerciseFilter {
  String get muscle => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseFilterCopyWith<ExerciseFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseFilterCopyWith<$Res> {
  factory $ExerciseFilterCopyWith(
    ExerciseFilter value,
    $Res Function(ExerciseFilter) then,
  ) = _$ExerciseFilterCopyWithImpl<$Res, ExerciseFilter>;
  @useResult
  $Res call({String muscle, String equipment});
}

/// @nodoc
class _$ExerciseFilterCopyWithImpl<$Res, $Val extends ExerciseFilter>
    implements $ExerciseFilterCopyWith<$Res> {
  _$ExerciseFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? muscle = null, Object? equipment = null}) {
    return _then(
      _value.copyWith(
            muscle: null == muscle
                ? _value.muscle
                : muscle // ignore: cast_nullable_to_non_nullable
                      as String,
            equipment: null == equipment
                ? _value.equipment
                : equipment // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExerciseFilterImplCopyWith<$Res>
    implements $ExerciseFilterCopyWith<$Res> {
  factory _$$ExerciseFilterImplCopyWith(
    _$ExerciseFilterImpl value,
    $Res Function(_$ExerciseFilterImpl) then,
  ) = __$$ExerciseFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String muscle, String equipment});
}

/// @nodoc
class __$$ExerciseFilterImplCopyWithImpl<$Res>
    extends _$ExerciseFilterCopyWithImpl<$Res, _$ExerciseFilterImpl>
    implements _$$ExerciseFilterImplCopyWith<$Res> {
  __$$ExerciseFilterImplCopyWithImpl(
    _$ExerciseFilterImpl _value,
    $Res Function(_$ExerciseFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExerciseFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? muscle = null, Object? equipment = null}) {
    return _then(
      _$ExerciseFilterImpl(
        muscle: null == muscle
            ? _value.muscle
            : muscle // ignore: cast_nullable_to_non_nullable
                  as String,
        equipment: null == equipment
            ? _value.equipment
            : equipment // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ExerciseFilterImpl implements _ExerciseFilter {
  const _$ExerciseFilterImpl({this.muscle = '', this.equipment = ''});

  @override
  @JsonKey()
  final String muscle;
  @override
  @JsonKey()
  final String equipment;

  @override
  String toString() {
    return 'ExerciseFilter(muscle: $muscle, equipment: $equipment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseFilterImpl &&
            (identical(other.muscle, muscle) || other.muscle == muscle) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, muscle, equipment);

  /// Create a copy of ExerciseFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseFilterImplCopyWith<_$ExerciseFilterImpl> get copyWith =>
      __$$ExerciseFilterImplCopyWithImpl<_$ExerciseFilterImpl>(
        this,
        _$identity,
      );
}

abstract class _ExerciseFilter implements ExerciseFilter {
  const factory _ExerciseFilter({final String muscle, final String equipment}) =
      _$ExerciseFilterImpl;

  @override
  String get muscle;
  @override
  String get equipment;

  /// Create a copy of ExerciseFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseFilterImplCopyWith<_$ExerciseFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
