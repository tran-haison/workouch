// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OnboardState {
  OnboardStateStatus get status => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  MeasurementSystem? get measurementSystem =>
      throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  double get heightCm => throw _privateConstructorUsedError;
  double get weightKg => throw _privateConstructorUsedError;
  ActivityLevel? get activityLevel => throw _privateConstructorUsedError;
  Map<MainLift, double> get mainLiftRecords =>
      throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardStateCopyWith<OnboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardStateCopyWith<$Res> {
  factory $OnboardStateCopyWith(
    OnboardState value,
    $Res Function(OnboardState) then,
  ) = _$OnboardStateCopyWithImpl<$Res, OnboardState>;
  @useResult
  $Res call({
    OnboardStateStatus status,
    int currentPage,
    MeasurementSystem? measurementSystem,
    Gender? gender,
    int age,
    double heightCm,
    double weightKg,
    ActivityLevel? activityLevel,
    Map<MainLift, double> mainLiftRecords,
    Error? error,
  });

  $ErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$OnboardStateCopyWithImpl<$Res, $Val extends OnboardState>
    implements $OnboardStateCopyWith<$Res> {
  _$OnboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentPage = null,
    Object? measurementSystem = freezed,
    Object? gender = freezed,
    Object? age = null,
    Object? heightCm = null,
    Object? weightKg = null,
    Object? activityLevel = freezed,
    Object? mainLiftRecords = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as OnboardStateStatus,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            measurementSystem: freezed == measurementSystem
                ? _value.measurementSystem
                : measurementSystem // ignore: cast_nullable_to_non_nullable
                      as MeasurementSystem?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as Gender?,
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int,
            heightCm: null == heightCm
                ? _value.heightCm
                : heightCm // ignore: cast_nullable_to_non_nullable
                      as double,
            weightKg: null == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as double,
            activityLevel: freezed == activityLevel
                ? _value.activityLevel
                : activityLevel // ignore: cast_nullable_to_non_nullable
                      as ActivityLevel?,
            mainLiftRecords: null == mainLiftRecords
                ? _value.mainLiftRecords
                : mainLiftRecords // ignore: cast_nullable_to_non_nullable
                      as Map<MainLift, double>,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as Error?,
          )
          as $Val,
    );
  }

  /// Create a copy of OnboardState
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
abstract class _$$OnboardStateImplCopyWith<$Res>
    implements $OnboardStateCopyWith<$Res> {
  factory _$$OnboardStateImplCopyWith(
    _$OnboardStateImpl value,
    $Res Function(_$OnboardStateImpl) then,
  ) = __$$OnboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    OnboardStateStatus status,
    int currentPage,
    MeasurementSystem? measurementSystem,
    Gender? gender,
    int age,
    double heightCm,
    double weightKg,
    ActivityLevel? activityLevel,
    Map<MainLift, double> mainLiftRecords,
    Error? error,
  });

  @override
  $ErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$OnboardStateImplCopyWithImpl<$Res>
    extends _$OnboardStateCopyWithImpl<$Res, _$OnboardStateImpl>
    implements _$$OnboardStateImplCopyWith<$Res> {
  __$$OnboardStateImplCopyWithImpl(
    _$OnboardStateImpl _value,
    $Res Function(_$OnboardStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentPage = null,
    Object? measurementSystem = freezed,
    Object? gender = freezed,
    Object? age = null,
    Object? heightCm = null,
    Object? weightKg = null,
    Object? activityLevel = freezed,
    Object? mainLiftRecords = null,
    Object? error = freezed,
  }) {
    return _then(
      _$OnboardStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OnboardStateStatus,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        measurementSystem: freezed == measurementSystem
            ? _value.measurementSystem
            : measurementSystem // ignore: cast_nullable_to_non_nullable
                  as MeasurementSystem?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as Gender?,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int,
        heightCm: null == heightCm
            ? _value.heightCm
            : heightCm // ignore: cast_nullable_to_non_nullable
                  as double,
        weightKg: null == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as double,
        activityLevel: freezed == activityLevel
            ? _value.activityLevel
            : activityLevel // ignore: cast_nullable_to_non_nullable
                  as ActivityLevel?,
        mainLiftRecords: null == mainLiftRecords
            ? _value._mainLiftRecords
            : mainLiftRecords // ignore: cast_nullable_to_non_nullable
                  as Map<MainLift, double>,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Error?,
      ),
    );
  }
}

/// @nodoc

class _$OnboardStateImpl implements _OnboardState {
  const _$OnboardStateImpl({
    this.status = OnboardStateStatus.initial,
    this.currentPage = 0,
    this.measurementSystem,
    this.gender,
    this.age = 18,
    this.heightCm = 170.0,
    this.weightKg = 70.0,
    this.activityLevel,
    final Map<MainLift, double> mainLiftRecords = const {},
    this.error,
  }) : _mainLiftRecords = mainLiftRecords;

  @override
  @JsonKey()
  final OnboardStateStatus status;
  @override
  @JsonKey()
  final int currentPage;
  @override
  final MeasurementSystem? measurementSystem;
  @override
  final Gender? gender;
  @override
  @JsonKey()
  final int age;
  @override
  @JsonKey()
  final double heightCm;
  @override
  @JsonKey()
  final double weightKg;
  @override
  final ActivityLevel? activityLevel;
  final Map<MainLift, double> _mainLiftRecords;
  @override
  @JsonKey()
  Map<MainLift, double> get mainLiftRecords {
    if (_mainLiftRecords is EqualUnmodifiableMapView) return _mainLiftRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mainLiftRecords);
  }

  @override
  final Error? error;

  @override
  String toString() {
    return 'OnboardState(status: $status, currentPage: $currentPage, measurementSystem: $measurementSystem, gender: $gender, age: $age, heightCm: $heightCm, weightKg: $weightKg, activityLevel: $activityLevel, mainLiftRecords: $mainLiftRecords, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.measurementSystem, measurementSystem) ||
                other.measurementSystem == measurementSystem) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.activityLevel, activityLevel) ||
                other.activityLevel == activityLevel) &&
            const DeepCollectionEquality().equals(
              other._mainLiftRecords,
              _mainLiftRecords,
            ) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    currentPage,
    measurementSystem,
    gender,
    age,
    heightCm,
    weightKg,
    activityLevel,
    const DeepCollectionEquality().hash(_mainLiftRecords),
    error,
  );

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardStateImplCopyWith<_$OnboardStateImpl> get copyWith =>
      __$$OnboardStateImplCopyWithImpl<_$OnboardStateImpl>(this, _$identity);
}

abstract class _OnboardState implements OnboardState {
  const factory _OnboardState({
    final OnboardStateStatus status,
    final int currentPage,
    final MeasurementSystem? measurementSystem,
    final Gender? gender,
    final int age,
    final double heightCm,
    final double weightKg,
    final ActivityLevel? activityLevel,
    final Map<MainLift, double> mainLiftRecords,
    final Error? error,
  }) = _$OnboardStateImpl;

  @override
  OnboardStateStatus get status;
  @override
  int get currentPage;
  @override
  MeasurementSystem? get measurementSystem;
  @override
  Gender? get gender;
  @override
  int get age;
  @override
  double get heightCm;
  @override
  double get weightKg;
  @override
  ActivityLevel? get activityLevel;
  @override
  Map<MainLift, double> get mainLiftRecords;
  @override
  Error? get error;

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardStateImplCopyWith<_$OnboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
