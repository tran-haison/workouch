// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_workout_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GenerateWorkoutRequest _$GenerateWorkoutRequestFromJson(
  Map<String, dynamic> json,
) {
  switch (json['runtimeType']) {
    case 'neatMode':
      return NeatModeGenerateWorkoutRequest.fromJson(json);
    case 'shuffleMode':
      return ShuffleModeGenerateWorkoutRequest.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'GenerateWorkoutRequest',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$GenerateWorkoutRequest {
  String get mode => throw _privateConstructorUsedError;
  UserContextRequest? get userContext => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String mode,
      SpecificationsRequest specifications,
      UserContextRequest? userContext,
    )
    neatMode,
    required TResult Function(
      String mode,
      String preferences,
      UserContextRequest? userContext,
    )
    shuffleMode,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String mode,
      SpecificationsRequest specifications,
      UserContextRequest? userContext,
    )?
    neatMode,
    TResult? Function(
      String mode,
      String preferences,
      UserContextRequest? userContext,
    )?
    shuffleMode,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String mode,
      SpecificationsRequest specifications,
      UserContextRequest? userContext,
    )?
    neatMode,
    TResult Function(
      String mode,
      String preferences,
      UserContextRequest? userContext,
    )?
    shuffleMode,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NeatModeGenerateWorkoutRequest value) neatMode,
    required TResult Function(ShuffleModeGenerateWorkoutRequest value)
    shuffleMode,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NeatModeGenerateWorkoutRequest value)? neatMode,
    TResult? Function(ShuffleModeGenerateWorkoutRequest value)? shuffleMode,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NeatModeGenerateWorkoutRequest value)? neatMode,
    TResult Function(ShuffleModeGenerateWorkoutRequest value)? shuffleMode,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this GenerateWorkoutRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateWorkoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateWorkoutRequestCopyWith<GenerateWorkoutRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateWorkoutRequestCopyWith<$Res> {
  factory $GenerateWorkoutRequestCopyWith(
    GenerateWorkoutRequest value,
    $Res Function(GenerateWorkoutRequest) then,
  ) = _$GenerateWorkoutRequestCopyWithImpl<$Res, GenerateWorkoutRequest>;
  @useResult
  $Res call({String mode, UserContextRequest? userContext});

  $UserContextRequestCopyWith<$Res>? get userContext;
}

/// @nodoc
class _$GenerateWorkoutRequestCopyWithImpl<
  $Res,
  $Val extends GenerateWorkoutRequest
