// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeHistoryState {
  HomeHistoryStatus get status => throw _privateConstructorUsedError;
  List<ExercisePR> get allPRs => throw _privateConstructorUsedError;
  List<String> get selectedPRIds =>
      throw _privateConstructorUsedError; // IDs of PRs to show on history tab
  ExerciseFilter get filter => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  int get currentOffset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  Error? get error => throw _privateConstructorUsedError;

  /// Create a copy of HomeHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeHistoryStateCopyWith<HomeHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeHistoryStateCopyWith<$Res> {
  factory $HomeHistoryStateCopyWith(
    HomeHistoryState value,
    $Res Function(HomeHistoryState) then,
  ) = _$HomeHistoryStateCopyWithImpl<$Res, HomeHistoryState>;
  @useResult
  $Res call({
    HomeHistoryStatus status,
    List<ExercisePR> allPRs,
    List<String> selectedPRIds,
    ExerciseFilter filter,
    String search,
    int currentOffset,
    int limit,
    bool hasMore,
    Error? error,
  });

  $ExerciseFilterCopyWith<$Res> get filter;
  $ErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$HomeHistoryStateCopyWithImpl<$Res, $Val extends HomeHistoryState>
    implements $HomeHistoryStateCopyWith<$Res> {
  _$HomeHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? allPRs = null,
    Object? selectedPRIds = null,
    Object? filter = null,
    Object? search = null,
    Object? currentOffset = null,
    Object? limit = null,
    Object? hasMore = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as HomeHistoryStatus,
            allPRs: null == allPRs
                ? _value.allPRs
                : allPRs // ignore: cast_nullable_to_non_nullable
                      as List<ExercisePR>,
            selectedPRIds: null == selectedPRIds
                ? _value.selectedPRIds
                : selectedPRIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            filter: null == filter
                ? _value.filter
                : filter // ignore: cast_nullable_to_non_nullable
                      as ExerciseFilter,
            search: null == search
                ? _value.search
                : search // ignore: cast_nullable_to_non_nullable
                      as String,
            currentOffset: null == currentOffset
                ? _value.currentOffset
                : currentOffset // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as Error?,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExerciseFilterCopyWith<$Res> get filter {
    return $ExerciseFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  /// Create a copy of HomeHistoryState
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
abstract class _$$HomeHistoryStateImplCopyWith<$Res>
    implements $HomeHistoryStateCopyWith<$Res> {
  factory _$$HomeHistoryStateImplCopyWith(
    _$HomeHistoryStateImpl value,
    $Res Function(_$HomeHistoryStateImpl) then,
  ) = __$$HomeHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    HomeHistoryStatus status,
    List<ExercisePR> allPRs,
    List<String> selectedPRIds,
    ExerciseFilter filter,
    String search,
    int currentOffset,
    int limit,
    bool hasMore,
    Error? error,
  });

  @override
  $ExerciseFilterCopyWith<$Res> get filter;
  @override
  $ErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$HomeHistoryStateImplCopyWithImpl<$Res>
    extends _$HomeHistoryStateCopyWithImpl<$Res, _$HomeHistoryStateImpl>
    implements _$$HomeHistoryStateImplCopyWith<$Res> {
  __$$HomeHistoryStateImplCopyWithImpl(
    _$HomeHistoryStateImpl _value,
    $Res Function(_$HomeHistoryStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? allPRs = null,
    Object? selectedPRIds = null,
    Object? filter = null,
    Object? search = null,
    Object? currentOffset = null,
    Object? limit = null,
    Object? hasMore = null,
    Object? error = freezed,
  }) {
    return _then(
      _$HomeHistoryStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as HomeHistoryStatus,
        allPRs: null == allPRs
            ? _value._allPRs
            : allPRs // ignore: cast_nullable_to_non_nullable
                  as List<ExercisePR>,
        selectedPRIds: null == selectedPRIds
            ? _value._selectedPRIds
            : selectedPRIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        filter: null == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as ExerciseFilter,
        search: null == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String,
        currentOffset: null == currentOffset
            ? _value.currentOffset
            : currentOffset // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Error?,
      ),
    );
  }
}

/// @nodoc

class _$HomeHistoryStateImpl implements _HomeHistoryState {
  const _$HomeHistoryStateImpl({
    this.status = HomeHistoryStatus.initial,
    final List<ExercisePR> allPRs = const [],
    final List<String> selectedPRIds = const [],
    this.filter = const ExerciseFilter(),
    this.search = '',
    this.currentOffset = 0,
    this.limit = 20,
    this.hasMore = true,
    this.error,
  }) : _allPRs = allPRs,
       _selectedPRIds = selectedPRIds;

  @override
  @JsonKey()
  final HomeHistoryStatus status;
  final List<ExercisePR> _allPRs;
  @override
  @JsonKey()
  List<ExercisePR> get allPRs {
    if (_allPRs is EqualUnmodifiableListView) return _allPRs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allPRs);
  }

  final List<String> _selectedPRIds;
  @override
  @JsonKey()
  List<String> get selectedPRIds {
    if (_selectedPRIds is EqualUnmodifiableListView) return _selectedPRIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedPRIds);
  }

  // IDs of PRs to show on history tab
  @override
  @JsonKey()
  final ExerciseFilter filter;
  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final int currentOffset;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  final Error? error;

  @override
  String toString() {
    return 'HomeHistoryState(status: $status, allPRs: $allPRs, selectedPRIds: $selectedPRIds, filter: $filter, search: $search, currentOffset: $currentOffset, limit: $limit, hasMore: $hasMore, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeHistoryStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._allPRs, _allPRs) &&
            const DeepCollectionEquality().equals(
              other._selectedPRIds,
              _selectedPRIds,
            ) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_allPRs),
    const DeepCollectionEquality().hash(_selectedPRIds),
    filter,
    search,
    currentOffset,
    limit,
    hasMore,
    error,
  );

  /// Create a copy of HomeHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeHistoryStateImplCopyWith<_$HomeHistoryStateImpl> get copyWith =>
      __$$HomeHistoryStateImplCopyWithImpl<_$HomeHistoryStateImpl>(
        this,
        _$identity,
      );
}

abstract class _HomeHistoryState implements HomeHistoryState {
  const factory _HomeHistoryState({
    final HomeHistoryStatus status,
    final List<ExercisePR> allPRs,
    final List<String> selectedPRIds,
    final ExerciseFilter filter,
    final String search,
    final int currentOffset,
    final int limit,
    final bool hasMore,
    final Error? error,
  }) = _$HomeHistoryStateImpl;

  @override
  HomeHistoryStatus get status;
  @override
  List<ExercisePR> get allPRs;
  @override
  List<String> get selectedPRIds; // IDs of PRs to show on history tab
  @override
  ExerciseFilter get filter;
  @override
  String get search;
  @override
  int get currentOffset;
  @override
  int get limit;
  @override
  bool get hasMore;
  @override
  Error? get error;

  /// Create a copy of HomeHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeHistoryStateImplCopyWith<_$HomeHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
