import 'dart:convert';
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

      final request = <String, dynamic>{
        'model': AppConstants.openaiModel,
        'tools': [
          {
            'type': 'file_search',
            'vector_store_ids': ['vs_693b860bc2cc819199b63e41d29496aa'],
          },
        ],
        'input': [
          {'role': 'system', 'content': _systemPrompt},
          {'role': 'user', 'content': prompt},
        ],
      };

      final response = await _openAIService.generateWorkout(request);
      final responseData = response.data;

      if (responseData['output'] == null ||
          (responseData['output'] as List).isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final output = responseData['output'] as List;

      // Filter for message type outputs only
      final messageOutputs = output.where((item) {
        final itemMap = item as Map<String, dynamic>;
        return itemMap['type'] == 'message' && itemMap['content'] != null;
      }).toList();

      if (messageOutputs.isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final lastMessage = messageOutputs.last as Map<String, dynamic>;
      final content = lastMessage['content'] as List?;

      if (content == null || content.isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final firstContent = content.first as Map<String, dynamic>;
      final text = firstContent['text'] as String?;

      if (text == null || text.isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final json = jsonDecode(text) as Map<String, dynamic>;
      final dto = AIWorkoutDto.fromJson(json);
      final workout = dto.toEntity();
      Log.e('workout: $workout');

      return Right(workout);
    } catch (e) {
      return Left(handleException(e));
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

      final request = <String, dynamic>{
        'model': AppConstants.openaiModel,
        'tools': [
          {
            'type': 'file_search',
            'vector_store_ids': ['vs_693b860bc2cc819199b63e41d29496aa'],
          },
        ],
        'input': [
          {'role': 'system', 'content': _systemPrompt},
          {'role': 'user', 'content': prompt},
        ],
      };

      final response = await _openAIService.generateWorkout(request);
      final responseData = response.data;

      if (responseData['output'] == null ||
          (responseData['output'] as List).isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final output = responseData['output'] as List;

      // Filter for message type outputs only
      final messageOutputs = output.where((item) {
        final itemMap = item as Map<String, dynamic>;
        return itemMap['type'] == 'message' && itemMap['content'] != null;
      }).toList();

      if (messageOutputs.isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final lastMessage = messageOutputs.last as Map<String, dynamic>;
      final content = lastMessage['content'] as List?;

      if (content == null || content.isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final firstContent = content.first as Map<String, dynamic>;
      final text = firstContent['text'] as String?;

      if (text == null || text.isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final json = jsonDecode(text) as Map<String, dynamic>;
      final dto = AIWorkoutDto.fromJson(json);
      final workout = dto.toEntity();

      return Right(workout);
    } catch (e) {
      return Left(handleException(e));
    }
  }
}

const _systemPrompt =
    'You are an expert fitness trainer. Always respond with valid JSON only. \n\n'
    'IMPORTANT: You have access to an input file containing a complete database of exercises. Each exercise in the input file has this structure: {exerciseId, name, gifUrl, targetMuscles, bodyParts, equipments, secondaryMuscles, instructions, description}. '
    'You MUST ONLY select exercises from this input file. Do not invent or use exercise names that are not in the input file. '
    'When copying exercise data, use the exact field names and values as they appear in the input file (camelCase format: exerciseId, name, gifUrl, targetMuscles, bodyParts, equipments, secondaryMuscles, instructions, description).';
