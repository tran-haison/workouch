import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../workout/domain/entities/workout.dart';
import 'workout_session_state.dart';

@injectable
class WorkoutSessionCubit extends Cubit<WorkoutSessionState> {
  WorkoutSessionCubit() : super(const WorkoutSessionState());

  Timer? totalTimer;
  Timer? restSetsTimer;
  Timer? restExercisesTimer;

  void initWorkout(Workout workout) {
    // Initialize setIndexTracker for all exercises
    final tracker = <String, int>{};
    for (final exercise in workout.exercises) {
      tracker[exercise.exerciseId] = 0; // 0 means first set
    }
    emit(state.copyWith(workout: workout, setIndexTracker: tracker));
  }

  void goNextExercise() {
    if (state.hasNextExercise) {
      emit(
        state.copyWith(currentExerciseIndex: state.currentExerciseIndex + 1),
      );
    }
  }

  void goPrevExercise() {
    if (state.hasPrevExercise) {
      emit(
        state.copyWith(currentExerciseIndex: state.currentExerciseIndex - 1),
      );
    }
  }

  void goNextSet() {
    // Increase the current set index for the current exercise by 1
    final newTracker = Map<String, int>.from(state.setIndexTracker);
    newTracker[state.currentExercise.exerciseId] = state.currentSetIndex + 1;
    emit(state.copyWith(setIndexTracker: newTracker));
  }

  void startTotalTimer() {
    stopTotalTimer();
    emit(state.copyWith(totalTime: Duration.zero));

    const oneSec = Duration(seconds: 1);
    totalTimer = Timer.periodic(oneSec, (_) {
      emit(state.copyWith(totalTime: state.totalTime + oneSec));
    });
  }

  void stopTotalTimer() {
    totalTimer?.cancel();
    totalTimer = null;
    emit(state.copyWith(totalTime: Duration.zero));
  }

  void startRestSetsTimer(Duration restTime) {
    stopRestSetsTimer(); // Stop any existing rest timer
    emit(state.copyWith(restSetsRemain: restTime));

    const oneSec = Duration(seconds: 1);
    restSetsTimer = Timer.periodic(oneSec, (_) {
      final remaining = state.restSetsRemain - oneSec;
      if (remaining <= Duration.zero) {
        stopRestSetsTimer();
      } else {
        emit(state.copyWith(restSetsRemain: remaining));
      }
    });
  }

  void stopRestSetsTimer() {
    restSetsTimer?.cancel();
    restSetsTimer = null;
    emit(state.copyWith(restSetsRemain: Duration.zero));
  }

  void increaseRestSets(int seconds) {
    final newRestTime = state.restSetsRemain + Duration(seconds: seconds);
    emit(state.copyWith(restSetsRemain: newRestTime));
  }

  void decreaseRestSets(int seconds) {
    final newRestTime = state.restSetsRemain - Duration(seconds: seconds);
    if (newRestTime > Duration.zero) {
      emit(state.copyWith(restSetsRemain: newRestTime));
    } else {
      emit(state.copyWith(restSetsRemain: Duration.zero));
    }
  }

  void startRestExercisesTimer(Duration restTime) {
    stopRestExercisesTimer(); // Stop any existing rest timer
    emit(state.copyWith(restExercisesRemain: restTime));

    const oneSec = Duration(seconds: 1);
    restExercisesTimer = Timer.periodic(oneSec, (_) {
      final remaining = state.restExercisesRemain - oneSec;
      if (remaining <= Duration.zero) {
        stopRestExercisesTimer();
      } else {
        emit(state.copyWith(restExercisesRemain: remaining));
      }
    });
  }

  void stopRestExercisesTimer() {
    restExercisesTimer?.cancel();
    restExercisesTimer = null;
    emit(state.copyWith(restExercisesRemain: Duration.zero));
  }

  void increaseRestExercises(int seconds) {
    final newRestTime = state.restExercisesRemain + Duration(seconds: seconds);
    emit(state.copyWith(restExercisesRemain: newRestTime));
  }

  void decreaseRestExercises(int seconds) {
    final newRestTime = state.restExercisesRemain - Duration(seconds: seconds);
    if (newRestTime > Duration.zero) {
      emit(state.copyWith(restExercisesRemain: newRestTime));
    } else {
      emit(state.copyWith(restExercisesRemain: Duration.zero));
    }
  }

  @override
  Future<void> close() {
    stopTotalTimer();
    stopRestSetsTimer();
    stopRestExercisesTimer();
    return super.close();
  }
}
