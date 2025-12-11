import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/error.dart';
import '../../../../core/utils/log.dart';
import '../../../auth/domain/entities/user.dart';
import '../../domain/entities/workout.dart';
import '../../domain/entities/working_exercise.dart';
import '../../domain/entities/working_set.dart';
import '../../domain/enums/workout_goal.dart';
import '../../domain/enums/workout_intensity.dart';
import '../../domain/repositories/ai_workout_repo.dart';
import '../models/dtos/ai_workout_response_dto.dart';
import '../models/dtos/openai_request_dto.dart';
import '../services/ai_workout_prompt_builder.dart';
import '../services/openai_service.dart';

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

      final request = OpenAIRequestDto(
        model: AppConstants.openaiModel,
        messages: [
          const OpenAIMessageDto(
            role: 'system',
            content:
                'You are an expert fitness trainer. Always respond with valid JSON only.',
          ),
          OpenAIMessageDto(role: 'user', content: prompt),
        ],
        temperature: 0.7,
        responseFormat: const OpenAIResponseFormatDto(type: 'json_object'),
      );

      final response = await _openAIService.generateWorkout(request);
      final responseData = response.data;

      if (responseData.choices.isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final content = responseData.choices.first.message.content;
      final workoutData = jsonDecode(content) as Map<String, dynamic>;
      final aiWorkout = AIWorkoutResponseDto.fromJson(workoutData);

      // Convert AI workout to domain Workout entity
      final workout = await _convertToWorkout(aiWorkout);

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

      final request = OpenAIRequestDto(
        model: AppConstants.openaiModel,
        messages: [
          const OpenAIMessageDto(
            role: 'system',
            content:
                'You are an expert fitness trainer. Always respond with valid JSON only.',
          ),
          OpenAIMessageDto(role: 'user', content: prompt),
        ],
        temperature: 0.7,
        responseFormat: const OpenAIResponseFormatDto(type: 'json_object'),
      );

      final response = await _openAIService.generateWorkout(request);
      final responseData = response.data;

      if (responseData.choices.isEmpty) {
        return Left(
          Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.server,
          ),
        );
      }

      final content = responseData.choices.first.message.content;
      final workoutData = jsonDecode(content) as Map<String, dynamic>;
      final aiWorkout = AIWorkoutResponseDto.fromJson(workoutData);

      // Convert AI workout to domain Workout entity
      final workout = await _convertToWorkout(aiWorkout);

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

  Future<Workout> _convertToWorkout(AIWorkoutResponseDto aiWorkout) async {
    final exercises = <WorkingExercise>[];

    for (final aiExercise in aiWorkout.exercises) {
      // Create working exercise from AI response
      // Note: We'll use the exercise name as-is since we can't reliably match
      // exercises from the database by name alone
      final workingExercise = WorkingExercise(
        exerciseId: '',
        name: aiExercise.name,
        description: '',
        gifUrl: '',
        targetMuscles: [],
        bodyParts: [],
        equipments: [],
        secondaryMuscles: [],
        instructions: [],
      );

      // Set sets based on set type
      final sets = _createWorkingSets(aiExercise);
      final updatedExercise = workingExercise.copyWith(
        sets: sets,
        restTimeBetweenSets: Duration(
          seconds: aiExercise.restBetweenSetsSeconds,
        ),
        setType: _getSetType(aiExercise.setType),
      );

      exercises.add(updatedExercise);
    }

    return Workout(
      name: aiWorkout.workoutName,
      exercises: exercises,
      restTimeBetweenExercises: Duration(
        seconds: aiWorkout.restTimeBetweenExercises,
      ),
    );
  }

  List<WorkingSet> _createWorkingSets(AIExerciseDto aiExercise) {
    final sets = <WorkingSet>[];
    final setType = _getSetType(aiExercise.setType);

    switch (setType) {
      case WorkingSetType.weightBased:
        sets.add(
          WorkingSet.weightBased(
            sets: aiExercise.sets,
            reps: aiExercise.reps,
            weight: aiExercise.weightKg,
          ),
        );
        break;
      case WorkingSetType.timeBased:
        sets.add(
          WorkingSet.timeBased(
            duration: Duration(seconds: aiExercise.durationSeconds),
          ),
        );
        break;
      case WorkingSetType.repsOnly:
        sets.add(
          WorkingSet.repsOnly(sets: aiExercise.sets, reps: aiExercise.reps),
        );
        break;
      case WorkingSetType.distanceBased:
        // Distance-based not typically used in AI responses, but handle it
        sets.add(const WorkingSet.distanceBased(distance: 0.0));
        break;
    }

    return sets;
  }

  WorkingSetType _getSetType(String setType) {
    switch (setType.toLowerCase()) {
      case 'timebased':
        return WorkingSetType.timeBased;
      case 'distancebased':
        return WorkingSetType.distanceBased;
      case 'repsonly':
        return WorkingSetType.repsOnly;
      case 'weightbased':
      default:
        return WorkingSetType.weightBased;
    }
  }
}
