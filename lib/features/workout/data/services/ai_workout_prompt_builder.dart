import 'package:workouch/features/auth/domain/entities/user.dart';
import 'package:workouch/features/workout/domain/enums/workout_goal.dart';
import 'package:workouch/features/workout/domain/enums/workout_intensity.dart';
import 'package:workouch/core/utils/health_utils.dart';

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
  "workout_name": "string",
  "exercises": [
    {
      "name": "string (exercise name)",
      "sets": number,
      "reps": number,
      "weight_kg": number (0 if bodyweight),
      "duration_seconds": number (0 if not time-based),
      "rest_between_sets_seconds": number,
      "set_type": "weightBased" | "timeBased" | "distanceBased" | "repsOnly"
    }
  ],
  "rest_time_between_exercises": number (in seconds)
}

Guidelines:
- Use realistic exercise names that exist in standard fitness databases
- Ensure sets, reps, and weights are appropriate for the user's fitness level
- For time-based exercises (cardio, HIIT), use duration_seconds and set_type "timeBased"
- For bodyweight exercises, set weight_kg to 0
- Rest times should be appropriate for the exercise type and intensity
- Create a balanced workout that matches the user's preferences
- If user mentions injuries or limitations, avoid exercises that could aggravate them

Return ONLY valid JSON, no additional text or explanation.''';
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
        ? 'Any body parts'
        : bodyParts.join(', ');
    final equipmentsList = equipments.isEmpty
        ? 'Any equipment'
        : equipments.join(', ');
    final injuriesText = injuriesLimitations?.isNotEmpty == true
        ? '\nInjuries/Limitations: $injuriesLimitations'
        : '';

    return '''You are an expert fitness trainer and workout planner. Create a personalized workout plan based on the user's detailed preferences.

$userContext

Workout Specifications:
- Name: $workoutName
- Duration: $durationMinutes minutes
- Intensity: $intensityLabel
- Goals: $goalsLabels
- Target Body Parts: $bodyPartsList
- Available Equipment: $equipmentsList
- Location: $location$injuriesText

Please generate a complete workout plan in JSON format with the following structure:
{
  "workout_name": "$workoutName",
  "exercises": [
    {
      "name": "string (exercise name)",
      "sets": number,
      "reps": number,
      "weight_kg": number (0 if bodyweight),
      "duration_seconds": number (0 if not time-based),
      "rest_between_sets_seconds": number,
      "set_type": "weightBased" | "timeBased" | "distanceBased" | "repsOnly"
    }
  ],
  "rest_time_between_exercises": number (in seconds)
}

Guidelines:
- Use realistic exercise names that exist in standard fitness databases
- Ensure the workout fits within the specified duration ($durationMinutes minutes)
- Match the intensity level ($intensityLabel)
- Focus on the specified goals: $goalsLabels
- Target the specified body parts: $bodyPartsList
- Only use exercises that can be performed with available equipment: $equipmentsList
- Consider the location constraints: $location
${injuriesText.isNotEmpty ? '- Avoid exercises that could aggravate: $injuriesLimitations' : ''}
- Ensure sets, reps, and weights are appropriate for the user's fitness level
- For time-based exercises (cardio, HIIT), use duration_seconds and set_type "timeBased"
- For bodyweight exercises, set weight_kg to 0
- Rest times should be appropriate for the exercise type and intensity
- Create a balanced workout that matches all specifications

Return ONLY valid JSON, no additional text or explanation.''';
  }

  static String _buildUserContext(User? user) {
    if (user == null ||
        (user.age == 0 && user.weight == 0 && user.height == 0)) {
      return 'User profile information is not available.';
    }

    final genderLabel = user.gender == Gender.male ? 'Male' : 'Female';
    final activityLevelLabel = user.activityLevel.title;

    return '''User Profile:
- Age: ${user.age} years
- Gender: $genderLabel
- Height: ${user.height} cm
- Weight: ${user.weight} kg
- Activity Level: $activityLevelLabel''';
  }
}
