// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError; // in cm
  double get weight => throw _privateConstructorUsedError; // in kg
  ActivityLevel get activityLevel => throw _privateConstructorUsedError;
  SubscriptionTier get subscriptionTier => throw _privateConstructorUsedError;
  bool get hasOnboard => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({
    String id,
    String email,
    String fullName,
    String avatarUrl,
    Gender gender,
    int age,
    double height,
    double weight,
    ActivityLevel activityLevel,
    SubscriptionTier subscriptionTier,
    bool hasOnboard,
  });
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
    Object? avatarUrl = null,
    Object? gender = null,
    Object? age = null,
    Object? height = null,
    Object? weight = null,
    Object? activityLevel = null,
    Object? subscriptionTier = null,
    Object? hasOnboard = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: null == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as Gender,
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double,
            activityLevel: null == activityLevel
                ? _value.activityLevel
                : activityLevel // ignore: cast_nullable_to_non_nullable
                      as ActivityLevel,
            subscriptionTier: null == subscriptionTier
                ? _value.subscriptionTier
                : subscriptionTier // ignore: cast_nullable_to_non_nullable
                      as SubscriptionTier,
            hasOnboard: null == hasOnboard
                ? _value.hasOnboard
                : hasOnboard // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
    _$UserImpl value,
    $Res Function(_$UserImpl) then,
  ) = __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    String fullName,
    String avatarUrl,
    Gender gender,
    int age,
    double height,
    double weight,
    ActivityLevel activityLevel,
    SubscriptionTier subscriptionTier,
    bool hasOnboard,
  });
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
    : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
    Object? avatarUrl = null,
    Object? gender = null,
    Object? age = null,
    Object? height = null,
    Object? weight = null,
    Object? activityLevel = null,
    Object? subscriptionTier = null,
    Object? hasOnboard = null,
  }) {
    return _then(
      _$UserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: null == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as Gender,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double,
        activityLevel: null == activityLevel
            ? _value.activityLevel
            : activityLevel // ignore: cast_nullable_to_non_nullable
                  as ActivityLevel,
        subscriptionTier: null == subscriptionTier
            ? _value.subscriptionTier
            : subscriptionTier // ignore: cast_nullable_to_non_nullable
                  as SubscriptionTier,
        hasOnboard: null == hasOnboard
            ? _value.hasOnboard
            : hasOnboard // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$UserImpl extends _User {
  const _$UserImpl({
    this.id = '',
    this.email = '',
    this.fullName = '',
    this.avatarUrl = '',
    this.gender = Gender.male,
    this.age = 0,
    this.height = 0.0,
    this.weight = 0.0,
    this.activityLevel = ActivityLevel.sedentary,
    this.subscriptionTier = SubscriptionTier.basic,
    this.hasOnboard = false,
  }) : super._();

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String avatarUrl;
  @override
  @JsonKey()
  final Gender gender;
  @override
  @JsonKey()
  final int age;
  @override
  @JsonKey()
  final double height;
  // in cm
  @override
  @JsonKey()
  final double weight;
  // in kg
  @override
  @JsonKey()
  final ActivityLevel activityLevel;
  @override
  @JsonKey()
  final SubscriptionTier subscriptionTier;
  @override
  @JsonKey()
  final bool hasOnboard;

  @override
  String toString() {
    return 'User(id: $id, email: $email, fullName: $fullName, avatarUrl: $avatarUrl, gender: $gender, age: $age, height: $height, weight: $weight, activityLevel: $activityLevel, subscriptionTier: $subscriptionTier, hasOnboard: $hasOnboard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.activityLevel, activityLevel) ||
                other.activityLevel == activityLevel) &&
            (identical(other.subscriptionTier, subscriptionTier) ||
                other.subscriptionTier == subscriptionTier) &&
            (identical(other.hasOnboard, hasOnboard) ||
                other.hasOnboard == hasOnboard));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    fullName,
    avatarUrl,
    gender,
    age,
    height,
    weight,
    activityLevel,
    subscriptionTier,
    hasOnboard,
  );

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);
}

abstract class _User extends User {
  const factory _User({
    final String id,
    final String email,
    final String fullName,
    final String avatarUrl,
    final Gender gender,
    final int age,
    final double height,
    final double weight,
    final ActivityLevel activityLevel,
    final SubscriptionTier subscriptionTier,
    final bool hasOnboard,
  }) = _$UserImpl;
  const _User._() : super._();

  @override
  String get id;
  @override
  String get email;
  @override
  String get fullName;
  @override
  String get avatarUrl;
  @override
  Gender get gender;
  @override
  int get age;
  @override
  double get height; // in cm
  @override
  double get weight; // in kg
  @override
  ActivityLevel get activityLevel;
  @override
  SubscriptionTier get subscriptionTier;
  @override
  bool get hasOnboard;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
