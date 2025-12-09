import '../../../../core/constants/app_constants.dart';

/// Activity level categories for TDEE calculation
enum ActivityLevel {
  sedentary(
    1.2,
    AppConstants.activityLevelTitleSedentary,
    AppConstants.activityLevelSedentary,
  ),
  lightlyActive(
    1.375,
    AppConstants.activityLevelTitleLightlyActive,
    AppConstants.activityLevelLightlyActive,
  ),
  moderatelyActive(
    1.55,
    AppConstants.activityLevelTitleModeratelyActive,
    AppConstants.activityLevelModeratelyActive,
  ),
  veryActive(
    1.725,
    AppConstants.activityLevelTitleVeryActive,
    AppConstants.activityLevelVeryActive,
  ),
  extremelyActive(
    1.9,
    AppConstants.activityLevelTitleExtremelyActive,
    AppConstants.activityLevelExtremelyActive,
  );

  const ActivityLevel(this.multiplier, this.title, this.description);

  /// Activity multiplier used to calculate TDEE from BMR
  final double multiplier;

  /// Title of the activity level (e.g., "Sedentary", "Lightly Active")
  final String title;

  /// Description of the activity level
  final String description;
}
