import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workouch/core/extension/duration_extension.dart';
import '../../../../core/constants/app_constants.dart';
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

  String get formatMainInfo => '${bodyParts[0]} > ${equipments[0]}';

  List<String> get formatSetsInfo {
    if (sets.isEmpty) {
      return [];
    }

    // Format all sets
    final formattedSets = sets
        .map((set) {
          return set.when(
            weightBased: (sets, reps, weight) {
              if (sets == 0 || reps == 0 || weight == 0) return null;
              return '$sets ${AppConstants.sets} • $reps ${AppConstants.reps} • $weight ${AppConstants.kg}'
                  .toLowerCase();
            },
            repsOnly: (sets, reps) {
              if (sets == 0 || reps == 0) return null;
              return '$sets ${AppConstants.sets} • $reps ${AppConstants.reps}'
                  .toLowerCase();
            },
            timeBased: (duration) {
              if (duration.inSeconds == 0) return null;
              return duration.mmss.toLowerCase();
            },
            distanceBased: (distance) {
              if (distance == 0) return null;
              if (distance >= 1000) {
                final km = distance / 1000;
                final kmString = km
                    .toStringAsFixed(3)
                    .replaceAll(RegExp(r'0+$'), '')
                    .replaceAll(RegExp(r'\.$'), '');
                return '$kmString ${AppConstants.km}'.toLowerCase();
              }
              return '${distance.toInt()} ${AppConstants.meters}'.toLowerCase();
            },
          );
        })
        .where((formatted) => formatted != null)
        .cast<String>()
        .toList();

    return formattedSets;
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
