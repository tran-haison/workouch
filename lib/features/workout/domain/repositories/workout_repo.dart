import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:workouch/features/workout/domain/entities/user_subscription.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/error.dart';
import '../../data/services/supabase_workout_service.dart';
import '../entities/workout.dart';

abstract class WorkoutRepo {
  Future<Either<Error, bool>> saveWorkout(Workout workout);
  Future<Either<Error, Workout>> getWorkout(String workoutId);
  Future<Either<Error, List<Workout>>> getAllWorkouts();
  Future<Either<Error, bool>> deleteWorkout(String workoutId);
  Future<Either<Error, UserSubscription>> getUserSubscription();
  Future<Either<Error, bool>> incrementWorkoutGenUsed();
  Future<Either<Error, bool>> resetSubscriptionPeriod();
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

  @override
  Future<Either<Error, bool>> deleteWorkout(String workoutId) async {
    try {
      final success = await _workoutService.deleteWorkout(workoutId);
      if (success) {
        return const Right(true);
      }
      return Left(
        Error(
          message: AppConstants.workoutDeletedError,
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, UserSubscription>> getUserSubscription() async {
    try {
      final subscription = await _workoutService.getUserSubscription();
      if (subscription != null) {
        return Right(subscription);
      }
      return Left(
        Error(
          message: AppConstants.userSubscriptionNotFound,
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, bool>> incrementWorkoutGenUsed() async {
    try {
      final success = await _workoutService.incrementWorkoutGenUsed();
      if (success) {
        return const Right(true);
      }
      return Left(
        Error(
          message: AppConstants.incrementWorkoutGenUsedFailed,
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, bool>> resetSubscriptionPeriod() async {
    try {
      final success = await _workoutService.resetSubscriptionPeriod();
      if (success) {
        return const Right(true);
      }
      return Left(
        Error(
          message: AppConstants.resetSubscriptionPeriodFailed,
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }
}
