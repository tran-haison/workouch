import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:workouch/features/workout/presentation/cubit/exercise_state.dart';

import '../../data/models/requests/exercise_filter_request.dart';
import '../../data/models/requests/paging_request.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/exercise_filter.dart';
import '../../domain/repositories/exercise_repo.dart';

@injectable
class ExerciseCubit extends Cubit<ExerciseState> {
  final ExerciseRepo _exerciseRepo;

  ExerciseCubit(this._exerciseRepo) : super(const ExerciseState());

  /// Load exercises with pagination support
  /// [loadMore] - true to load next page, false to load from beginning
  Future<void> getExercises({bool loadMore = false}) async {
    if (loadMore) {
      if (!state.hasMore ||
          state.status == ExerciseStateStatus.loadingMore ||
          state.status == ExerciseStateStatus.loading) {
        return;
      }
    }

    // Set loading status
    if (loadMore) {
      emit(
        state.copyWith(status: ExerciseStateStatus.loadingMore, error: null),
      );
    } else {
      emit(
        state.copyWith(
          status: ExerciseStateStatus.loading,
          currentOffset: 0,
          exercises: [],
          error: null,
        ),
      );
    }

    final pagingRequest = PagingRequest(
      limit: state.limit,
      offset: state.currentOffset,
    );
    final filterRequest = _convertFilterToRequest();

    final res = await _exerciseRepo.getExercises(
      paging: pagingRequest,
      filter: filterRequest,
    );

    res.fold(
      (error) =>
          emit(state.copyWith(status: ExerciseStateStatus.error, error: error)),
      (exercises) {
        if (loadMore) {
          // Load more exercises
          final updatedExercises = [...state.exercises, ...exercises];
          emit(
            state.copyWith(
              status: ExerciseStateStatus.success,
              exercises: updatedExercises,
              currentOffset: updatedExercises.length,
              hasMore: exercises.length >= state.limit,
              error: null,
            ),
          );
        } else {
          // Refresh exercises
          emit(
            state.copyWith(
              status: ExerciseStateStatus.success,
              exercises: exercises,
              currentOffset: exercises.length,
              hasMore: exercises.length >= state.limit,
              error: null,
            ),
          );
        }
      },
    );
  }

  /// Load body parts
  Future<void> getBodyParts() async {
    final res = await _exerciseRepo.getBodyParts();
    res.fold(
      (error) => emit(state.copyWith(error: error)),
      (bodyParts) => emit(state.copyWith(bodyParts: bodyParts, error: null)),
    );
  }

  /// Load equipments
  Future<void> getEquipments() async {
    final res = await _exerciseRepo.getEquipments();
    res.fold(
      (error) => emit(state.copyWith(error: error)),
      (equipments) => emit(state.copyWith(equipments: equipments, error: null)),
    );
  }

  /// Toggle exercise selection
  void toggleExerciseSelection(Exercise exercise) {
    final currentSelected = List<Exercise>.from(state.selectedExercises);
    final isSelected = currentSelected.any(
      (e) => e.exerciseId == exercise.exerciseId,
    );

    if (isSelected) {
      currentSelected.removeWhere((e) => e.exerciseId == exercise.exerciseId);
    } else {
      currentSelected.add(exercise);
    }

    emit(state.copyWith(selectedExercises: currentSelected));
  }

  /// Update filter
  void updateFilter(ExerciseFilter filter) {
    emit(state.copyWith(filter: filter));
  }

  /// Update search
  void updateSearch(String search) {
    emit(state.copyWith(search: search));
  }

  /// Clear all selections and filters
  void clearAll() {
    emit(
      state.copyWith(
        status: ExerciseStateStatus.initial,
        selectedExercises: [],
        filter: const ExerciseFilter(),
        search: '',
        error: null,
      ),
    );
  }

  ExerciseFilterRequest? _convertFilterToRequest() {
    final filter = state.filter;
    final search = state.search.trim();

    if (!filter.hasAnyFilter && search.isEmpty) {
      return null;
    }

    return ExerciseFilterRequest(
      search: search,
      bodyParts: filter.muscle,
      equipments: filter.equipment,
    );
  }
}
