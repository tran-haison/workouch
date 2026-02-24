import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/error.dart';
import '../../data/services/supabase_workout_session_service.dart';
import '../entities/exercise_personal_record.dart';
import '../entities/workout_session.dart';

abstract class WorkoutSessionRepo {
  Future<Either<Error, bool>> saveWorkoutSession(WorkoutSession session);
  Future<Either<Error, bool>> toggleExercisePersonalRecordVisibility({
    required String exerciseId,
    required bool isVisibleOnHistory,
  });
  Future<Either<Error, List<WorkoutSession>>> getWorkoutSessions({
    DateTime? from,
    DateTime? to,
    int? limit,
    int? offset,
  });
  Future<Either<Error, int>> getWeekStreak();
  Future<Either<Error, List<ExercisePersonalRecord>>>
  getExercisePersonalRecords({bool? isVisibleOnHistory, String? searchByName});
}

@LazySingleton(as: WorkoutSessionRepo)
class WorkoutSessionRepoImpl implements WorkoutSessionRepo {
  final SupabaseWorkoutSessionService _workoutSessionService;

  WorkoutSessionRepoImpl(this._workoutSessionService);

  @override
  Future<Either<Error, bool>> saveWorkoutSession(WorkoutSession session) async {
    try {
      final success = await _workoutSessionService.saveWorkoutSession(session);
      if (success) {
        return const Right(true);
      }
      return Left(
        Error(
          message: AppConstants.workoutSessionSavedError,
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, bool>> toggleExercisePersonalRecordVisibility({
    required String exerciseId,
    required bool isVisibleOnHistory,
  }) async {
    try {
      final success = await _workoutSessionService
          .toggleExercisePersonalRecordVisibility(
            exerciseId: exerciseId,
            isVisibleOnHistory: isVisibleOnHistory,
          );
      if (success) {
        return const Right(true);
      }
      return Left(
        Error(
          message: AppConstants.exercisePersonalRecordSavedError,
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, List<WorkoutSession>>> getWorkoutSessions({
    DateTime? from,
    DateTime? to,
    int? limit,
    int? offset,
  }) async {
    try {
      final sessions = await _workoutSessionService.getWorkoutSessions(
        from: from,
        to: to,
        limit: limit,
        offset: offset,
      );
      return Right(sessions);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, int>> getWeekStreak() async {
    try {
      final streak = await _workoutSessionService.getWeekStreak();
      return Right(streak);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, List<ExercisePersonalRecord>>>
  getExercisePersonalRecords({
    bool? isVisibleOnHistory,
    String? searchByName,
  }) async {
    try {
      final records = await _workoutSessionService.getExercisePersonalRecords(
        isVisibleOnHistory: isVisibleOnHistory,
        searchByName: searchByName,
      );
      return Right(records);
    } catch (e) {
      return Left(handleException(e));
    }
  }
}
