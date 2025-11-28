import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../workout/domain/entities/workout.dart';
import 'workout_session_state.dart';

@injectable
class WorkoutSessionCubit extends Cubit<WorkoutSessionState> {
  WorkoutSessionCubit() : super(const WorkoutSessionState());

  void setWorkout(Workout workout) {
    emit(state.copyWith(workout: workout));
  }
}
