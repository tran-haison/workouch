import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';
import 'package:workouch/features/workout/presentation/cubit/workout_state.dart';

import '../../data/models/requests/exercise_filter_request.dart';
import '../../data/models/requests/paging_request.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/exercise_filter.dart';
import '../../domain/repositories/exercise_repo.dart';

@injectable
class WorkoutCubit extends Cubit<WorkoutState> {
  final ExerciseRepo _exerciseRepo;

  WorkoutCubit(this._exerciseRepo) : super(const WorkoutState());

  /// Load exercises with pagination support
  /// [loadMore] - true to load next page, false to load from beginning
  Future<void> getExercises({bool loadMore = false}) async {
    if (loadMore) {
      if (!state.hasMore ||
          state.status == WorkoutStateStatus.loadingMore ||
          state.status == WorkoutStateStatus.loading) {
        return;
      }
    }

    // Set loading status
    if (loadMore) {
      emit(state.copyWith(status: WorkoutStateStatus.loadingMore, error: null));
    } else {
      emit(
        state.copyWith(
          status: WorkoutStateStatus.loading,
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
          emit(state.copyWith(status: WorkoutStateStatus.error, error: error)),
      (exercises) {
        if (loadMore) {
          // Load more exercises
          final updatedExercises = [...state.exercises, ...exercises];
          emit(
            state.copyWith(
              status: WorkoutStateStatus.success,
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
              status: WorkoutStateStatus.success,
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

  /// Select exercise
  void selectExercise(WorkingExercise workingExercise) {
    final currentSelected = List<WorkingExercise>.from(state.selectedExercises);

    // Find the index of the exercise if it already exists
    final existingIndex = currentSelected.indexWhere(
      (e) => e.exerciseId == workingExercise.exerciseId,
    );

    if (existingIndex != -1) {
      // If exercise exists, replace it at the same position
      currentSelected[existingIndex] = workingExercise;
    } else {
      // If exercise doesn't exist, add it to the list
      currentSelected.add(workingExercise);
    }

    emit(state.copyWith(selectedExercises: currentSelected));
  }

  /// Remove exercise from selection
  void removeExercise(String exerciseId) {
    final currentSelected = List<WorkingExercise>.from(state.selectedExercises);
    currentSelected.removeWhere((e) => e.exerciseId == exerciseId);
    emit(state.copyWith(selectedExercises: currentSelected));
  }

  /// Reorder exercise in selection
  void reorderExercise(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final oldList = state.selectedExercises;
    final selectedItem = oldList[oldIndex];
    final newList = [
      ...oldList.sublist(0, oldIndex),
      ...oldList.sublist(oldIndex + 1, oldList.length),
    ];
    newList.insert(newIndex, selectedItem);

    emit(state.copyWith(selectedExercises: newList));
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
        status: WorkoutStateStatus.initial,
        selectedExercises: [],
        filter: const ExerciseFilter(),
        search: '',
        error: null,
      ),
    );
  }

  WorkingExercise? findSelectedExercise(Exercise exercise) {
    final matches = state.selectedExercises.where(
      (e) => e.exerciseId == exercise.exerciseId,
    );
    return matches.isEmpty ? null : matches.first;
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
