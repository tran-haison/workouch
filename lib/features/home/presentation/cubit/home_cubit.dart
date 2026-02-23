import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/date_utils.dart';
import '../../../workout_session/domain/entities/exercise_personal_record.dart';
import '../../../workout_session/domain/entities/workout_session.dart';
import '../../../workout_session/domain/repositories/workout_session_repo.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._workoutSessionRepo) : super(const HomeState());

  final WorkoutSessionRepo _workoutSessionRepo;

  /// Max number of months to keep in cache (viewing month ± 2).
  static const int _sessionsCacheWindow = 5;

  Future<void> getWeekStreak() async {
    final res = await _workoutSessionRepo.getWeekStreak();
    res.fold(
      (error) => throw error,
      (streak) => emit(state.copyWith(weekStreak: streak)),
    );
  }

  /// Get history summary stats for the current month.
  /// Always fetches sessions for this month from the API.
  Future<void> getThisMonthHistoryStats() async {
    if (isClosed) return;

    final curr = DateTime.now();
    final currMonthFirst = AppDateUtils.firstDateOfMonth(curr);
    final currMonthLast = AppDateUtils.lastDateOfMonth(curr);

    final prev = DateTime(curr.year, curr.month - 1, curr.day);
    final prevMonthFirst = AppDateUtils.firstDateOfMonth(prev);
    final prevMonthLast = AppDateUtils.lastDateOfMonth(prev);

    final currRes = await _workoutSessionRepo.getWorkoutSessions(
      from: currMonthFirst,
      to: currMonthLast,
    );

    final prevRes = await _workoutSessionRepo.getWorkoutSessions(
      from: prevMonthFirst,
      to: prevMonthLast,
    );

    if (currRes.isRight) {
      emit(state.copyWith(thisMonthHistoryStats: currRes.right.historyStats));
    }

    if (prevRes.isRight) {
      emit(state.copyWith(lastMonthHistoryStats: prevRes.right.historyStats));
    }
  }

  /// Load sessions for [date] (and 2 months before and after). Uses cache
  /// fetches only missing months
  Future<void> loadSessionsForMonth(DateTime date) async {
    if (isClosed) return;

    final monthFirstDate = AppDateUtils.firstDateOfMonth(date);
    final monthLastDate = AppDateUtils.lastDateOfMonth(date);
    final keyByMonth = AppDateUtils.yyyyMM(monthFirstDate); // "yyyy-MM"

    final cache = Map<String, List<WorkoutSession>>.from(state.sessionsByMonth);

    if (cache.containsKey(keyByMonth)) {
      emit(state.copyWith(viewingMonth: monthFirstDate));
      _prefetchAdjacentMonths(monthFirstDate);
      return;
    }

    final res = await _workoutSessionRepo.getWorkoutSessions(
      from: monthFirstDate,
      to: monthLastDate,
    );

    res.fold(
      (_) {
        // No need to do anything here
      },
      (list) {
        cache[keyByMonth] = list;
        _evictSessionsCache(cache, monthFirstDate);
        emit(
          state.copyWith(sessionsByMonth: cache, viewingMonth: monthFirstDate),
        );
        _prefetchAdjacentMonths(monthFirstDate);
      },
    );
  }

  void _prefetchAdjacentMonths(DateTime viewingMonth) {
    final cache = state.sessionsByMonth;
    for (int offset = -2; offset <= 2; offset++) {
      if (offset == 0) continue;
      final month = DateTime(viewingMonth.year, viewingMonth.month + offset, 1);
      final key = AppDateUtils.yyyyMM(month);
      if (cache.containsKey(key)) continue;
      _fetchMonthIntoCache(month);
    }
  }

  Future<void> _fetchMonthIntoCache(DateTime month) async {
    final key = AppDateUtils.yyyyMM(month);
    final res = await _workoutSessionRepo.getWorkoutSessions(
      from: AppDateUtils.firstDateOfMonth(month),
      to: AppDateUtils.lastDateOfMonth(month),
    );
    res.fold((_) {}, (list) {
      final newCache = Map<String, List<WorkoutSession>>.from(
        state.sessionsByMonth,
      );
      newCache[key] = list;
      _evictSessionsCache(newCache, state.viewingMonth ?? month);
      emit(state.copyWith(sessionsByMonth: newCache));
    });
  }

  void _evictSessionsCache(
    Map<String, List<WorkoutSession>> cache,
    DateTime viewingMonth,
  ) {
    if (cache.length <= _sessionsCacheWindow) return;
    final keepKeys = <String>{};
    for (int offset = -2; offset <= 2; offset++) {
      final m = DateTime(viewingMonth.year, viewingMonth.month + offset, 1);
      keepKeys.add(AppDateUtils.yyyyMM(m));
    }
    cache.removeWhere((key, _) => !keepKeys.contains(key));
  }

  Future<void> getAllPersonalRecords({String? searchByName}) async {
    emit(state.copyWith(status: HomeStateStatus.loading, error: null));

    final res = await _workoutSessionRepo.getExercisePersonalRecords(
      searchByName: searchByName,
    );

    res.fold(
      (error) =>
          emit(state.copyWith(status: HomeStateStatus.error, error: error)),
      (records) => emit(
        state.copyWith(
          status: HomeStateStatus.success,
          personalRecords: records,
          error: null,
        ),
      ),
    );
  }

  Future<void> getSelectedPersonalRecords() async {
    final res = await _workoutSessionRepo.getExercisePersonalRecords(
      isVisibleOnHistory: true,
    );
    res.fold(
      (error) => throw error,
      (records) => emit(state.copyWith(selectedPersonalRecords: records)),
    );
  }

  Future<void> togglePersonalRecordSelection(
    ExercisePersonalRecord personalRecord,
  ) async {
    if (isClosed) return;
    final currentSelected = state.selectedPersonalRecords;
    final isSelected = currentSelected.any(
      (e) => e.exerciseId == personalRecord.exerciseId,
    );
    final newSelected = isSelected
        ? currentSelected
              .where((e) => e.exerciseId != personalRecord.exerciseId)
              .toList()
        : [...currentSelected, personalRecord];

    emit(state.copyWith(selectedPersonalRecords: newSelected));

    final res = await _workoutSessionRepo.saveExercisePersonalRecord(
      personalRecord.copyWith(isVisibleOnHistory: !isSelected),
    );

    // Fallback to previous state if save fails
    if (res.isLeft || (res.isRight && res.right == false)) {
      emit(state.copyWith(selectedPersonalRecords: currentSelected));
    }
  }
}
