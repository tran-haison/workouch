import '../../../../core/constants/app_constants.dart';

/// Workout goal types
enum WorkoutGoal {
  strength(AppConstants.goalStrength),
  hypertrophy(AppConstants.goalHypertrophy),
  endurance(AppConstants.goalEndurance),
  fatLoss(AppConstants.goalFatLoss),
  mobility(AppConstants.goalMobility);

  const WorkoutGoal(this.label);

  final String label;
}
