import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_workout_week.freezed.dart';

/// Represents a week where the user completed at least 1 workout.
/// Used for week streak calculation.
@freezed
class UserWorkoutWeek with _$UserWorkoutWeek {
  const UserWorkoutWeek._();

  const factory UserWorkoutWeek({
    @Default('') String userId,
    required DateTime weekStartDate,
    @Default(1) int workoutCount,
  }) = _UserWorkoutWeek;
}
