import 'package:workouch/features/auth/domain/entities/user.dart';
import 'package:workouch/features/workout/domain/enums/workout_goal.dart';
import 'package:workouch/features/workout/domain/enums/workout_intensity.dart';

import '../../../../core/constants/app_constants.dart';

class AIWorkoutPromptBuilder {
  /// Build prompt for Shuffle Mode (simple text input)
  static String buildShuffleModePrompt({
    required String userPreferences,
    User? user,
  }) {
    final userContext = _buildUserContext(user);

    return '''You are an expert fitness trainer and workout planner. Create a personalized workout plan based on the user's preferences.

      $userContext

      User Preferences:
      $userPreferences

      Please generate a complete workout plan in JSON format with the following structure:
      {
        "name": "string (workout name)",
        "exercises": [
          {
            "exerciseId": "string (copy value from exerciseId field in input file)",
            "name": "string (copy value from name field in input file)",
            "gifUrl": "string (copy value from gifUrl field in input file)",
            "description": "string (copy value from description field in input file)",
            "targetMuscles": ["string"] (copy array from targetMuscles field in input file),
            "bodyParts": ["string"] (copy array from bodyParts field in input file),
            "equipments": ["string"] (copy array from equipments field in input file),
            "secondaryMuscles": ["string"] (copy array from secondaryMuscles field in input file),
            "instructions": ["string"] (copy array from instructions field in input file),
            "sets": [
              {
                "type": "weightBased" | "timeBased" | "distanceBased" | "repsOnly",
                "sets": number (number of sets, 0 for timeBased),
                "reps": number (reps per set, 0 for timeBased),
                "weight": number (weight in kg, 0.0 for bodyweight or timeBased),
                "duration": number (duration in seconds, 0 for non-timeBased),
                "distance": number (distance in meters, 0.0 for non-distanceBased)
              }
            ],
            "restTimeBetweenSets": number (rest time in seconds between sets in this exercise),
            "setType": "weightBased" | "timeBased" | "distanceBased" | "repsOnly"
          }
        ],
        "restTimeBetweenExercises": number (rest time in seconds between exercises in this workout)
      }

      CRITICAL GUIDELINES:
      - You MUST ONLY use exercises that exist in the input file provided. The input file uses camelCase field names (exerciseId, gifUrl, targetMuscles, bodyParts, equipments, secondaryMuscles, instructions, description). Copy BOTH the field names and values exactly as they appear in the input file - use the same camelCase field names in your JSON response.
      - Select appropriate exercises based on the user's preferences, body parts, equipment, and goals mentioned.
      - For sets array:
        - weightBased: Provide sets (number of sets), reps (reps per set), weight (kg). Set duration=0, distance=0.0
        - timeBased: Provide duration (seconds). Set sets=0, reps=0, weight=0.0, distance=0.0
        - repsOnly: Provide sets and reps. Set weight=0.0, duration=0, distance=0.0
        - distanceBased: Provide distance (meters). Set sets=0, reps=0, weight=0.0, duration=0
      - Ensure sets, reps, weights, and durations are appropriate for the user's fitness level
      - Rest times should be appropriate for the exercise type and intensity (30-90 seconds for strength, 10-30 seconds for HIIT)
      - Create a balanced workout that matches the user's preferences
      - If user mentions injuries or limitations, avoid exercises from the input file that could aggravate them
      - Include 4-8 exercises for a complete workout
      - Ensure the workout flows logically (e.g., compound movements before isolation, full body or split appropriately)

      Return ONLY valid JSON, no additional text, markdown formatting, or explanation.''';
  }

