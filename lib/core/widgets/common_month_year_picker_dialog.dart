import 'package:flutter/material.dart';
import 'package:workouch/core/widgets/common_gaps.dart';

import '../constants/app_constants.dart';
import '../theme/app_text_styles.dart';
import 'common_pop_up_dialog.dart';
import 'common_spinner.dart';

/// Show a dialog that lets the user pick only month and year.
/// - Years: [now.year - 100] up to current year.
/// - Months: up to current month for the current year; full 12 for past years.
Future<DateTime?> showCommonMonthYearPickerDialog(
  BuildContext context, {
  DateTime? initialDate,
}) async {
  final now = DateTime.now();
  final minYear = now.year - 100;
  final maxYear = now.year;

  final effectiveInitial = initialDate ?? now;

  final years = List<int>.generate(maxYear - minYear + 1, (i) => minYear + i);
  const monthLabels = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  int selectedYearIndex = years.indexOf(
    effectiveInitial.year.clamp(minYear, maxYear),
  );
  if (selectedYearIndex < 0) {
    selectedYearIndex = years.length - 1;
  }

  List<int> monthsForYear(int year) {
    final maxMonth = year == now.year ? now.month : 12;
    return List<int>.generate(maxMonth, (i) => i + 1);
  }

  var months = monthsForYear(years[selectedYearIndex]);
  int selectedMonthIndex = months.indexOf(
    effectiveInitial.month.clamp(1, months.last),
  );
  if (selectedMonthIndex < 0) {
    selectedMonthIndex = months.length - 1;
  }

  DateTime? picked;

  await showCommonPopUpDialog(
    context,
    title: AppConstants.selectMonthYear,
    body: StatefulBuilder(
      builder: (context, setState) {
        months = monthsForYear(years[selectedYearIndex]);
        if (selectedMonthIndex >= months.length) {
          selectedMonthIndex = months.length - 1;
        }

        final monthItems = months
            .map((m) => SpinnerItem<int>(label: monthLabels[m - 1], item: m))
            .toList();

        final yearItems = years
            .map((y) => SpinnerItem<int>(label: y.toString(), item: y))
            .toList();

        return Row(
          children: [
            Expanded(
              child: CommonSpinner<int>(
                items: monthItems,
                initialItem: selectedMonthIndex,
                textStyle: AppTextStyles.h4.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                onSelected: (index) {
                  setState(() {
                    selectedMonthIndex = index;
                  });
                },
              ),
            ),
            Gaps.hGap16,
            Expanded(
              child: CommonSpinner<int>(
                items: yearItems,
                initialItem: selectedYearIndex,
                textStyle: AppTextStyles.h4.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                onSelected: (index) {
                  setState(() {
                    selectedYearIndex = index;
                  });
                },
              ),
            ),
          ],
        );
      },
    ),
    onFirstButtonPressed: () {
      final year = years[selectedYearIndex];
      final monthsForSelectedYear = monthsForYear(year);
      final month = monthsForSelectedYear[selectedMonthIndex];
      picked = DateTime(year, month, 1);
    },
  );

  return picked;
}
