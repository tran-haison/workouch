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

    return name?.isNotEmpty == true ? '$greet, $name!' : greet;
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

  /// Format a date for display (e.g., "15th October 2024")
  static String formatDate(DateTime date) {
    final weekday = DateFormat('EEEE').format(date);
    final month = DateFormat('MMM').format(date);
    final day = date.day;
    final year = date.year;
    final suffix = _ordinalSuffix(day);
    return '$weekday, $day$suffix $month $year';
  }

  /// Get all days of the current week (Monday to Sunday)
  static List<DateTime> getCurrentWeekDays() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));

    return List.generate(7, (index) {
      return startOfWeek.add(Duration(days: index));
    });
  }

  /// Check if a given date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
