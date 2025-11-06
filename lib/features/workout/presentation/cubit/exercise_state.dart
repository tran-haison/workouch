import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/error.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/exercise_filter.dart';

part 'exercise_state.freezed.dart';

enum ExerciseStateStatus { initial, loading, loadingMore, success, error }

@freezed
class ExerciseState with _$ExerciseState {
  const factory ExerciseState({
    @Default(ExerciseStateStatus.initial) ExerciseStateStatus status,
    @Default([]) List<Exercise> exercises,
    @Default([]) List<Exercise> selectedExercises,
    @Default([]) List<String> bodyParts,
    @Default([]) List<String> equipments,
    @Default(ExerciseFilter()) ExerciseFilter filter,
    @Default('') String search,
    @Default(0) int currentOffset,
    @Default(20) int limit,
    @Default(true) bool hasMore,
    Error? error,
  }) = _ExerciseState;
}
