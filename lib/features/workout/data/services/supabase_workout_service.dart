import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/log.dart';
import '../../domain/entities/workout.dart';
import '../models/dtos/working_exercise_dto.dart';
import '../models/dtos/working_set_dto.dart';
import '../models/dtos/workout_dto.dart';

@lazySingleton
class SupabaseWorkoutService {
  final _supabase = Supabase.instance.client;

  /// Get current user ID from Supabase auth
  String? get _currentUserId => _supabase.auth.currentUser?.id;

  /// Create or update a workout with exercises
  /// Returns true if successful, false if an error occurred
  Future<bool> saveWorkout(Workout workout) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        Log.e('No authenticated user found');
        return false;
      }

      // Convert workout entity to DTO
      final workoutDto = WorkoutDto.fromEntity(workout);
      final isNewWorkout = workoutDto.id.isEmpty;

      // Prepare workout data for Supabase
      final workoutData = <String, dynamic>{
        if (!isNewWorkout) 'id': workoutDto.id,
        'user_id': userId,
        'name': workoutDto.name,
        'rest_time_between_exercises': workoutDto.restTimeBetweenExercises,
      };

      // Upsert workout (insert if new, update if exists)
      final workoutResponse = await _supabase
          .from(AppConstants.supabase.tableWorkouts)
          .upsert(workoutData, onConflict: 'id')
          .select()
          .single();

      final savedWorkoutId = workoutResponse['id'] as String;

      // Delete existing exercises (always replace all exercises)
      // For new workouts, this will be empty, for updates it removes old exercises
      await _supabase
          .from(AppConstants.supabase.tableWorkoutExercises)
          .delete()
          .eq('workout_id', savedWorkoutId);

      // Insert exercises
      if (workoutDto.exercises.isNotEmpty) {
        final exercisesData = workoutDto.exercises.asMap().entries.map((entry) {
          final index = entry.key;
          final exerciseDto = entry.value;

          // Convert sets to JSONB
          final setsJson = exerciseDto.sets.map((set) => set.toJson()).toList();

          return {
            'workout_id': savedWorkoutId,
            'exercise_order': index,
            'exercise_id': exerciseDto.exerciseId,
            'name': exerciseDto.name,
            'gif_url': exerciseDto.gifUrl,
            'description': exerciseDto.description,
            'target_muscles': exerciseDto.targetMuscles,
            'body_parts': exerciseDto.bodyParts,
            'equipments': exerciseDto.equipments,
            'secondary_muscles': exerciseDto.secondaryMuscles,
            'instructions': exerciseDto.instructions,
            'rest_time_between_sets': exerciseDto.restTimeBetweenSets,
            'set_type': exerciseDto.setType,
            'sets': setsJson,
          };
        }).toList();

        await _supabase
            .from(AppConstants.supabase.tableWorkoutExercises)
            .insert(exercisesData);
      }

      return true;
    } catch (e) {
      Log.e('Error saving workout: $e');
      return false;
    }
  }

  /// Get a single workout by ID with all exercises
  /// Returns the workout entity, or null if not found
  Future<Workout?> getWorkout(String workoutId) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        Log.e('No authenticated user found');
        return null;
      }

      // Fetch workout
      final workoutResponse = await _supabase
          .from(AppConstants.supabase.tableWorkouts)
          .select()
          .eq('id', workoutId)
          .eq('user_id', userId)
          .single();

      // Fetch exercises for this workout
      final exercisesResponse =
          await _supabase
                  .from(AppConstants.supabase.tableWorkoutExercises)
                  .select()
                  .eq('workout_id', workoutId)
                  .order('exercise_order', ascending: true)
              as List;

      // Convert exercises to DTOs
      final exerciseDtos = exercisesResponse
          .map((exercise) {
            try {
              final exerciseJson = exercise as Map<String, dynamic>;

              // Convert JSONB sets to WorkingSetDto list
              final setsJson = exerciseJson['sets'] as List<dynamic>? ?? [];
              final sets = setsJson
                  .map(
                    (setJson) =>
                        WorkingSetDto.fromJson(setJson as Map<String, dynamic>),
                  )
                  .toList();

              return WorkingExerciseDto(
                exerciseId: exerciseJson['exercise_id'] as String,
                name: exerciseJson['name'] as String,
                gifUrl: exerciseJson['gif_url'] as String,
                description: exerciseJson['description'] as String,
                targetMuscles: List<String>.from(
                  exerciseJson['target_muscles'] ?? [],
                ),
                bodyParts: List<String>.from(exerciseJson['body_parts'] ?? []),
                equipments: List<String>.from(exerciseJson['equipments'] ?? []),
                secondaryMuscles: List<String>.from(
                  exerciseJson['secondary_muscles'] ?? [],
                ),
                instructions: List<String>.from(
                  exerciseJson['instructions'] ?? [],
                ),
                sets: sets,
                restTimeBetweenSets:
                    exerciseJson['rest_time_between_sets'] as int? ?? 0,
                setType: exerciseJson['set_type'] as String?,
              );
            } catch (e) {
              Log.e('Error parsing exercise: $e');
              return null;
            }
          })
          .where((exercise) => exercise != null)
          .cast<WorkingExerciseDto>()
          .toList();

      // Create WorkoutDto
      final workoutDto = WorkoutDto(
        id: workoutResponse['id'] as String,
        name: workoutResponse['name'] as String,
        exercises: exerciseDtos,
        restTimeBetweenExercises:
            workoutResponse['rest_time_between_exercises'] as int? ?? 0,
      );

      // Convert to entity
      return workoutDto.toEntity();
    } catch (e) {
      Log.e('Error fetching workout: $e');
      return null;
    }
  }

  /// Get all workouts for the current user with their exercises
  /// Returns a list of workout entities
  Future<List<Workout>> getAllWorkouts() async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        Log.e('No authenticated user found');
        return [];
      }

      // Fetch all workouts for the user
      final workoutsResponse =
          await _supabase
                  .from(AppConstants.supabase.tableWorkouts)
                  .select()
                  .eq('user_id', userId)
                  .order('created_at', ascending: false)
              as List;

      if (workoutsResponse.isEmpty) {
        return [];
      }

      // Fetch all exercises for all workouts
      final workoutIds = workoutsResponse
          .map((workout) => (workout as Map<String, dynamic>)['id'] as String)
          .toList();

      // Fetch exercises for all workouts
      // Use OR condition to filter by multiple workout_ids
      // Format: "workout_id.eq.id1,workout_id.eq.id2,..."
      final exercisesResponse = workoutIds.isEmpty
          ? <Map<String, dynamic>>[]
          : (await _supabase
                    .from(AppConstants.supabase.tableWorkoutExercises)
                    .select()
                    .or(workoutIds.map((id) => 'workout_id.eq.$id').join(','))
                    .order('workout_id', ascending: true)
                    .order('exercise_order', ascending: true))
                as List;

      // Group exercises by workout_id
      final exercisesByWorkoutId = <String, List<Map<String, dynamic>>>{};
      for (final exercise in exercisesResponse) {
        final exerciseMap = exercise as Map<String, dynamic>;
        final workoutId = exerciseMap['workout_id'] as String;
        exercisesByWorkoutId.putIfAbsent(workoutId, () => []).add(exerciseMap);
      }

      // Convert to Workout entities
      final workouts = <Workout>[];
      for (final workout in workoutsResponse) {
        final workoutJson = workout as Map<String, dynamic>;
        final workoutId = workoutJson['id'] as String;
        final exercisesJson = exercisesByWorkoutId[workoutId] ?? [];

        // Convert exercises to DTOs
        final exerciseDtos = exercisesJson
            .map((exerciseJson) {
              try {
                // Convert JSONB sets to WorkingSetDto list
                final setsJson = exerciseJson['sets'] as List<dynamic>? ?? [];
                final sets = setsJson
                    .map(
                      (setJson) => WorkingSetDto.fromJson(
                        setJson as Map<String, dynamic>,
                      ),
                    )
                    .toList();

                return WorkingExerciseDto(
                  exerciseId: exerciseJson['exercise_id'] as String,
                  name: exerciseJson['name'] as String,
                  gifUrl: exerciseJson['gif_url'] as String,
                  description: exerciseJson['description'] as String,
                  targetMuscles: List<String>.from(
                    exerciseJson['target_muscles'] ?? [],
                  ),
                  bodyParts: List<String>.from(
                    exerciseJson['body_parts'] ?? [],
                  ),
                  equipments: List<String>.from(
                    exerciseJson['equipments'] ?? [],
                  ),
                  secondaryMuscles: List<String>.from(
                    exerciseJson['secondary_muscles'] ?? [],
                  ),
                  instructions: List<String>.from(
                    exerciseJson['instructions'] ?? [],
                  ),
                  sets: sets,
                  restTimeBetweenSets:
                      exerciseJson['rest_time_between_sets'] as int? ?? 0,
                  setType: exerciseJson['set_type'] as String?,
                );
              } catch (e) {
                Log.e('Error parsing exercise: $e');
                return null;
              }
            })
            .where((exercise) => exercise != null)
            .cast<WorkingExerciseDto>()
            .toList();

        // Create WorkoutDto
        final workoutDto = WorkoutDto(
          id: workoutId,
          name: workoutJson['name'] as String,
          exercises: exerciseDtos,
          restTimeBetweenExercises:
              workoutJson['rest_time_between_exercises'] as int? ?? 0,
        );

        // Convert to entity and add to list
        workouts.add(workoutDto.toEntity());
      }

      return workouts;
    } catch (e) {
      Log.e('Error fetching workouts: $e');
      return [];
    }
  }
}
