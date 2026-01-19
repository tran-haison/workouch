import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/posthog_analytics_service.dart';
import '../../../../core/utils/error.dart';
import '../../../auth/domain/entities/user.dart';
import '../../data/models/dtos/generate_workout_dto.dart';
import '../../data/models/requests/generate_workout_request.dart';
import '../../data/services/exercise_service.dart';
import '../entities/workout.dart';
import '../enums/workout_goal.dart';
import '../enums/workout_intensity.dart';

abstract class AIWorkoutRepo {
  Future<Either<Error, Workout>> generateShuffleModeWorkout({
    required String preferences,
    User? user,
  });

  Future<Either<Error, Workout>> generateNeatModeWorkout({
    String? workoutName,
    Duration? duration,
    WorkoutIntensity? intensity,
    List<WorkoutGoal>? goals,
    List<String>? bodyParts,
    List<String>? equipments,
    String? location,
    String? injuries,
    User? user,
  });
}

@LazySingleton(as: AIWorkoutRepo)
class AIWorkoutRepoImpl implements AIWorkoutRepo {
  final ExerciseService _exerciseService;

  AIWorkoutRepoImpl(this._exerciseService);

  @override
  Future<Either<Error, Workout>> generateShuffleModeWorkout({
    required String preferences,
    User? user,
  }) async {
    try {
      final request = GenerateWorkoutRequest.shuffleMode(
        mode: 'shuffle',
        preferences: preferences,
        userContext: user != null
            ? UserContextRequest(
                age: user.age,
                height: user.height,
                weight: user.weight,
                activityLevel: user.activityLevel.title,
                gender: user.gender.name,
              )
            : null,
      );

      final res = await _exerciseService.generateWorkout(request.toJson());

      if (res.response.statusCode == HttpStatus.ok && res.data.success) {
        final dto = res.data.data;
        final workout = dto.toEntity();

        // Validate that the workout has exercises
        if (workout.exercises.isEmpty) {
          return Left(
            Error(
              message: 'Generated workout has no exercises. Please try again.',
              errorType: ErrorType.server,
            ),
          );
        }

        PosthogService.logWorkoutGeneratedSuccessShuffle();

        return Right(workout);
      }

      // Try to extract error message from response data
      String errorMessage = AppConstants.commonError;
      final responseData = res.response.data;
      if (responseData is Map<String, dynamic>) {
        errorMessage =
            responseData['message']?.toString() ??
            responseData['error']?.toString() ??
            res.response.statusMessage ??
            AppConstants.commonError;
      } else {
        errorMessage = res.response.statusMessage ?? AppConstants.commonError;
      }

      PosthogService.logWorkoutGeneratedFailed(errorMessage: errorMessage);

      return Left(
        Error(
          message: errorMessage,
          code: res.response.statusCode.toString(),
          errorType: ErrorType.server,
        ),
      );
    } catch (e) {
      final error = handleException(e);
      PosthogService.logWorkoutGeneratedFailed(errorMessage: error.message);
      return Left(error);
    }
  }

  @override
  Future<Either<Error, Workout>> generateNeatModeWorkout({
    String? workoutName,
    Duration? duration,
    WorkoutIntensity? intensity,
    List<WorkoutGoal>? goals,
    List<String>? bodyParts,
    List<String>? equipments,
    String? location,
    String? injuries,
    User? user,
  }) async {
    try {
      final request = GenerateWorkoutRequest.neatMode(
        mode: 'neat',
        userContext: user != null
            ? UserContextRequest(
                age: user.age,
                height: user.height,
                weight: user.weight,
                activityLevel: user.activityLevel.title,
                gender: user.gender.name,
              )
            : null,
        specifications: SpecificationsRequest(
          workoutName: workoutName,
          duration: duration?.inMinutes,
          intensity: intensity?.label,
          goals: goals?.map((goal) => goal.label).toList(),
          bodyParts: bodyParts,
          equipments: equipments,
          location: location,
          injuries: injuries,
        ),
      );

      final res = await _exerciseService.generateWorkout(request.toJson());

      if (res.response.statusCode == HttpStatus.ok && res.data.success) {
        final dto = res.data.data;
        final workout = dto.toEntity();

        // Validate that the workout has exercises
        if (workout.exercises.isEmpty) {
          return Left(
            Error(
              message: 'Generated workout has no exercises. Please try again.',
              errorType: ErrorType.server,
            ),
          );
        }

        PosthogService.logWorkoutGeneratedSuccessNeat();

        return Right(workout);
      }

      // Try to extract error message from response data
      String errorMessage = AppConstants.commonError;
      final responseData = res.response.data;
      if (responseData is Map<String, dynamic>) {
        errorMessage =
            responseData['message']?.toString() ??
            responseData['error']?.toString() ??
            res.response.statusMessage ??
            AppConstants.commonError;
      } else {
        errorMessage = res.response.statusMessage ?? AppConstants.commonError;
      }

      PosthogService.logWorkoutGeneratedFailed(errorMessage: errorMessage);

      return Left(
        Error(
          message: errorMessage,
          code: res.response.statusCode.toString(),
          errorType: ErrorType.server,
        ),
      );
    } catch (e) {
      final error = handleException(e);
      PosthogService.logWorkoutGeneratedFailed(errorMessage: error.message);
      return Left(error);
    }
  }
}
