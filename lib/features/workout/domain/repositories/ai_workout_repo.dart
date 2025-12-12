import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/error.dart';
import '../../../../core/utils/log.dart';
import '../../../auth/domain/entities/user.dart';
import '../entities/workout.dart';
import '../enums/workout_goal.dart';
import '../enums/workout_intensity.dart';
import '../../data/models/dtos/ai_workout_dto.dart';
import '../../data/models/requests/openai_request.dart';
import '../../data/services/ai_workout_prompt_builder.dart';
import '../../data/services/openai_service.dart';

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

@LazySingleton(as: AIWorkoutRepo)
class AIWorkoutRepoImpl implements AIWorkoutRepo {
  final OpenAIService _openAIService;

  AIWorkoutRepoImpl(this._openAIService);

  @override
  Future<Either<Error, Workout>> generateShuffleModeWorkout({
    required String userPreferences,
    User? user,
  }) async {
    try {
      final prompt = AIWorkoutPromptBuilder.buildShuffleModePrompt(
        userPreferences: userPreferences,
        user: user,
      );

      final request = OpenAIRequest(
        model: AppConstants.openaiModel,
        input: [
          const OpenAIInput(
            role: 'system',
            content: OpenAIContent.text(
              'You are an expert fitness trainer. Always respond with valid JSON only.\n\nIMPORTANT: You have access to an input file containing a complete database of exercises. Each exercise in the input file has this structure: {exerciseId, name, gifUrl, targetMuscles, bodyParts, equipments, secondaryMuscles, instructions, description}. You MUST ONLY select exercises from this input file. Do not invent or use exercise names that are not in the input file. When copying exercise data, use the exact field names and values as they appear in the input file (camelCase format: exerciseId, name, gifUrl, targetMuscles, bodyParts, equipments, secondaryMuscles, instructions, description).',
            ),
          ),
          OpenAIInput(role: 'user', content: OpenAIContent.text(prompt)),
        ],
      );

      final response = await _openAIService.generateWorkout(request);
      final responseData = response.data;

      if (responseData.output.isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final text = responseData.output.first.content.first.text;
      final json = jsonDecode(text) as Map<String, dynamic>;
      final aiWorkout = AIWorkoutDto.fromJson(json);

      // Convert AI workout to domain Workout entity
      final workout = aiWorkout.toEntity();

      return Right(workout);
    } on DioException catch (e) {
      Log.e('OpenAI API error: ${e.message}');
      return Left(
        Error(
          message: AppConstants.workoutGenerationError,
          code: e.response?.statusCode.toString() ?? '',
          errorType: ErrorType.network,
        ),
      );
    } catch (e) {
      Log.e('Error generating workout: $e');
      return Left(
        Error(
          message: AppConstants.workoutGenerationError,
          errorType: ErrorType.other,
        ),
      );
    }
  }

  @override
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
  }) async {
    try {
      final prompt = AIWorkoutPromptBuilder.buildNeatModePrompt(
        workoutName: workoutName,
        duration: duration,
        intensity: intensity,
        goals: goals,
        bodyParts: bodyParts,
        equipments: equipments,
        location: location,
        injuriesLimitations: injuriesLimitations,
        user: user,
      );

      final request = OpenAIRequest(
        model: AppConstants.openaiModel,
        input: [
          const OpenAIInput(
            role: 'system',
            content: OpenAIContent.text(
              'You are an expert fitness trainer. Always respond with valid JSON only.\n\nIMPORTANT: You have access to an input file containing a complete database of exercises. Each exercise in the input file has this structure: {exerciseId, name, gifUrl, targetMuscles, bodyParts, equipments, secondaryMuscles, instructions, description}. You MUST ONLY select exercises from this input file. Do not invent or use exercise names that are not in the input file. When copying exercise data, use the exact field names and values as they appear in the input file (camelCase format: exerciseId, name, gifUrl, targetMuscles, bodyParts, equipments, secondaryMuscles, instructions, description).',
            ),
          ),
          OpenAIInput(role: 'user', content: OpenAIContent.text(prompt)),
        ],
      );

      final response = await _openAIService.generateWorkout(request);
      final responseData = response.data;

      if (responseData.output.isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final content = responseData.output.first.content.first.text;
      final workoutData = jsonDecode(content) as Map<String, dynamic>;
      final aiWorkout = AIWorkoutDto.fromJson(workoutData);

      // Convert AI workout to domain Workout entity
      final workout = aiWorkout.toEntity();

      return Right(workout);
    } on DioException catch (e) {
      Log.e('OpenAI API error: ${e.message}');
      return Left(
        Error(
          message: AppConstants.workoutGenerationError,
          code: e.response?.statusCode.toString() ?? '',
          errorType: ErrorType.network,
        ),
      );
    } catch (e) {
      Log.e('Error generating workout: $e');
      return Left(
        Error(
          message: AppConstants.workoutGenerationError,
          errorType: ErrorType.other,
        ),
      );
    }
  }
}