>
    implements $GenerateWorkoutRequestCopyWith<$Res> {
  _$GenerateWorkoutRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateWorkoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mode = null, Object? userContext = freezed}) {
    return _then(
      _value.copyWith(
            mode: null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                      as String,
            userContext: freezed == userContext
                ? _value.userContext
                : userContext // ignore: cast_nullable_to_non_nullable
                      as UserContextRequest?,
          )
          as $Val,
    );
  }

  /// Create a copy of GenerateWorkoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserContextRequestCopyWith<$Res>? get userContext {
    if (_value.userContext == null) {
      return null;
    }

    return $UserContextRequestCopyWith<$Res>(_value.userContext!, (value) {
      return _then(_value.copyWith(userContext: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NeatModeGenerateWorkoutRequestImplCopyWith<$Res>
    implements $GenerateWorkoutRequestCopyWith<$Res> {
  factory _$$NeatModeGenerateWorkoutRequestImplCopyWith(
    _$NeatModeGenerateWorkoutRequestImpl value,
    $Res Function(_$NeatModeGenerateWorkoutRequestImpl) then,
  ) = __$$NeatModeGenerateWorkoutRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String mode,
    SpecificationsRequest specifications,
    UserContextRequest? userContext,
  });

  $SpecificationsRequestCopyWith<$Res> get specifications;
  @override
  $UserContextRequestCopyWith<$Res>? get userContext;
}

/// @nodoc
class __$$NeatModeGenerateWorkoutRequestImplCopyWithImpl<$Res>
    extends
        _$GenerateWorkoutRequestCopyWithImpl<
          $Res,
          _$NeatModeGenerateWorkoutRequestImpl
        >
    implements _$$NeatModeGenerateWorkoutRequestImplCopyWith<$Res> {
  __$$NeatModeGenerateWorkoutRequestImplCopyWithImpl(
    _$NeatModeGenerateWorkoutRequestImpl _value,
    $Res Function(_$NeatModeGenerateWorkoutRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateWorkoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? specifications = null,
    Object? userContext = freezed,
  }) {
    return _then(
      _$NeatModeGenerateWorkoutRequestImpl(
        mode: null == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String,
        specifications: null == specifications
            ? _value.specifications
            : specifications // ignore: cast_nullable_to_non_nullable
                  as SpecificationsRequest,
        userContext: freezed == userContext
            ? _value.userContext
            : userContext // ignore: cast_nullable_to_non_nullable
                  as UserContextRequest?,
      ),
    );
  }

  /// Create a copy of GenerateWorkoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpecificationsRequestCopyWith<$Res> get specifications {
    return $SpecificationsRequestCopyWith<$Res>(_value.specifications, (value) {
      return _then(_value.copyWith(specifications: value));
    });
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$NeatModeGenerateWorkoutRequestImpl
    implements NeatModeGenerateWorkoutRequest {
  const _$NeatModeGenerateWorkoutRequestImpl({
    required this.mode,
    required this.specifications,
    this.userContext,
    final String? $type,
  }) : $type = $type ?? 'neatMode';

  factory _$NeatModeGenerateWorkoutRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$NeatModeGenerateWorkoutRequestImplFromJson(json);

  @override
  final String mode;
  @override
  final SpecificationsRequest specifications;
  @override
  final UserContextRequest? userContext;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateWorkoutRequest.neatMode(mode: $mode, specifications: $specifications, userContext: $userContext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NeatModeGenerateWorkoutRequestImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.specifications, specifications) ||
                other.specifications == specifications) &&
            (identical(other.userContext, userContext) ||
                other.userContext == userContext));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mode, specifications, userContext);

  /// Create a copy of GenerateWorkoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NeatModeGenerateWorkoutRequestImplCopyWith<
    _$NeatModeGenerateWorkoutRequestImpl
  >
  get copyWith =>
      __$$NeatModeGenerateWorkoutRequestImplCopyWithImpl<
        _$NeatModeGenerateWorkoutRequestImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String mode,
      SpecificationsRequest specifications,
      UserContextRequest? userContext,
    )
    neatMode,
    required TResult Function(
      String mode,
      String preferences,
      UserContextRequest? userContext,
    )
    shuffleMode,
  }) {
    return neatMode(mode, specifications, userContext);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String mode,
      SpecificationsRequest specifications,
      UserContextRequest? userContext,
    )?
    neatMode,
    TResult? Function(
      String mode,
      String preferences,
      UserContextRequest? userContext,
    )?
    shuffleMode,
  }) {
    return neatMode?.call(mode, specifications, userContext);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String mode,
      SpecificationsRequest specifications,
      UserContextRequest? userContext,
    )?
    neatMode,
    TResult Function(
      String mode,
      String preferences,
      UserContextRequest? userContext,
    )?
    shuffleMode,
    required TResult orElse(),
  }) {
    if (neatMode != null) {
      return neatMode(mode, specifications, userContext);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NeatModeGenerateWorkoutRequest value) neatMode,
    required TResult Function(ShuffleModeGenerateWorkoutRequest value)
    shuffleMode,
  }) {
    return neatMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NeatModeGenerateWorkoutRequest value)? neatMode,
    TResult? Function(ShuffleModeGenerateWorkoutRequest value)? shuffleMode,
  }) {
    return neatMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NeatModeGenerateWorkoutRequest value)? neatMode,
    TResult Function(ShuffleModeGenerateWorkoutRequest value)? shuffleMode,
    required TResult orElse(),
  }) {
    if (neatMode != null) {
      return neatMode(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NeatModeGenerateWorkoutRequestImplToJson(this);
  }
}

abstract class NeatModeGenerateWorkoutRequest
    implements GenerateWorkoutRequest {
  const factory NeatModeGenerateWorkoutRequest({
    required final String mode,
    required final SpecificationsRequest specifications,
    final UserContextRequest? userContext,
  }) = _$NeatModeGenerateWorkoutRequestImpl;

  factory NeatModeGenerateWorkoutRequest.fromJson(Map<String, dynamic> json) =
      _$NeatModeGenerateWorkoutRequestImpl.fromJson;

  @override
  String get mode;
  SpecificationsRequest get specifications;
  @override
  UserContextRequest? get userContext;

  /// Create a copy of GenerateWorkoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NeatModeGenerateWorkoutRequestImplCopyWith<
    _$NeatModeGenerateWorkoutRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShuffleModeGenerateWorkoutRequestImplCopyWith<$Res>
    implements $GenerateWorkoutRequestCopyWith<$Res> {
  factory _$$ShuffleModeGenerateWorkoutRequestImplCopyWith(
    _$ShuffleModeGenerateWorkoutRequestImpl value,
    $Res Function(_$ShuffleModeGenerateWorkoutRequestImpl) then,
  ) = __$$ShuffleModeGenerateWorkoutRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mode, String preferences, UserContextRequest? userContext});

  @override
  $UserContextRequestCopyWith<$Res>? get userContext;
}

