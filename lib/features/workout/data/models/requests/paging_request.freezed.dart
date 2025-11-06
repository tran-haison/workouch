// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PagingRequest _$PagingRequestFromJson(Map<String, dynamic> json) {
  return _PagingRequest.fromJson(json);
}

/// @nodoc
mixin _$PagingRequest {
  int? get limit => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  SortBy? get sortBy => throw _privateConstructorUsedError;
  SortOrder? get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this PagingRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PagingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PagingRequestCopyWith<PagingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagingRequestCopyWith<$Res> {
  factory $PagingRequestCopyWith(
    PagingRequest value,
    $Res Function(PagingRequest) then,
  ) = _$PagingRequestCopyWithImpl<$Res, PagingRequest>;
  @useResult
  $Res call({int? limit, int? offset, SortBy? sortBy, SortOrder? sortOrder});
}

/// @nodoc
class _$PagingRequestCopyWithImpl<$Res, $Val extends PagingRequest>
    implements $PagingRequestCopyWith<$Res> {
  _$PagingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PagingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _value.copyWith(
            limit: freezed == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int?,
            offset: freezed == offset
                ? _value.offset
                : offset // ignore: cast_nullable_to_non_nullable
                      as int?,
            sortBy: freezed == sortBy
                ? _value.sortBy
                : sortBy // ignore: cast_nullable_to_non_nullable
                      as SortBy?,
            sortOrder: freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as SortOrder?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PagingRequestImplCopyWith<$Res>
    implements $PagingRequestCopyWith<$Res> {
  factory _$$PagingRequestImplCopyWith(
    _$PagingRequestImpl value,
    $Res Function(_$PagingRequestImpl) then,
  ) = __$$PagingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? limit, int? offset, SortBy? sortBy, SortOrder? sortOrder});
}

/// @nodoc
class __$$PagingRequestImplCopyWithImpl<$Res>
    extends _$PagingRequestCopyWithImpl<$Res, _$PagingRequestImpl>
    implements _$$PagingRequestImplCopyWith<$Res> {
  __$$PagingRequestImplCopyWithImpl(
    _$PagingRequestImpl _value,
    $Res Function(_$PagingRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PagingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _$PagingRequestImpl(
        limit: freezed == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int?,
        offset: freezed == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int?,
        sortBy: freezed == sortBy
            ? _value.sortBy
            : sortBy // ignore: cast_nullable_to_non_nullable
                  as SortBy?,
        sortOrder: freezed == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as SortOrder?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PagingRequestImpl implements _PagingRequest {
  const _$PagingRequestImpl({
    this.limit,
    this.offset,
    this.sortBy,
    this.sortOrder,
  });

  factory _$PagingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagingRequestImplFromJson(json);

  @override
  final int? limit;
  @override
  final int? offset;
  @override
  final SortBy? sortBy;
  @override
  final SortOrder? sortOrder;

  @override
  String toString() {
    return 'PagingRequest(limit: $limit, offset: $offset, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagingRequestImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, limit, offset, sortBy, sortOrder);

  /// Create a copy of PagingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PagingRequestImplCopyWith<_$PagingRequestImpl> get copyWith =>
      __$$PagingRequestImplCopyWithImpl<_$PagingRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PagingRequestImplToJson(this);
  }
}

abstract class _PagingRequest implements PagingRequest {
  const factory _PagingRequest({
    final int? limit,
    final int? offset,
    final SortBy? sortBy,
    final SortOrder? sortOrder,
  }) = _$PagingRequestImpl;

  factory _PagingRequest.fromJson(Map<String, dynamic> json) =
      _$PagingRequestImpl.fromJson;

  @override
  int? get limit;
  @override
  int? get offset;
  @override
  SortBy? get sortBy;
  @override
  SortOrder? get sortOrder;

  /// Create a copy of PagingRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PagingRequestImplCopyWith<_$PagingRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
