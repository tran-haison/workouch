import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_filter_request.freezed.dart';
part 'exercise_filter_request.g.dart';

@freezed
abstract class ExerciseFilterRequest with _$ExerciseFilterRequest {
  const factory ExerciseFilterRequest({
    String? search,
    String? equipments, // Comma separated list of equipments
    String? bodyParts, // Comma separated list of body parts
  }) = _ExerciseFilterRequest;

  factory ExerciseFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFilterRequestFromJson(json);
}
