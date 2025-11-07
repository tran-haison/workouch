import 'package:freezed_annotation/freezed_annotation.dart';

part 'working_set.freezed.dart';

/// Type of working set for an exercise
enum WorkingSetType { weightBased, timeBased, distanceBased, repsOnly }

@freezed
class WorkingSet with _$WorkingSet {
  const WorkingSet._();

  const factory WorkingSet.weightBased({
    @Default(0) int sets,
    @Default(0) int reps,
    @Default(0.0) double weight, // kg
  }) = WeightBasedSet;

  const factory WorkingSet.timeBased({
    @Default(Duration.zero) Duration duration,
  }) = TimeBasedSet;

  const factory WorkingSet.distanceBased({
    @Default(0.0) double distance, // meters
  }) = DistanceBasedSet;

  const factory WorkingSet.repsOnly({
    @Default(0) int sets,
    @Default(0) int reps,
  }) = RepsOnlySet;

  factory WorkingSet.empty(WorkingSetType type) {
    switch (type) {
      case WorkingSetType.weightBased:
        return const WorkingSet.weightBased();
      case WorkingSetType.timeBased:
        return const WorkingSet.timeBased();
      case WorkingSetType.distanceBased:
        return const WorkingSet.distanceBased();
      case WorkingSetType.repsOnly:
        return const WorkingSet.repsOnly();
    }
  }
}
