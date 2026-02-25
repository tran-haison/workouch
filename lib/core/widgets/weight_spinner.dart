import 'package:flutter/material.dart';

import '../../features/auth/domain/entities/user.dart';
import '../constants/app_constants.dart';
import '../extension/double_extension.dart';
import 'common_spinner.dart';

class WeightSpinner extends StatelessWidget {
  const WeightSpinner({
    super.key,
    required this.measurementSystem,
    required this.initialWeightKg,
    required this.onWeightChanged,
    this.textStyle,
    this.height,
  });

  final MeasurementSystem measurementSystem;
  final double initialWeightKg;
  final ValueChanged<double> onWeightChanged;
  final TextStyle? textStyle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    switch (measurementSystem) {
      case MeasurementSystem.metric:
        return _WeightMetricSpinner(
          initialWeightKg: initialWeightKg,
          onChanged: onWeightChanged,
          textStyle: textStyle,
          height: height,
        );
      case MeasurementSystem.imperial:
        return _WeightImperialSpinner(
          initialWeightKg: initialWeightKg,
          onChanged: onWeightChanged,
          textStyle: textStyle,
          height: height,
        );
    }
  }
}

class _WeightMetricSpinner extends StatelessWidget {
  const _WeightMetricSpinner({
    required this.initialWeightKg,
    required this.onChanged,
    this.textStyle,
    this.height,
  });

  final double initialWeightKg;
  final ValueChanged<double> onChanged;
  final TextStyle? textStyle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final minKg = AppConstants.humanMetrics.minWeightKg;
    final maxKg = AppConstants.humanMetrics.maxWeightKg;

    final items = List<SpinnerItem<double>>.generate(maxKg - minKg + 1, (i) {
      final value = (minKg + i).toDouble();
      return SpinnerItem<double>(
        label: '${value.toStringAsFixed(1)} ${AppConstants.kg.toLowerCase()}',
        item: value,
      );
    });

    final initialIndex = (initialWeightKg - minKg).round();

    return CommonSpinner<double>(
      height: height,
      items: items,
      initialItem: initialIndex,
      textStyle: textStyle,
      onSelected: (index) {
        final kg = (minKg + index).toDouble();
        onChanged(kg);
      },
    );
  }
}

class _WeightImperialSpinner extends StatelessWidget {
  const _WeightImperialSpinner({
    required this.initialWeightKg,
    required this.onChanged,
    this.textStyle,
    this.height,
  });

  final double initialWeightKg;
  final ValueChanged<double> onChanged;
  final TextStyle? textStyle;
  final double? height;

  @override
  @override
  Widget build(BuildContext context) {
    final minLbs = AppConstants.humanMetrics.minWeightLbs;
    final maxLbs = AppConstants.humanMetrics.maxWeightLbs;

    final initialWeightLbs = initialWeightKg.kgToLbs;
    final initialIndex = (initialWeightLbs - minLbs).round();

    final items = List<SpinnerItem<double>>.generate(maxLbs - minLbs + 1, (i) {
      final value = (minLbs + i).toDouble();
      return SpinnerItem<double>(
        label: '${value.toStringAsFixed(0)} ${AppConstants.lbs.toLowerCase()}',
        item: value,
      );
    });

    return CommonSpinner<double>(
      height: height,
      items: items,
      initialItem: initialIndex,
      textStyle: textStyle,
      onSelected: (index) {
        final lbs = (minLbs + index).toDouble();
        final kg = lbs.lbsToKg;
        onChanged(kg);
      },
    );
  }
}
