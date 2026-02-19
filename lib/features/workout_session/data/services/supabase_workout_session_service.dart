import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/log.dart';
import '../../domain/entities/exercise_personal_record.dart';
import '../../domain/entities/workout_session.dart';
import '../models/dtos/exercise_personal_record_dto.dart';
import '../models/dtos/workout_session_dto.dart';
import '../models/dtos/workout_session_exercise_dto.dart';
import '../../../../features/workout/data/models/dtos/working_set_dto.dart';

@lazySingleton
class SupabaseWorkoutSessionService {
  final _supabase = Supabase.instance.client;

  String? get _currentUserId => _supabase.auth.currentUser?.id;

  /// Save a completed workout session (insert session, exercises, upsert user_workout_weeks)
  Future<bool> saveWorkoutSession(WorkoutSession session) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        Log.e('No authenticated user found');
        return false;
      }

      final sessionDto = WorkoutSessionDto.fromEntity(session);

      // Insert workout session
      final sessionData = <String, dynamic>{
        'user_id': userId,
        'workout_id': sessionDto.workoutId,
        'workout_name': sessionDto.workoutName,
        'started_at': sessionDto.startedAt,
        'completed_at': sessionDto.completedAt,
        'total_duration_seconds': sessionDto.totalDurationSeconds,
        'total_volume_kg': sessionDto.totalVolumeKg,
        'total_sets': sessionDto.totalSets,
        'total_exercises': sessionDto.totalExercises,
        'calories_burned': sessionDto.caloriesBurned,
        'notes': sessionDto.notes,
      };

      final sessionResponse = await _supabase
          .from(AppConstants.supabase.tableWorkoutSessions)
          .insert(sessionData)
          .select()
          .single();

      final savedSessionId = sessionResponse['id'] as String;

      // Insert workout session exercises
      if (sessionDto.exercises.isNotEmpty) {
        final exercisesData = sessionDto.exercises.asMap().entries.map((e) {
          final dto = e.value;
          final setsJson = dto.sets.map((s) => s.toJson()).toList();
          return {
            'workout_session_id': savedSessionId,
            'exercise_order': e.key,
            'exercise_id': dto.exerciseId,
            'name': dto.name,
            'gif_url': dto.gifUrl,
            'set_type': dto.setType,
            'sets': setsJson,
            'rest_time_between_sets': dto.restTimeBetweenSets,
            'total_volume_kg': dto.totalVolumeKg,
          };
        }).toList();

        await _supabase
            .from(AppConstants.supabase.tableWorkoutSessionExercises)
            .insert(exercisesData);
      }

      // Upsert user_workout_weeks for week streak
      await _upsertUserWorkoutWeek(
        userId: userId,
        completedAt: session.completedAt.toUtc(),
      );

      // Save/update personal records from completed exercises
      await _trySavePersonalRecordsFromSession(session);

      return true;
    } catch (e) {
      Log.e('Error saving workout session: $e');
      return false;
    }
  }

  /// Upsert user_workout_weeks when a workout is completed
  Future<void> _upsertUserWorkoutWeek({
    required String userId,
    required DateTime completedAt,
  }) async {
    try {
      final weekStart = AppDateUtils.getWeekStartDate(completedAt);
      final weekStartStr = AppDateUtils.ddmmyyyy(weekStart);

      final existing = await _supabase
          .from(AppConstants.supabase.tableUserWorkoutWeeks)
          .select('workout_count')
          .eq('user_id', userId)
          .eq('week_start_date', weekStartStr)
          .maybeSingle();

      if (existing != null) {
        final count = (existing['workout_count'] as int?) ?? 0;
        await _supabase
            .from(AppConstants.supabase.tableUserWorkoutWeeks)
            .update({'workout_count': count + 1})
            .eq('user_id', userId)
            .eq('week_start_date', weekStartStr);
      } else {
        await _supabase
            .from(AppConstants.supabase.tableUserWorkoutWeeks)
            .insert({
              'user_id': userId,
              'week_start_date': weekStartStr,
              'workout_count': 1,
            });
      }
    } catch (e) {
      Log.e('Error upserting user_workout_week: $e');
    }
  }

  /// Builds potential PRs from session exercises and saves only when new value
  /// is greater than existing (via saveExercisePersonalRecord).
  Future<void> _trySavePersonalRecordsFromSession(
    WorkoutSession session,
  ) async {
    final prDate = session.completedAt;
    for (final exercise in session.exercises) {
      final record = ExercisePersonalRecordExt.fromSessionExercise(
        exercise: exercise,
        prDate: prDate,
      );
      await _saveExercisePersonalRecord(record);
    }
  }

  /// Get workout sessions for a date range
  Future<List<WorkoutSession>> getWorkoutSessions({
    DateTime? from,
    DateTime? to,
    int? limit,
    int? offset,
  }) async {
    try {
      final userId = _currentUserId;
      if (userId == null) return [];

      var query = _supabase
          .from(AppConstants.supabase.tableWorkoutSessions)
          .select()
          .eq('user_id', userId)
          .gte('completed_at', from?.toUtc().toIso8601String() ?? '')
          .lte('completed_at', to?.toUtc().toIso8601String() ?? '')
          .order('completed_at', ascending: false);

      if (limit != null && offset != null) {
        query = query.range(offset, offset + limit - 1);
      } else if (limit != null) {
        query = query.limit(limit);
      }

      final sessionsResponse = await query as List;

      if (sessionsResponse.isEmpty) return [];

      final sessionIds = sessionsResponse
          .map((s) => (s as Map<String, dynamic>)['id'] as String)
          .toList();

      final exercisesResponse =
          await _supabase
                  .from(AppConstants.supabase.tableWorkoutSessionExercises)
                  .select()
                  .inFilter('workout_session_id', sessionIds)
                  .order('exercise_order', ascending: true)
              as List;

      final exercisesBySession = <String, List<WorkoutSessionExerciseDto>>{};
      for (final ex in exercisesResponse) {
        final exMap = ex as Map<String, dynamic>;
        final sessionId = exMap['workout_session_id'] as String;
        exercisesBySession
            .putIfAbsent(sessionId, () => [])
            .add(_parseWorkoutSessionExercise(exMap));
      }

      return sessionsResponse.map((s) {
        final sessionMap = s as Map<String, dynamic>;
        final id = sessionMap['id'] as String;
        final exerciseDtos = exercisesBySession[id] ?? [];
        return _parseWorkoutSession(sessionMap, exerciseDtos).toEntity();
      }).toList();
    } catch (e) {
      Log.e('Error fetching workout sessions: $e');
      return [];
    }
  }

  /// Get week streak for the current user
  Future<int> getWeekStreak() async {
    try {
      final userId = _currentUserId;
      if (userId == null) return 0;

      final response = await _supabase.rpc(
        'get_week_streak',
        params: {'p_user_id': userId},
      );

      return (response as int?) ?? 0;
    } catch (e) {
      Log.e('Error fetching week streak: $e');
      return 0;
    }
  }

  /// Save or update exercise personal record only when new value is greater
  /// than existing (by set_type: weight/reps/duration/distance).
  Future<bool> _saveExercisePersonalRecord(
    ExercisePersonalRecord record,
  ) async {
    try {
      final userId = _currentUserId;
      if (userId == null) return false;

      final newRecord = record.copyWith(userId: userId);

      final existing = await _supabase
          .from(AppConstants.supabase.tableExercisePersonalRecords)
          .select()
          .eq('user_id', userId)
          .eq('exercise_id', newRecord.exerciseId)
          .maybeSingle();

      if (existing != null) {
        final existingRecord = ExercisePersonalRecordDto.fromJson(
          existing,
        ).toEntity();
        final isNewBetter = existingRecord.isNewRecordBetter(newRecord);
        if (!isNewBetter) return true; // no update needed
      }

      final dto = ExercisePersonalRecordDto.fromEntity(newRecord);
      await _supabase
          .from(AppConstants.supabase.tableExercisePersonalRecords)
          .upsert({
            'user_id': dto.userId,
            'exercise_id': dto.exerciseId,
            'name': dto.name,
            'gif_url': dto.gifUrl,
            'max_reps': dto.maxReps,
            'max_weight_kg': dto.maxWeightKg,
            'max_duration_seconds': dto.maxDurationSeconds,
            'max_distance_meters': dto.maxDistanceMeters,
            'set_type': dto.setType,
            'pr_date': dto.prDate,
            'is_visible_on_history': dto.isVisibleOnHistory,
          }, onConflict: 'user_id,exercise_id');

      return true;
    } catch (e) {
      Log.e('Error saving exercise personal record: $e');
      return false;
    }
  }

  /// Get all exercise personal records for the current user
  Future<List<ExercisePersonalRecord>> getExercisePersonalRecords({
    bool? isVisibleOnHistory,
  }) async {
    try {
      final userId = _currentUserId;
      if (userId == null) return [];

      var query = _supabase
          .from(AppConstants.supabase.tableExercisePersonalRecords)
          .select()
          .eq('user_id', userId);

      if (isVisibleOnHistory != null) {
        query = query.eq('is_visible_on_history', isVisibleOnHistory);
      }

      final response = await query.order('pr_date', ascending: false);

      final list = response as List;
      return list
          .map(
            (e) =>
                ExercisePersonalRecordDto.fromJson(e as Map<String, dynamic>),
          )
          .map((dto) => dto.toEntity())
          .toList();
    } catch (e) {
      Log.e('Error fetching exercise personal records: $e');
      return [];
    }
  }

  WorkoutSessionDto _parseWorkoutSession(
    Map<String, dynamic> json,
    List<WorkoutSessionExerciseDto> exercises,
  ) {
    return WorkoutSessionDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      workoutId: json['workout_id'] as String?,
      workoutName: json['workout_name'] as String,
      startedAt: json['started_at'] as String,
      completedAt: json['completed_at'] as String,
      totalDurationSeconds: (json['total_duration_seconds'] as int?) ?? 0,
      totalVolumeKg: (json['total_volume_kg'] as num?)?.toDouble() ?? 0,
      totalSets: (json['total_sets'] as int?) ?? 0,
      totalExercises: (json['total_exercises'] as int?) ?? 0,
      caloriesBurned: (json['calories_burned'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      exercises: exercises,
    );
  }

  WorkoutSessionExerciseDto _parseWorkoutSessionExercise(
    Map<String, dynamic> json,
  ) {
    final setsJson = json['sets'] as List<dynamic>? ?? [];
    final sets = setsJson
        .map((s) => WorkingSetDto.fromJson(s as Map<String, dynamic>))
        .toList();

    return WorkoutSessionExerciseDto(
      id: json['id'] as String,
      workoutSessionId: json['workout_session_id'] as String,
      exerciseOrder: json['exercise_order'] as int? ?? 0,
      exerciseId: json['exercise_id'] as String,
      name: json['name'] as String,
      gifUrl: json['gif_url'] as String? ?? '',
      setType: json['set_type'] as String? ?? 'weightBased',
      sets: sets,
      restTimeBetweenSets: (json['rest_time_between_sets'] as int?) ?? 0,
      totalVolumeKg: (json['total_volume_kg'] as num?)?.toDouble() ?? 0,
    );
  }
}
