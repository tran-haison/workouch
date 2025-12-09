import '../../../../core/constants/app_constants.dart';

/// Workout intensity levels
enum WorkoutIntensity {
  low(AppConstants.lowIntensity),
  medium(AppConstants.mediumIntensity),
  high(AppConstants.highIntensity);

  const WorkoutIntensity(this.label);

  final String label;
}
