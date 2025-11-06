import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';

@freezed
abstract class Exercise with _$Exercise {
  const factory Exercise({
    @Default('') String exerciseId,
    @Default('') String name,
    @Default('') String gifUrl,
    @Default('') String description,
    @Default([]) List<String> targetMuscles,
    @Default([]) List<String> bodyParts,
    @Default([]) List<String> equipments,
    @Default([]) List<String> secondaryMuscles,
    @Default([]) List<String> instructions,
  }) = _Exercise;
}

extension ExerciseExtension on Exercise {
  String get type => '${bodyParts[0]} > ${equipments[0]}';
}
