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
  bool get missingSets => sets.isEmpty;

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
