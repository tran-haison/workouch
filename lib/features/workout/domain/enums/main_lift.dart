import 'package:workouch/features/workout/domain/entities/working_set.dart';
import 'package:workouch/features/workout_session/domain/entities/exercise_personal_record.dart';

import '../../../../core/constants/app_constants.dart';

enum MainLift { benchPress, squat, deadlift, overheadPress, weightedPullUp }

extension MainLiftExt on MainLift {
  String get label => switch (this) {
    MainLift.benchPress => AppConstants.benchPress,
    MainLift.squat => AppConstants.squat,
    MainLift.deadlift => AppConstants.deadlift,
    MainLift.overheadPress => AppConstants.overheadPress,
    MainLift.weightedPullUp => AppConstants.weightedPullUp,
  };

  /// ID of the exercise in the exercise database (ALWAYS sync with db)
  String get exerciseId => switch (this) {
    MainLift.benchPress => 'EIeI8Vf',
    MainLift.squat => 'qXTaZnJ',
    MainLift.deadlift => 'ila4NZS',
    MainLift.overheadPress => 'kTbSH9h',
    MainLift.weightedPullUp => 'HMzLjXx',
  };

  /// URL of the exercise GIF image (ALWAYS sync with db)
  String get gifUrl => switch (this) {
    MainLift.benchPress =>
      'https://workouch-exercise-db.vercel.app/media/EIeI8Vf.gif',
    MainLift.squat =>
      'https://workouch-exercise-db.vercel.app/media/qXTaZnJ.gif',
    MainLift.deadlift =>
      'https://workouch-exercise-db.vercel.app/media/ila4NZS.gif',
    MainLift.overheadPress =>
      'https://workouch-exercise-db.vercel.app/media/kTbSH9h.gif',
    MainLift.weightedPullUp =>
      'https://workouch-exercise-db.vercel.app/media/HMzLjXx.gif',
  };

  WorkingSetType get setType => switch (this) {
    MainLift.benchPress => WorkingSetType.weightBased,
    MainLift.squat => WorkingSetType.weightBased,
    MainLift.deadlift => WorkingSetType.weightBased,
    MainLift.overheadPress => WorkingSetType.weightBased,
    MainLift.weightedPullUp => WorkingSetType.weightBased,
  };

  ExercisePersonalRecord toExercisePersonalRecord({
    required DateTime prDate,
    required int maxReps,
    required double maxWeightKg,
    required bool isVisibleOnHistory,
  }) {
    return ExercisePersonalRecord(
      exerciseId: exerciseId,
      name: label,
      gifUrl: gifUrl,
      setType: setType,
      maxReps: maxReps,
      maxWeightKg: maxWeightKg,
      prDate: prDate,
      isVisibleOnHistory: isVisibleOnHistory,
    );
  }
}
