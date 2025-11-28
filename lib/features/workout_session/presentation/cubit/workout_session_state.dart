import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../workout/domain/entities/workout.dart';

part 'workout_session_state.freezed.dart';

@freezed
class WorkoutSessionState with _$WorkoutSessionState {
  const factory WorkoutSessionState({@Default(Workout()) Workout workout}) =
      _WorkoutSessionState;
}
