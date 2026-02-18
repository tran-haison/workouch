import 'package:freezed_annotation/freezed_annotation.dart';
import 'exercise.dart';
import 'working_set.dart';

part 'working_exercise.freezed.dart';

@freezed
class WorkingExercise with _$WorkingExercise {
  const WorkingExercise._();

  const factory WorkingExercise({
    @Default('') String exerciseId,
    @Default('') String name,
    @Default('') String gifUrl,
    @Default('') String description,
    @Default([]) List<String> targetMuscles,
    @Default([]) List<String> bodyParts,
    @Default([]) List<String> equipments,
    @Default([]) List<String> secondaryMuscles,
    @Default([]) List<String> instructions,
    @Default([]) List<WorkingSet> sets,
    @Default(Duration.zero) Duration restTimeBetweenSets,
    @Default(0) int exerciseOrder,
    WorkingSetType? setType,
  }) = _WorkingExercise;

  factory WorkingExercise.fromExercise(Exercise exercise) {
    return WorkingExercise(
      exerciseId: exercise.exerciseId,
      name: exercise.name,
      gifUrl: exercise.gifUrl,
      description: exercise.description,
      targetMuscles: exercise.targetMuscles,
      bodyParts: exercise.bodyParts,
      equipments: exercise.equipments,
      secondaryMuscles: exercise.secondaryMuscles,
      instructions: exercise.instructions,
    );
  }
}

extension WorkingExerciseX on WorkingExercise {
  bool get hasValidSets {
    if (sets.isEmpty) {
      return false;
    }

    return sets.every((set) {
      return set.when(
        weightBased: (sets, reps, weight) {
          return sets > 0 && reps > 0 && weight > 0;
        },
        repsOnly: (sets, reps) {
          return sets > 0 && reps > 0;
        },
        timeBased: (duration) {
          return duration.inSeconds > 0;
        },
        distanceBased: (distance) {
          return distance > 0;
        },
      );
    });
  }

  String get displayMainInfo => '${bodyParts[0]} > ${equipments[0]}';

  List<String> get displaySetsInfo {
    if (sets.isEmpty) {
      return [];
    }

    // Format all sets
    final formattedSets = sets
        .map((set) => set.displayInfo)
        .where((info) => info != null)
        .cast<String>()
        .toList();

    return formattedSets;
  }

  // Convert working sets to separated sets
  // E.g: if a set has value of "3 sets, 5 reps, 5 kg"
  // then separated sets is a list of 3 items, each item has value of "1 set, 5 reps, 5 kg"
  List<WorkingSet> get separatedSets {
    final newSets = <WorkingSet>[];

    for (final workingSet in sets) {
      workingSet.when(
        weightBased: (sets, reps, weight) {
          // Create 'sets' number of individual sets, each with sets=1
          for (int i = 0; i < sets; i++) {
            newSets.add(
              WorkingSet.weightBased(sets: 1, reps: reps, weight: weight),
            );
          }
        },
        repsOnly: (sets, reps) {
          // Create 'sets' number of individual sets, each with sets=1
          for (int i = 0; i < sets; i++) {
            newSets.add(WorkingSet.repsOnly(sets: 1, reps: reps));
          }
        },
        timeBased: (duration) {
          // Time-based sets are single sets, just add one
          newSets.add(WorkingSet.timeBased(duration: duration));
        },
        distanceBased: (distance) {
          // Distance-based sets are single sets, just add one
          newSets.add(WorkingSet.distanceBased(distance: distance));
        },
      );
    }

    return newSets;
  }

  /// Get the set type from the first set if not explicitly set
  WorkingSetType? get effectiveSetType {
    if (setType != null) return setType;
    if (sets.isEmpty) return null;

    return sets.first.when(
      weightBased: (_, _, _) => WorkingSetType.weightBased,
      timeBased: (_) => WorkingSetType.timeBased,
      distanceBased: (_) => WorkingSetType.distanceBased,
      repsOnly: (_, _) => WorkingSetType.repsOnly,
    );
  }

  Exercise toExercise() {
    return Exercise(
      exerciseId: exerciseId,
      name: name,
      gifUrl: gifUrl,
      description: description,
      targetMuscles: targetMuscles,
      bodyParts: bodyParts,
      equipments: equipments,
      secondaryMuscles: secondaryMuscles,
      instructions: instructions,
    );
  }
}
