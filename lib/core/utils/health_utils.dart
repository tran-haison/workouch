import '../../../features/auth/domain/entities/user.dart';
import '../../features/workout/domain/enums/activity_level.dart';

class HealthUtils {
  const HealthUtils._();

  // MET (Metabolic Equivalent)
  // For weight lifting and heavy workout, MET is 6.0
  static const workoutMET = 6.0;

  /// Calculate Basal Metabolic Rate (BMR) using Mifflin-St Jeor Equation
  /// BMR is the number of calories your body burns at rest to maintain basic functions
  ///
  /// Formula:
  /// - Men: BMR = 10 × weight(kg) + 6.25 × height(cm) - 5 × age(years) + 5
  /// - Women: BMR = 10 × weight(kg) + 6.25 × height(cm) - 5 × age(years) - 161
  ///
  /// Returns BMR in kcal/day, or 0 if required parameters are invalid
  static double calculateBMR({
    required Gender gender,
    required double weightKg, // kg
    required double heightCm, // cm
    required int age, // years
  }) {
    // Validate inputs
    if (weightKg <= 0 || heightCm <= 0 || age <= 0) {
      return 0;
    }

    // Base calculation: 10 × weight(kg) + 6.25 × height(cm) - 5 × age(years)
    final baseBMR = (10 * weightKg) + (6.25 * heightCm) - (5 * age);

    // Gender-specific adjustment
    final genderAdjustment = gender.isMale ? 5 : -161;

    return baseBMR + genderAdjustment;
  }

  /// Calculate Total Daily Energy Expenditure (TDEE) from BMR and activity level
  /// TDEE is the total number of calories you burn per day, including all activities
  ///
  /// Formula: TDEE = BMR × Activity Multiplier
  ///
  /// Activity Multipliers:
  /// - Sedentary (little or no exercise): 1.2
  /// - Lightly active (light exercise 1-3 days/week): 1.375
  /// - Moderately active (moderate exercise 3-5 days/week): 1.55
  /// - Very active (hard exercise 6-7 days/week): 1.725
  /// - Extremely active (very hard exercise, physical job): 1.9
  ///
  /// Returns TDEE in kcal/day, or 0 if BMR is invalid
  static double calculateTDEEFromBMR({
    required double bmr,
    required ActivityLevel activityLevel,
  }) {
    // Validate BMR
    if (bmr <= 0) {
      return 0;
    }

    return bmr * activityLevel.multiplier;
  }

  /// Calculate TDEE directly from user parameters
  /// Convenience method that calculates both BMR and TDEE in one call
  ///
  /// Returns TDEE in kcal/day, or 0 if required parameters are invalid
  static double calculateTDEEFromUserParams({
    required Gender gender,
    required double weightKg, // kg
    required double heightCm, // cm
    required int age, // years
    required ActivityLevel activityLevel,
  }) {
    final bmr = calculateBMR(
      gender: gender,
      weightKg: weightKg,
      heightCm: heightCm,
      age: age,
    );

    return calculateTDEEFromBMR(bmr: bmr, activityLevel: activityLevel);
  }

  /// Calculate workout calories burned using MET (Metabolic Equivalent)
  ///
  /// Formula: Calories = (MET × 3.5 × weight(kg) × minutes) / 200
  ///
  /// Returns calories burned during workout in kcal
  static int calculateCalories({
    required double weightKg, // kg
    required double minutes,
  }) {
    return (workoutMET * 3.5 * weightKg * minutes) ~/ 200;
  }
}
