// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState {
  AuthStateStatus get status => throw _privateConstructorUsedError;
  List<Package> get availablePackages => throw _privateConstructorUsedError;
  User? get currentUser => throw _privateConstructorUsedError;
  UserSubscription? get userSubscription => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({
    AuthStateStatus status,
    List<Package> availablePackages,
    User? currentUser,
    UserSubscription? userSubscription,
    Error? error,
  });

  $UserCopyWith<$Res>? get currentUser;
  $UserSubscriptionCopyWith<$Res>? get userSubscription;
  $ErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? availablePackages = null,
    Object? currentUser = freezed,
    Object? userSubscription = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as AuthStateStatus,
            availablePackages: null == availablePackages
                ? _value.availablePackages
                : availablePackages // ignore: cast_nullable_to_non_nullable
                      as List<Package>,
            currentUser: freezed == currentUser
                ? _value.currentUser
                : currentUser // ignore: cast_nullable_to_non_nullable
                      as User?,
            userSubscription: freezed == userSubscription
                ? _value.userSubscription
                : userSubscription // ignore: cast_nullable_to_non_nullable
                      as UserSubscription?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as Error?,
          )
          as $Val,
    );
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get currentUser {
    if (_value.currentUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.currentUser!, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSubscriptionCopyWith<$Res>? get userSubscription {
    if (_value.userSubscription == null) {
      return null;
    }

    return $UserSubscriptionCopyWith<$Res>(_value.userSubscription!, (value) {
      return _then(_value.copyWith(userSubscription: value) as $Val);
    });
  }

  /// Create a copy of AuthState
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
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
    _$AuthStateImpl value,
    $Res Function(_$AuthStateImpl) then,
  ) = __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AuthStateStatus status,
    List<Package> availablePackages,
    User? currentUser,
    UserSubscription? userSubscription,
    Error? error,
  });

  @override
  $UserCopyWith<$Res>? get currentUser;
  @override
  $UserSubscriptionCopyWith<$Res>? get userSubscription;
  @override
  $ErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
    _$AuthStateImpl _value,
    $Res Function(_$AuthStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? availablePackages = null,
    Object? currentUser = freezed,
    Object? userSubscription = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$AuthStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AuthStateStatus,
        availablePackages: null == availablePackages
            ? _value._availablePackages
            : availablePackages // ignore: cast_nullable_to_non_nullable
                  as List<Package>,
        currentUser: freezed == currentUser
            ? _value.currentUser
            : currentUser // ignore: cast_nullable_to_non_nullable
                  as User?,
        userSubscription: freezed == userSubscription
            ? _value.userSubscription
            : userSubscription // ignore: cast_nullable_to_non_nullable
                  as UserSubscription?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Error?,
      ),
    );
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl({
    this.status = AuthStateStatus.initial,
    final List<Package> availablePackages = const [],
    this.currentUser,
    this.userSubscription,
    this.error,
  }) : _availablePackages = availablePackages;

  @override
  @JsonKey()
  final AuthStateStatus status;
  final List<Package> _availablePackages;
  @override
  @JsonKey()
  List<Package> get availablePackages {
    if (_availablePackages is EqualUnmodifiableListView)
      return _availablePackages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availablePackages);
  }

  @override
  final User? currentUser;
  @override
  final UserSubscription? userSubscription;
  @override
  final Error? error;

  @override
  String toString() {
    return 'AuthState(status: $status, availablePackages: $availablePackages, currentUser: $currentUser, userSubscription: $userSubscription, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._availablePackages,
              _availablePackages,
            ) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.userSubscription, userSubscription) ||
                other.userSubscription == userSubscription) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_availablePackages),
    currentUser,
    userSubscription,
    error,
  );

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState({
    final AuthStateStatus status,
    final List<Package> availablePackages,
    final User? currentUser,
    final UserSubscription? userSubscription,
    final Error? error,
  }) = _$AuthStateImpl;

  @override
  AuthStateStatus get status;
  @override
  List<Package> get availablePackages;
  @override
  User? get currentUser;
  @override
  UserSubscription? get userSubscription;
  @override
  Error? get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
