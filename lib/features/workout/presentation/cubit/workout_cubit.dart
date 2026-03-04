import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';
import 'package:workouch/features/workout/presentation/cubit/workout_state.dart';
import 'package:workouch/features/workout_session/domain/entities/exercise_personal_record.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/error.dart';
import '../../../auth/domain/entities/user.dart';
import '../../data/models/requests/exercise_filter_request.dart';
import '../../data/models/requests/paging_request.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/exercise_filter.dart';
import '../../domain/entities/user_subscription.dart';
import '../../domain/entities/workout.dart';
import '../../domain/enums/main_lift.dart';
import '../../domain/enums/workout_goal.dart';
import '../../domain/enums/workout_intensity.dart';
import '../../domain/repositories/ai_workout_repo.dart';
import '../../domain/repositories/exercise_repo.dart';
import '../../domain/repositories/workout_repo.dart';

@injectable
class WorkoutCubit extends Cubit<WorkoutState> {
  final ExerciseRepo _exerciseRepo;
  final WorkoutRepo _workoutRepo;
  final AIWorkoutRepo _aiWorkoutRepo;

  WorkoutCubit(this._exerciseRepo, this._workoutRepo, this._aiWorkoutRepo)
    : super(const WorkoutState()) {
    getBodyParts();
    getEquipments();
    getMainLiftPersonalRecords();
  }

