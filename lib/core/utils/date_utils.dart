import 'package:intl/intl.dart';

class AppDateUtils {
  AppDateUtils._();

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

  /// Format a date for display (e.g., "Monday, 15th Oct 2024")
  static String fullDate(DateTime date) {
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

  /// Get all days in a month
  static List<DateTime> getAllDaysInMonth(DateTime date) {
    final lastDay = DateTime(date.year, date.month + 1, 0);
    final daysInMonth = lastDay.day;

    return List.generate(daysInMonth, (index) {
      return DateTime(date.year, date.month, index + 1);
    });
  }

  /// Get the first day of the week for a month (to show empty cells before month starts)
  /// Returns the number of days to pad before the first day of the month
  static int getDaysBeforeMonthStart(DateTime date) {
    // Monday = 1, Sunday = 7
    // If first day is Monday (1), we need 0 padding days
    // If first day is Sunday (7), we need 6 padding days
    final firstDay = DateTime(date.year, date.month, 1);
    return (firstDay.weekday - 1) % 7;
  }

  static bool isThisYear(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year;
  }

  static bool isThisMonth(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month;
  }

  /// True if [date] falls in the same calendar week (Monday–Sunday) as now.
  static bool isThisWeek(DateTime date) {
    final now = DateTime.now();
    return getWeekStartDate(DateTime(date.year, date.month, date.day)) ==
        getWeekStartDate(DateTime(now.year, now.month, now.day));
  }

  static List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  /// Format month and year for display (e.g., "January 2024")
  static String formatMonthYear(DateTime date) {
    return DateFormat('MMMM yyyy').format(date);
  }

  /// ISO date for database (PostgreSQL DATE): yyyy-MM-dd
  static String yyyyMMdd(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Get Monday of the week for a given date.
  /// Returns the date only (ignore time)
  static DateTime getWeekStartDate(DateTime date) {
    return DateTime(
      date.year,
      date.month,
      date.day,
    ).subtract(Duration(days: date.weekday - 1));
  }

  /// Format a month as "yyyy-MM"
  static String yyyyMM(DateTime date) {
    return DateFormat('yyyy-MM').format(DateTime(date.year, date.month, 1));
  }

  /// Get the first day of the month
  static DateTime firstDateOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  /// Get the last day of the month
  static DateTime lastDateOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0, 23, 59, 59, 999);
  }
}
