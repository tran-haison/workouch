import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_workout_response_dto.freezed.dart';
part 'ai_workout_response_dto.g.dart';

@freezed
class AIWorkoutResponseDto with _$AIWorkoutResponseDto {
  const factory AIWorkoutResponseDto({
    @JsonKey(name: 'workout_name') required String workoutName,
    @JsonKey(name: 'exercises') required List<AIExerciseDto> exercises,
    @JsonKey(name: 'rest_time_between_exercises')
    @Default(60)
    int restTimeBetweenExercises,
  }) = _AIWorkoutResponseDto;

  factory AIWorkoutResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AIWorkoutResponseDtoFromJson(json);
}

@freezed
class AIExerciseDto with _$AIExerciseDto {
  const factory AIExerciseDto({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'sets') @Default(3) int sets,
    @JsonKey(name: 'reps') @Default(10) int reps,
    @JsonKey(name: 'weight_kg') @Default(0.0) double weightKg,
    @JsonKey(name: 'duration_seconds') @Default(0) int durationSeconds,
    @JsonKey(name: 'rest_between_sets_seconds')
    @Default(60)
    int restBetweenSetsSeconds,
    @JsonKey(name: 'set_type')
    @Default('weightBased')
    String setType, // 'weightBased', 'timeBased', 'distanceBased', 'repsOnly'
  }) = _AIExerciseDto;

  factory AIExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$AIExerciseDtoFromJson(json);
}