  /// Build prompt for Neat Mode (structured preferences)
  static String buildNeatModePrompt({
    required String workoutName,
    required Duration duration,
    required WorkoutIntensity intensity,
    required List<WorkoutGoal> goals,
    required List<String> bodyParts,
    required List<String> equipments,
    required String location,
    String? injuriesLimitations,
    User? user,
  }) {
    final userContext = _buildUserContext(user);
    final durationMinutes = duration.inMinutes;
    final intensityLabel = intensity.label;
    final goalsLabels = goals.map((g) => g.label).join(', ');
    final bodyPartsList = bodyParts.isEmpty
        ? AppConstants.anyBodyPart
        : bodyParts.join(', ');
    final equipmentsList = equipments.isEmpty
        ? AppConstants.anyEquipment
        : equipments.join(', ');

    return '''You are an expert fitness trainer and workout planner. Create a personalized workout plan based on the user's detailed preferences.

      $userContext

      Workout Specifications:
      - Name: $workoutName
      - Duration: $durationMinutes minutes
      - Intensity: $intensityLabel
      - Goals: $goalsLabels
      - Target Body Parts: $bodyPartsList
      - Available Equipment: $equipmentsList
      - Location: $location
      ${injuriesLimitations?.isNotEmpty == true ? '- Injuries/Limitations: $injuriesLimitations\n' : ''}

      Please generate a complete workout plan in JSON format with the following structure:
      {
        "name": "$workoutName",
        "exercises": [
          {
            "exerciseId": "string (copy value from exerciseId field in input file)",
            "name": "string (copy value from name field in input file)",
            "gifUrl": "string (copy value from gifUrl field in input file)",
            "description": "string (copy value from description field in input file)",
            "targetMuscles": ["string"] (copy array from targetMuscles field in input file),
            "bodyParts": ["string"] (copy array from bodyParts field in input file),
            "equipments": ["string"] (copy array from equipments field in input file),
            "secondaryMuscles": ["string"] (copy array from secondaryMuscles field in input file),
            "instructions": ["string"] (copy array from instructions field in input file),
            "sets": [
              {
                "type": "weightBased" | "timeBased" | "distanceBased" | "repsOnly",
                "sets": number (number of sets, 0 for timeBased),
                "reps": number (reps per set, 0 for timeBased),
                "weight": number (weight in kg, 0.0 for bodyweight or timeBased),
                "duration": number (duration in seconds, 0 for non-timeBased),
                "distance": number (distance in meters, 0.0 for non-distanceBased)
              }
            ],
            "restTimeBetweenSets": number (rest time in seconds between sets in this exercise),
            "setType": "weightBased" | "timeBased" | "distanceBased" | "repsOnly"
          }
        ],
        "restTimeBetweenExercises": number (rest time in seconds between exercises in this workout)
      }

      CRITICAL GUIDELINES:
      - You MUST ONLY use exercises that exist in the input file provided. The input file uses camelCase field names (exerciseId, gifUrl, targetMuscles, bodyParts, equipments, secondaryMuscles, instructions, description). Copy BOTH the field names and values exactly as they appear in the input file - use the same camelCase field names in your JSON response.
      - Filter exercises from the input file based on:
        - Target Body Parts: $bodyPartsList (select exercises where bodyParts match)
        - Available Equipment: $equipmentsList (select exercises where equipments match or are compatible)
        - Goals: $goalsLabels (select exercises that support these goals)
        - Location: $location (ensure exercises can be performed at this location)
      ${injuriesLimitations?.isNotEmpty == true ? '- AVOID exercises from the input file that could aggravate: $injuriesLimitations\n' : ''}- Ensure the workout fits within the specified duration ($durationMinutes minutes)
      - Match the intensity level ($intensityLabel):
        * Beginner: Lower reps (8-12), moderate weights, longer rests (60-90s)
        * Intermediate: Moderate reps (10-15), moderate-heavy weights, moderate rests (45-60s)
        * Advanced: Higher reps (15-20) or heavy weights with low reps (4-8), shorter rests (30-45s)
      - For sets array:
        * weightBased: Provide sets (number of sets), reps (reps per set), weight (kg). Set duration=0, distance=0.0
        * timeBased: Provide duration (seconds). Set sets=0, reps=0, weight=0.0, distance=0.0
        * repsOnly: Provide sets and reps. Set weight=0.0, duration=0, distance=0.0
        * distanceBased: Provide distance (meters). Set sets=0, reps=0, weight=0.0, duration=0
      - Rest times should be appropriate:
        * Strength/Power: 60-120 seconds
        * Hypertrophy: 30-90 seconds
        * Endurance: 20-45 seconds
        * HIIT: 10-30 seconds
      - Create a balanced workout that matches all specifications
      - Include 4-8 exercises appropriate for the duration
      - Ensure the workout flows logically (e.g., compound movements before isolation, full body or split appropriately)
      - Calculate total workout time including sets, reps, and rest periods to fit within $durationMinutes minutes

      Return ONLY valid JSON, no additional text, markdown formatting, or explanation.''';
  }

  static String _buildUserContext(User? user) {
    if (user == null) {
      return 'User profile information is not available.';
    }

    return '''User Profile:
      - Age: ${user.age <= 0 ? 'Not available' : user.age}
      - Gender: ${user.gender.name}
      - Height: ${user.height <= 0 ? 'Not available' : '${user.height} cm'}
      - Weight: ${user.weight <= 0 ? 'Not available' : '${user.weight} kg'}
      - Activity Level: ${user.activityLevel.description}''';
  }
}
