import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_request.freezed.dart';
part 'paging_request.g.dart';

@freezed
abstract class PagingRequest with _$PagingRequest {
  const factory PagingRequest({
    int? limit,
    int? offset,
    SortBy? sortBy,
    SortOrder? sortOrder,
  }) = _PagingRequest;

  factory PagingRequest.fromJson(Map<String, dynamic> json) =>
      _$PagingRequestFromJson(json);
}

enum SortBy { name, exerciseId, targetMuscles, bodyParts, equipments }

enum SortOrder { asc, desc }
