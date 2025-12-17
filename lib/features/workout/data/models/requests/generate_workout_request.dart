import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_workout_request.freezed.dart';
part 'generate_workout_request.g.dart';

@freezed
abstract class GenerateWorkoutRequest with _$GenerateWorkoutRequest {
  @JsonSerializable(includeIfNull: false)
  const factory GenerateWorkoutRequest.neatMode({
    required String mode,
    required SpecificationsRequest specifications,
    UserContextRequest? userContext,
  }) = NeatModeGenerateWorkoutRequest;

  @JsonSerializable(includeIfNull: false)
  const factory GenerateWorkoutRequest.shuffleMode({
    required String mode,
    required String preferences,
    UserContextRequest? userContext,
  }) = ShuffleModeGenerateWorkoutRequest;

  factory GenerateWorkoutRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateWorkoutRequestFromJson(json);
}

@freezed
abstract class UserContextRequest with _$UserContextRequest {
  @JsonSerializable(includeIfNull: false)
  const factory UserContextRequest({
    int? age,
    double? height,
    double? weight,
    String? activityLevel,
    String? gender,
  }) = _UserContextRequest;

  factory UserContextRequest.fromJson(Map<String, dynamic> json) =>
      _$UserContextRequestFromJson(json);
}

@freezed
abstract class SpecificationsRequest with _$SpecificationsRequest {
  @JsonSerializable(includeIfNull: false)
  const factory SpecificationsRequest({
    String? workoutName,
    int? duration,
    String? intensity,
    List<String>? goals,
    List<String>? bodyParts,
    List<String>? equipments,
    String? location,
    String? injuries,
  }) = _SpecificationsRequest;

  factory SpecificationsRequest.fromJson(Map<String, dynamic> json) =>
      _$SpecificationsRequestFromJson(json);
}