  Future<void> saveWorkout(Workout workout) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        saveWorkoutStatus: WorkoutStateStatus.loading,
        saveWorkoutError: null,
      ),
    );
    final res = await _workoutRepo.saveWorkout(workout);
    res.fold(
      (error) => emit(
        state.copyWith(
          saveWorkoutStatus: WorkoutStateStatus.error,
          saveWorkoutError: error,
        ),
      ),
      (success) => emit(
        state.copyWith(
          saveWorkoutStatus: WorkoutStateStatus.success,
          saveWorkoutError: null,
        ),
      ),
    );
  }

  Future<void> getAllWorkouts() async {
    if (isClosed) return;
    emit(
      state.copyWith(
        getWorkoutsStatus: WorkoutStateStatus.loading,
        getWorkoutsError: null,
      ),
    );
    final res = await _workoutRepo.getAllWorkouts();
    res.fold(
      (error) => emit(
        state.copyWith(
          getWorkoutsStatus: WorkoutStateStatus.error,
          getWorkoutsError: error,
        ),
      ),
      (workouts) => emit(
        state.copyWith(
          getWorkoutsStatus: WorkoutStateStatus.success,
          workouts: workouts,
          getWorkoutsError: null,
        ),
      ),
    );
  }

  Future<void> deleteWorkout(String workoutId) async {
    if (isClosed) return;
    emit(
      state.copyWith(
        deleteWorkoutStatus: WorkoutStateStatus.loading,
        deleteWorkoutError: null,
      ),
    );
    final res = await _workoutRepo.deleteWorkout(workoutId);
    res.fold(
      (error) => emit(
        state.copyWith(
          deleteWorkoutStatus: WorkoutStateStatus.error,
          deleteWorkoutError: error,
        ),
      ),
      (success) {
        emit(
          state.copyWith(
            deleteWorkoutStatus: WorkoutStateStatus.success,
            deleteWorkoutError: null,
          ),
        );
      },
    );
  }

  /// Load exercises with pagination support
  /// [loadMore] - true to load next page, false to load from beginning
  Future<void> getExercises({bool loadMore = false}) async {
    if (isClosed) return;
    if (loadMore) {
      if (!state.hasMore ||
          state.getExercisesStatus == WorkoutStateStatus.loadingMore ||
          state.getExercisesStatus == WorkoutStateStatus.loading) {
        return;
      }
    }

    // Set loading status
    if (loadMore) {
      emit(
        state.copyWith(
          getExercisesStatus: WorkoutStateStatus.loadingMore,
          getExercisesError: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          getExercisesStatus: WorkoutStateStatus.loading,
          currentOffset: 0,
          exercises: [],
          getExercisesError: null,
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
      (error) => emit(
        state.copyWith(
          getExercisesStatus: WorkoutStateStatus.error,
          getExercisesError: error,
        ),
      ),
      (exercises) {
        if (loadMore) {
          // Load more exercises
          final updatedExercises = [...state.exercises, ...exercises];
          emit(
            state.copyWith(
              getExercisesStatus: WorkoutStateStatus.success,
              getExercisesError: null,
              exercises: updatedExercises,
              currentOffset: updatedExercises.length,
              hasMore: exercises.length >= state.limit,
            ),
          );
        } else {
          // Refresh exercises
          emit(
            state.copyWith(
              getExercisesStatus: WorkoutStateStatus.success,
              getExercisesError: null,
              exercises: exercises,
              currentOffset: exercises.length,
              hasMore: exercises.length >= state.limit,
            ),
          );
        }
      },
    );
  }

  /// Load body parts
  Future<void> getBodyParts() async {
    if (isClosed) return;
    final res = await _exerciseRepo.getBodyParts();
    res.fold(
      (error) => emit(state.copyWith(bodyParts: [])),
      (bodyParts) => emit(state.copyWith(bodyParts: bodyParts)),
    );
  }

  /// Load equipments
  Future<void> getEquipments() async {
    if (isClosed) return;
    final res = await _exerciseRepo.getEquipments();
    res.fold(
      (error) => emit(state.copyWith(equipments: [])),
      (equipments) => emit(state.copyWith(equipments: equipments)),
    );
  }

  /// Select exercise
  void selectExercise(WorkingExercise workingExercise) {
    final currentSelected = List<WorkingExercise>.from(
      state.selectedWorkout.exercises,
    );

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

    updateSelectedWorkout(exercises: currentSelected);
  }

  /// Remove exercise from selection
  void removeExercise(String exerciseId) {
    final currentSelected = List<WorkingExercise>.from(
      state.selectedWorkout.exercises,
    );
    currentSelected.removeWhere((e) => e.exerciseId == exerciseId);
    updateSelectedWorkout(exercises: currentSelected);
  }

  /// Reorder exercise in selection
  void reorderExercise(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final oldList = state.selectedWorkout.exercises;
    final selectedItem = oldList[oldIndex];
    final newList = [
      ...oldList.sublist(0, oldIndex),
      ...oldList.sublist(oldIndex + 1, oldList.length),
    ];
    newList.insert(newIndex, selectedItem);

    updateSelectedWorkout(exercises: newList);
  }

  void updateSelectedWorkout({
    String? id,
    String? name,
    List<WorkingExercise>? exercises,
    Duration? restTime,
  }) {
    emit(
      state.copyWith(
        selectedWorkout: state.selectedWorkout.copyWith(
          id: id ?? state.selectedWorkout.id,
          name: name ?? state.selectedWorkout.name,
          exercises: exercises ?? state.selectedWorkout.exercises,
          restTimeBetweenExercises:
              restTime ?? state.selectedWorkout.restTimeBetweenExercises,
        ),
      ),
    );
  }

  void updateDisplayedWorkout(Workout workout) {
    emit(state.copyWith(displayedWorkout: workout));
  }

  /// Update filter
  void updateFilter(ExerciseFilter filter) {
    emit(state.copyWith(filter: filter));
  }

  /// Update search
  void updateSearch(String search) {
    emit(state.copyWith(search: search));
  }

  /// Reset state
  void reset() {
    emit(
      state.copyWith(
        getExercisesStatus: WorkoutStateStatus.initial,
        getExercisesError: null,
        filter: const ExerciseFilter(),
        search: '',
      ),
    );
  }

  WorkingExercise? findSelectedExercise(Exercise exercise) {
    final matches = state.selectedWorkout.exercises.where(
      (e) => e.exerciseId == exercise.exerciseId,
    );
    return matches.isEmpty ? null : matches.first;
  }

  Future<void> generateShuffleModeWorkout({
    required String userPreferences,
    User? user,
    UserSubscription? userSub,
  }) async {
    final canProceed = await _validateAndPrepareForGeneration(userSub);
    if (!canProceed) return;

    final res = await _aiWorkoutRepo.generateShuffleModeWorkout(
      preferences: userPreferences,
      user: user,
    );

    res.fold(
      (error) => emit(
        state.copyWith(
          generateAIWorkoutStatus: WorkoutStateStatus.error,
          generateAIWorkoutError: error,
        ),
      ),
      (workout) => _handleSuccessWorkoutGen(workout),
    );
  }

  Future<void> generateNeatModeWorkout({
    String? workoutName,
    Duration? duration,
    WorkoutIntensity? intensity,
    List<WorkoutGoal>? goals,
    List<String>? bodyParts,
    List<String>? equipments,
    String? location,
    String? injuries,
    User? user,
    UserSubscription? userSub,
  }) async {
    final canProceed = await _validateAndPrepareForGeneration(userSub);
    if (!canProceed) return;

    final res = await _aiWorkoutRepo.generateNeatModeWorkout(
      workoutName: workoutName,
      duration: duration,
      intensity: intensity,
      goals: goals,
      bodyParts: bodyParts,
      equipments: equipments,
      location: location,
      injuries: injuries,
      user: user,
    );

    res.fold(
      (error) => emit(
        state.copyWith(
          generateAIWorkoutStatus: WorkoutStateStatus.error,
          generateAIWorkoutError: error,
        ),
      ),
      (workout) => _handleSuccessWorkoutGen(workout),
    );
  }

  /// Common logic for workout generation: validates subscription, checks limits, and handles generation
  Future<bool> _validateAndPrepareForGeneration(
    UserSubscription? userSub,
  ) async {
    if (isClosed) return false;

    // Step 1: Check if user subscription is available
    if (userSub == null) {
      emit(
        state.copyWith(
          generateAIWorkoutStatus: WorkoutStateStatus.error,
          generateAIWorkoutError: Error(
            message: AppConstants.workoutGenerationError,
            errorType: ErrorType.other,
          ),
        ),
      );
      return false;
    }

    // Step 2: Reset subscription period if needed
    await _checkAndResetSubPeriod(userSub);

    // Step 3: Set loading status before starting workout generation
    emit(
      state.copyWith(
        generateAIWorkoutStatus: WorkoutStateStatus.loading,
        generateAIWorkoutError: null,
      ),
    );

    return true;
  }

  /// Compare current date with subscription period end and reset if needed
  Future<void> _checkAndResetSubPeriod(UserSubscription userSub) async {
    final now = DateTime.now();
    if (now.isAfter(userSub.periodEnd)) {
      await _workoutRepo.resetSubscriptionPeriod();
    }
  }

  Future<void> _handleSuccessWorkoutGen(Workout workout) async {
    // Increment workout generation used
    await _workoutRepo.incrementWorkoutGenUsed();

    emit(
      state.copyWith(
        generateAIWorkoutStatus: WorkoutStateStatus.success,
        generateAIWorkoutError: null,
        aiGeneratedWorkout: workout,
      ),
    );
  }

  Future<void> getMainLiftPersonalRecords() async {
    if (isClosed) return;

    final exerciseIds = MainLift.values.map((e) => e.exerciseId).toList();
    final res = await _workoutRepo.getMainLiftPersonalRecords(exerciseIds);

    res.fold(
      (_) {
        emit(state.copyWith(mainLiftPersonalRecords: {}));
      },
      (records) {
        final maps = <MainLift, ExercisePersonalRecord>{};
        for (final record in records) {
          final lift = MainLift.values.firstWhere(
            (l) => l.exerciseId == record.exerciseId,
          );
          maps[lift] = record;
        }
        emit(state.copyWith(mainLiftPersonalRecords: maps));
      },
    );
  }

  /// Upsert main lift personal records (pass in a map of lift and weight in kg)
  Future<void> upsertMainLiftPersonalRecords({
    required Map<MainLift, double> newRecords,
  }) async {
    if (isClosed) return;

    emit(
      state.copyWith(
        upsertMainLiftPersonalRecordStatus: WorkoutStateStatus.loading,
        upsertMainLiftPersonalRecordError: null,
      ),
    );

    final records = newRecords.entries
        .map(
          (entry) => entry.key.toExercisePersonalRecord(
            prDate: DateTime.now(), // Current date
            maxReps: 1, // Always 1 rep-max
            maxWeightKg: entry.value,
            isVisibleOnHistory: true, // Always visible on History tab
          ),
        )
        .toList();

    final res = await _workoutRepo.upsertMainLiftPersonalRecords(records);

    res.fold(
      (error) => emit(
        state.copyWith(
          upsertMainLiftPersonalRecordStatus: WorkoutStateStatus.error,
          upsertMainLiftPersonalRecordError: error,
        ),
      ),
      (success) => emit(
        state.copyWith(
          upsertMainLiftPersonalRecordStatus: success
              ? WorkoutStateStatus.success
              : WorkoutStateStatus.error,
          upsertMainLiftPersonalRecordError: null,
        ),
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
