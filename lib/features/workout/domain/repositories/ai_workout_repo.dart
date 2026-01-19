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
  final PostHogAnalyticsService _posthogService;

  AIWorkoutRepoImpl(this._exerciseService, this._posthogService);

  @override
  Future<Either<Error, Workout>> generateShuffleModeWorkout({
    required String preferences,
    User? user,
  }) async {
    try {
      // Track AI workout generation (shuffle mode) start
      await _posthogService.capture(
        PostHogAnalyticsService.eventAIWorkoutGenerateShuffleStarted,
      );

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

        // Track successful AI workout generation
        await _posthogService.capture(
          PostHogAnalyticsService.eventAIWorkoutGenerated,
          properties: {
            'workout_id': workout.id,
            'exercise_count': workout.exercises.length,
          },
        );

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

      await _posthogService.capture(
        PostHogAnalyticsService.eventAIWorkoutGenerateShuffleFailed,
        properties: {'error': errorMessage},
      );

      return Left(
        Error(
          message: errorMessage,
          code: res.response.statusCode.toString(),
          errorType: ErrorType.server,
        ),
      );
    } catch (e) {
      final error = handleException(e);
      await _posthogService.capture(
        PostHogAnalyticsService.eventAIWorkoutGenerateShuffleFailed,
        properties: {'error': error.message},
      );
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
      // Track AI workout generation (neat mode) start
      await _posthogService.capture(
        PostHogAnalyticsService.eventAIWorkoutGenerateNeatStarted,
        properties: {
          'duration_minutes': duration?.inMinutes ?? 0,
          'intensity': intensity?.name ?? '',
          'goals': goals?.map((g) => g.name).toList() ?? <String>[],
        },
      );

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

        // Track successful AI workout generation
        await _posthogService.capture(
          PostHogAnalyticsService.eventAIWorkoutGenerated,
          properties: {
            'workout_id': workout.id,
            'exercise_count': workout.exercises.length,
          },
        );

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

      await _posthogService.capture(
        PostHogAnalyticsService.eventAIWorkoutGenerateNeatFailed,
        properties: {'error': errorMessage},
      );

      return Left(
        Error(
          message: errorMessage,
          code: res.response.statusCode.toString(),
          errorType: ErrorType.server,
        ),
      );
    } catch (e) {
      final error = handleException(e);
      await _posthogService.capture(
        PostHogAnalyticsService.eventAIWorkoutGenerateNeatFailed,
        properties: {'error': error.message},
      );
      return Left(error);
    }
  }
}
