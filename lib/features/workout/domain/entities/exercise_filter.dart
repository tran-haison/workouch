import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_filter.freezed.dart';

@freezed
abstract class ExerciseFilter with _$ExerciseFilter {
  const factory ExerciseFilter({
    @Default('') String muscle,
    @Default('') String equipment,
  }) = _ExerciseFilter;
}

extension ExerciseFilterExtension on ExerciseFilter {
  bool get hasAnyFilter => muscle.isNotEmpty || equipment.isNotEmpty;
}
