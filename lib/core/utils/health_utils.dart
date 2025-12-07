class HealthUtils {
  const HealthUtils._();

  // MET (Metabolic Equivalent)
  // For weight lifting and heavy workout, MET is 6.0
  static const workoutMET = 6.0;

  static int calculateCalories({
    required double weight, // kg
    required double minutes,
  }) {
    return (workoutMET * 3.5 * weight * minutes) ~/ 200;
  }
}