/// @nodoc
class __$$ShuffleModeGenerateWorkoutRequestImplCopyWithImpl<$Res>
    extends
        _$GenerateWorkoutRequestCopyWithImpl<
          $Res,
          _$ShuffleModeGenerateWorkoutRequestImpl
        >
    implements _$$ShuffleModeGenerateWorkoutRequestImplCopyWith<$Res> {
  __$$ShuffleModeGenerateWorkoutRequestImplCopyWithImpl(
    _$ShuffleModeGenerateWorkoutRequestImpl _value,
    $Res Function(_$ShuffleModeGenerateWorkoutRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateWorkoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? preferences = null,
    Object? userContext = freezed,
  }) {
    return _then(
      _$ShuffleModeGenerateWorkoutRequestImpl(
        mode: null == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String,
        preferences: null == preferences
            ? _value.preferences
            : preferences // ignore: cast_nullable_to_non_nullable
                  as String,
        userContext: freezed == userContext
            ? _value.userContext
            : userContext // ignore: cast_nullable_to_non_nullable
                  as UserContextRequest?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ShuffleModeGenerateWorkoutRequestImpl
    implements ShuffleModeGenerateWorkoutRequest {
  const _$ShuffleModeGenerateWorkoutRequestImpl({
    required this.mode,
    required this.preferences,
    this.userContext,
    final String? $type,
  }) : $type = $type ?? 'shuffleMode';

  factory _$ShuffleModeGenerateWorkoutRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ShuffleModeGenerateWorkoutRequestImplFromJson(json);

  @override
  final String mode;
  @override
  final String preferences;
  @override
  final UserContextRequest? userContext;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateWorkoutRequest.shuffleMode(mode: $mode, preferences: $preferences, userContext: $userContext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShuffleModeGenerateWorkoutRequestImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.userContext, userContext) ||
                other.userContext == userContext));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mode, preferences, userContext);

  /// Create a copy of GenerateWorkoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShuffleModeGenerateWorkoutRequestImplCopyWith<
    _$ShuffleModeGenerateWorkoutRequestImpl
  >
  get copyWith =>
      __$$ShuffleModeGenerateWorkoutRequestImplCopyWithImpl<
        _$ShuffleModeGenerateWorkoutRequestImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String mode,
      SpecificationsRequest specifications,
      UserContextRequest? userContext,
    )
    neatMode,
    required TResult Function(
      String mode,
      String preferences,
      UserContextRequest? userContext,
    )
    shuffleMode,
  }) {
    return shuffleMode(mode, preferences, userContext);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String mode,
      SpecificationsRequest specifications,
      UserContextRequest? userContext,
    )?
    neatMode,
    TResult? Function(
      String mode,
      String preferences,
      UserContextRequest? userContext,
    )?
    shuffleMode,
  }) {
    return shuffleMode?.call(mode, preferences, userContext);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String mode,
      SpecificationsRequest specifications,
      UserContextRequest? userContext,
    )?
    neatMode,
    TResult Function(
      String mode,
      String preferences,
      UserContextRequest? userContext,
    )?
    shuffleMode,
    required TResult orElse(),
  }) {
    if (shuffleMode != null) {
      return shuffleMode(mode, preferences, userContext);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NeatModeGenerateWorkoutRequest value) neatMode,
    required TResult Function(ShuffleModeGenerateWorkoutRequest value)
    shuffleMode,
  }) {
    return shuffleMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NeatModeGenerateWorkoutRequest value)? neatMode,
    TResult? Function(ShuffleModeGenerateWorkoutRequest value)? shuffleMode,
  }) {
    return shuffleMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NeatModeGenerateWorkoutRequest value)? neatMode,
    TResult Function(ShuffleModeGenerateWorkoutRequest value)? shuffleMode,
    required TResult orElse(),
  }) {
    if (shuffleMode != null) {
      return shuffleMode(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ShuffleModeGenerateWorkoutRequestImplToJson(this);
  }
}

abstract class ShuffleModeGenerateWorkoutRequest
    implements GenerateWorkoutRequest {
  const factory ShuffleModeGenerateWorkoutRequest({
    required final String mode,
    required final String preferences,
    final UserContextRequest? userContext,
  }) = _$ShuffleModeGenerateWorkoutRequestImpl;

  factory ShuffleModeGenerateWorkoutRequest.fromJson(
    Map<String, dynamic> json,
  ) = _$ShuffleModeGenerateWorkoutRequestImpl.fromJson;

  @override
  String get mode;
  String get preferences;
  @override
  UserContextRequest? get userContext;

  /// Create a copy of GenerateWorkoutRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShuffleModeGenerateWorkoutRequestImplCopyWith<
    _$ShuffleModeGenerateWorkoutRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

UserContextRequest _$UserContextRequestFromJson(Map<String, dynamic> json) {
  return _UserContextRequest.fromJson(json);
}

/// @nodoc
mixin _$UserContextRequest {
  int? get age => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  String? get activityLevel => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;

  /// Serializes this UserContextRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserContextRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserContextRequestCopyWith<UserContextRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserContextRequestCopyWith<$Res> {
  factory $UserContextRequestCopyWith(
    UserContextRequest value,
    $Res Function(UserContextRequest) then,
  ) = _$UserContextRequestCopyWithImpl<$Res, UserContextRequest>;
  @useResult
  $Res call({
    int? age,
    double? height,
    double? weight,
    String? activityLevel,
    String? gender,
  });
}

/// @nodoc
class _$UserContextRequestCopyWithImpl<$Res, $Val extends UserContextRequest>
    implements $UserContextRequestCopyWith<$Res> {
  _$UserContextRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserContextRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? activityLevel = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _value.copyWith(
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double?,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double?,
            activityLevel: freezed == activityLevel
                ? _value.activityLevel
                : activityLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserContextRequestImplCopyWith<$Res>
    implements $UserContextRequestCopyWith<$Res> {
  factory _$$UserContextRequestImplCopyWith(
    _$UserContextRequestImpl value,
    $Res Function(_$UserContextRequestImpl) then,
  ) = __$$UserContextRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? age,
    double? height,
    double? weight,
    String? activityLevel,
    String? gender,
  });
}

/// @nodoc
class __$$UserContextRequestImplCopyWithImpl<$Res>
    extends _$UserContextRequestCopyWithImpl<$Res, _$UserContextRequestImpl>
    implements _$$UserContextRequestImplCopyWith<$Res> {
  __$$UserContextRequestImplCopyWithImpl(
    _$UserContextRequestImpl _value,
    $Res Function(_$UserContextRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserContextRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? activityLevel = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _$UserContextRequestImpl(
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double?,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double?,
        activityLevel: freezed == activityLevel
            ? _value.activityLevel
            : activityLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$UserContextRequestImpl implements _UserContextRequest {
  const _$UserContextRequestImpl({
    this.age,
    this.height,
    this.weight,
    this.activityLevel,
    this.gender,
  });

  factory _$UserContextRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserContextRequestImplFromJson(json);

  @override
  final int? age;
  @override
  final double? height;
  @override
  final double? weight;
  @override
  final String? activityLevel;
  @override
  final String? gender;

  @override
  String toString() {
    return 'UserContextRequest(age: $age, height: $height, weight: $weight, activityLevel: $activityLevel, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserContextRequestImpl &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.activityLevel, activityLevel) ||
                other.activityLevel == activityLevel) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, age, height, weight, activityLevel, gender);

  /// Create a copy of UserContextRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserContextRequestImplCopyWith<_$UserContextRequestImpl> get copyWith =>
      __$$UserContextRequestImplCopyWithImpl<_$UserContextRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserContextRequestImplToJson(this);
  }
}

abstract class _UserContextRequest implements UserContextRequest {
  const factory _UserContextRequest({
    final int? age,
    final double? height,
    final double? weight,
    final String? activityLevel,
    final String? gender,
  }) = _$UserContextRequestImpl;

  factory _UserContextRequest.fromJson(Map<String, dynamic> json) =
      _$UserContextRequestImpl.fromJson;

  @override
  int? get age;
  @override
  double? get height;
  @override
  double? get weight;
  @override
  String? get activityLevel;
  @override
  String? get gender;

  /// Create a copy of UserContextRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserContextRequestImplCopyWith<_$UserContextRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpecificationsRequest _$SpecificationsRequestFromJson(
  Map<String, dynamic> json,
) {
  return _SpecificationsRequest.fromJson(json);
}

/// @nodoc
mixin _$SpecificationsRequest {
  String? get workoutName => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  String? get intensity => throw _privateConstructorUsedError;
  List<String>? get goals => throw _privateConstructorUsedError;
  List<String>? get bodyParts => throw _privateConstructorUsedError;
  List<String>? get equipments => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get injuries => throw _privateConstructorUsedError;

  /// Serializes this SpecificationsRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpecificationsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpecificationsRequestCopyWith<SpecificationsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecificationsRequestCopyWith<$Res> {
  factory $SpecificationsRequestCopyWith(
    SpecificationsRequest value,
    $Res Function(SpecificationsRequest) then,
  ) = _$SpecificationsRequestCopyWithImpl<$Res, SpecificationsRequest>;
  @useResult
  $Res call({
    String? workoutName,
    int? duration,
    String? intensity,
    List<String>? goals,
    List<String>? bodyParts,
    List<String>? equipments,
    String? location,
    String? injuries,
  });
}

/// @nodoc
class _$SpecificationsRequestCopyWithImpl<
  $Res,
  $Val extends SpecificationsRequest
>
    implements $SpecificationsRequestCopyWith<$Res> {
  _$SpecificationsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpecificationsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutName = freezed,
    Object? duration = freezed,
    Object? intensity = freezed,
    Object? goals = freezed,
    Object? bodyParts = freezed,
    Object? equipments = freezed,
    Object? location = freezed,
    Object? injuries = freezed,
  }) {
    return _then(
      _value.copyWith(
            workoutName: freezed == workoutName
                ? _value.workoutName
                : workoutName // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int?,
            intensity: freezed == intensity
                ? _value.intensity
                : intensity // ignore: cast_nullable_to_non_nullable
                      as String?,
            goals: freezed == goals
                ? _value.goals
                : goals // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            bodyParts: freezed == bodyParts
                ? _value.bodyParts
                : bodyParts // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            equipments: freezed == equipments
                ? _value.equipments
                : equipments // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            injuries: freezed == injuries
                ? _value.injuries
                : injuries // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpecificationsRequestImplCopyWith<$Res>
    implements $SpecificationsRequestCopyWith<$Res> {
  factory _$$SpecificationsRequestImplCopyWith(
    _$SpecificationsRequestImpl value,
    $Res Function(_$SpecificationsRequestImpl) then,
  ) = __$$SpecificationsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? workoutName,
    int? duration,
    String? intensity,
    List<String>? goals,
    List<String>? bodyParts,
    List<String>? equipments,
    String? location,
    String? injuries,
  });
}

/// @nodoc
class __$$SpecificationsRequestImplCopyWithImpl<$Res>
    extends
        _$SpecificationsRequestCopyWithImpl<$Res, _$SpecificationsRequestImpl>
    implements _$$SpecificationsRequestImplCopyWith<$Res> {
  __$$SpecificationsRequestImplCopyWithImpl(
    _$SpecificationsRequestImpl _value,
    $Res Function(_$SpecificationsRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpecificationsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workoutName = freezed,
    Object? duration = freezed,
    Object? intensity = freezed,
    Object? goals = freezed,
    Object? bodyParts = freezed,
    Object? equipments = freezed,
    Object? location = freezed,
    Object? injuries = freezed,
  }) {
    return _then(
      _$SpecificationsRequestImpl(
        workoutName: freezed == workoutName
            ? _value.workoutName
            : workoutName // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int?,
        intensity: freezed == intensity
            ? _value.intensity
            : intensity // ignore: cast_nullable_to_non_nullable
                  as String?,
        goals: freezed == goals
            ? _value._goals
            : goals // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        bodyParts: freezed == bodyParts
            ? _value._bodyParts
            : bodyParts // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        equipments: freezed == equipments
            ? _value._equipments
            : equipments // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        injuries: freezed == injuries
            ? _value.injuries
            : injuries // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$SpecificationsRequestImpl implements _SpecificationsRequest {
  const _$SpecificationsRequestImpl({
    this.workoutName,
    this.duration,
    this.intensity,
    final List<String>? goals,
    final List<String>? bodyParts,
    final List<String>? equipments,
    this.location,
    this.injuries,
  }) : _goals = goals,
       _bodyParts = bodyParts,
       _equipments = equipments;

  factory _$SpecificationsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecificationsRequestImplFromJson(json);

  @override
  final String? workoutName;
  @override
  final int? duration;
  @override
  final String? intensity;
  final List<String>? _goals;
  @override
  List<String>? get goals {
    final value = _goals;
    if (value == null) return null;
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _bodyParts;
  @override
  List<String>? get bodyParts {
    final value = _bodyParts;
    if (value == null) return null;
    if (_bodyParts is EqualUnmodifiableListView) return _bodyParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _equipments;
  @override
  List<String>? get equipments {
    final value = _equipments;
    if (value == null) return null;
    if (_equipments is EqualUnmodifiableListView) return _equipments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? location;
  @override
  final String? injuries;

  @override
  String toString() {
    return 'SpecificationsRequest(workoutName: $workoutName, duration: $duration, intensity: $intensity, goals: $goals, bodyParts: $bodyParts, equipments: $equipments, location: $location, injuries: $injuries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecificationsRequestImpl &&
            (identical(other.workoutName, workoutName) ||
                other.workoutName == workoutName) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            const DeepCollectionEquality().equals(
              other._bodyParts,
              _bodyParts,
            ) &&
            const DeepCollectionEquality().equals(
              other._equipments,
              _equipments,
            ) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.injuries, injuries) ||
                other.injuries == injuries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    workoutName,
    duration,
    intensity,
    const DeepCollectionEquality().hash(_goals),
    const DeepCollectionEquality().hash(_bodyParts),
    const DeepCollectionEquality().hash(_equipments),
    location,
    injuries,
  );

  /// Create a copy of SpecificationsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecificationsRequestImplCopyWith<_$SpecificationsRequestImpl>
  get copyWith =>
      __$$SpecificationsRequestImplCopyWithImpl<_$SpecificationsRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecificationsRequestImplToJson(this);
  }
}

abstract class _SpecificationsRequest implements SpecificationsRequest {
  const factory _SpecificationsRequest({
    final String? workoutName,
    final int? duration,
    final String? intensity,
    final List<String>? goals,
    final List<String>? bodyParts,
    final List<String>? equipments,
    final String? location,
    final String? injuries,
  }) = _$SpecificationsRequestImpl;

  factory _SpecificationsRequest.fromJson(Map<String, dynamic> json) =
      _$SpecificationsRequestImpl.fromJson;

  @override
  String? get workoutName;
  @override
  int? get duration;
  @override
  String? get intensity;
  @override
  List<String>? get goals;
  @override
  List<String>? get bodyParts;
  @override
  List<String>? get equipments;
  @override
  String? get location;
  @override
  String? get injuries;

  /// Create a copy of SpecificationsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpecificationsRequestImplCopyWith<_$SpecificationsRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
