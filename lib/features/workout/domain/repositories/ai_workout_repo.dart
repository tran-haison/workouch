import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
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
        return Right(dto.toEntity());
      }

      return Left(
        Error(
          message: res.response.statusMessage ?? AppConstants.commonError,
          code: res.response.statusCode.toString(),
          errorType: ErrorType.server,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
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
        return Right(dto.toEntity());
      }

      return Left(
        Error(
          message: res.response.statusMessage ?? AppConstants.commonError,
          code: res.response.statusCode.toString(),
          errorType: ErrorType.server,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }
}
