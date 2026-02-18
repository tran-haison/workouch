import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_workout_week.dart';

part 'user_workout_week_dto.freezed.dart';
part 'user_workout_week_dto.g.dart';

@freezed
abstract class UserWorkoutWeekDto with _$UserWorkoutWeekDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserWorkoutWeekDto({
    required String userId,
    required String weekStartDate,
    required int workoutCount,
  }) = _UserWorkoutWeekDto;

  factory UserWorkoutWeekDto.fromJson(Map<String, dynamic> json) =>
      _$UserWorkoutWeekDtoFromJson(json);

  factory UserWorkoutWeekDto.fromEntity(UserWorkoutWeek entity) {
    return UserWorkoutWeekDto(
      userId: entity.userId,
      weekStartDate: entity.weekStartDate.toUtc().toIso8601String(),
      workoutCount: entity.workoutCount,
    );
  }
}

extension UserWorkoutWeekDtoExtension on UserWorkoutWeekDto {
  UserWorkoutWeek toEntity() {
    return UserWorkoutWeek(
      userId: userId,
      weekStartDate: DateTime.parse(weekStartDate).toLocal(),
      workoutCount: workoutCount,
    );
  }
}
