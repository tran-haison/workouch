import 'package:intl/intl.dart';

class AppDateUtils {
  static String formatTodayDate() {
    final now = DateTime.now();
    final weekday = DateFormat('EEEE').format(now);
    final month = DateFormat('MMM').format(now);
    final day = now.day;
    final suffix = _ordinalSuffix(day);
    return '$weekday, $day$suffix $month';
  }

  static String greetUser(String? name) {
    final now = DateTime.now();
    final hour = now.hour;
    final greet = hour < 12
        ? 'Good morning'
        : hour < 18
        ? 'Good afternoon'
        : 'Good evening';

    return name != null ? '$greet, $name!' : greet;
  }

  static String _ordinalSuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
