class OnboardUtils {
  OnboardUtils._();

  /// Returns a list of available ages for selection (10-100)
  static List<int> get availableAges =>
      List.generate(91, (index) => index + 10);

  /// Gets the index of the age in the available ages list
  /// Returns 0 if age is null or not found
  static int getAgeIndex(int? age) {
    if (age == null) return 0;
    final index = availableAges.indexOf(age);
    return index >= 0 ? index : 0;
  }

  /// Minimum height in cm for selection
  static const double minHeight = 50.0;

  /// Maximum height in cm for selection
  static const double maxHeight = 300.0;

  /// Default height in cm if none is selected
  static const double defaultHeight = 170.0;

  /// Minimum weight in kg for selection
  static const double minWeight = 30.0;

  /// Maximum weight in kg for selection
  static const double maxWeight = 300.0;

  /// Default weight in kg if none is selected
  static const double defaultWeight = 70.0;
}
