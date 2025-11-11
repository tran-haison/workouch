import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/error.dart';
import '../../data/services/supabase_workout_service.dart';
import '../entities/workout.dart';

abstract class WorkoutRepo {
  Future<Either<Error, bool>> saveWorkout(Workout workout);
  Future<Either<Error, Workout>> getWorkout(String workoutId);
  Future<Either<Error, List<Workout>>> getAllWorkouts();
}

@LazySingleton(as: WorkoutRepo)
class WorkoutRepoImpl implements WorkoutRepo {
  final SupabaseWorkoutService _workoutService;

  WorkoutRepoImpl(this._workoutService);

  @override
  Future<Either<Error, bool>> saveWorkout(Workout workout) async {
    try {
      final success = await _workoutService.saveWorkout(workout);
      if (success) {
        return Right(true);
      }
      return Left(
        Error(
          message: AppConstants.workoutSavedError,
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, Workout>> getWorkout(String workoutId) async {
    try {
      final workout = await _workoutService.getWorkout(workoutId);
      if (workout != null) {
        return Right(workout);
      }
      return Left(
        Error(
          message: AppConstants.workoutNotFound,
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, List<Workout>>> getAllWorkouts() async {
    try {
      final workouts = await _workoutService.getAllWorkouts();
      return Right(workouts);
    } catch (e) {
      return Left(handleException(e));
    }
  }
}
