import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/error.dart';
import '../../domain/entities/history_stats.dart';
import '../../../workout_session/domain/entities/exercise_personal_record.dart';
import '../../../workout_session/domain/entities/workout_session.dart';

part 'home_state.freezed.dart';

enum HomeStateStatus { initial, loading, loadingMore, success, error }

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStateStatus.initial) HomeStateStatus status,
    @Default(0) int weekStreak,
    @Default({}) Map<String, List<WorkoutSession>> sessionsByMonth,
    DateTime? viewingMonth, // Month currently being viewed
    @Default(HistoryStats()) HistoryStats thisMonthHistoryStats,
    @Default(HistoryStats()) HistoryStats lastMonthHistoryStats,
    @Default(<ExercisePersonalRecord>[])
    List<ExercisePersonalRecord> personalRecords,
    @Default(<ExercisePersonalRecord>[])
    List<ExercisePersonalRecord> selectedPersonalRecords,
    Error? error,
  }) = _HomeState;
}

extension HomeStateExt on HomeState {
  int get newPRsThisWeek =>
      personalRecords.where((e) => AppDateUtils.isThisWeek(e.prDate)).length;

  int get newPRsThisMonth =>
      personalRecords.where((e) => AppDateUtils.isThisMonth(e.prDate)).length;

  int get newPRsThisYear =>
      personalRecords.where((e) => AppDateUtils.isThisYear(e.prDate)).length;

  DateTime get currentViewingMonth => viewingMonth ?? DateTime.now();

  List<WorkoutSession> get sessionsForViewingMonth {
    if (viewingMonth == null) return [];
    return sessionsByMonth[AppDateUtils.yyyyMM(viewingMonth!)] ?? [];
  }

  List<WorkoutSession> sessionsForMonth(DateTime month) {
    return sessionsByMonth[AppDateUtils.yyyyMM(month)] ?? [];
  }
}
