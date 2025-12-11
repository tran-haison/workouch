import 'package:either_dart/either.dart';
import '../../../../core/utils/error.dart';
import '../../../auth/domain/entities/user.dart';
import '../entities/workout.dart';
import '../enums/workout_goal.dart';
import '../enums/workout_intensity.dart';

abstract class AIWorkoutRepo {
  Future<Either<Error, Workout>> generateShuffleModeWorkout({
    required String userPreferences,
    User? user,
  });

  Future<Either<Error, Workout>> generateNeatModeWorkout({
    required String workoutName,
    required Duration duration,
    required WorkoutIntensity intensity,
    required List<WorkoutGoal> goals,
    required List<String> bodyParts,
    required List<String> equipments,
    required String location,
    String? injuriesLimitations,
    User? user,
  });
}
