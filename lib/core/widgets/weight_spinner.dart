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
  });

  final MeasurementSystem measurementSystem;
  final double initialWeightKg;
  final ValueChanged<double> onWeightChanged;

  @override
  Widget build(BuildContext context) {
    switch (measurementSystem) {
      case MeasurementSystem.metric:
        return _WeightMetricSpinner(
          initialWeightKg: initialWeightKg,
          onChanged: onWeightChanged,
        );
      case MeasurementSystem.imperial:
        return _WeightImperialSpinner(
          initialWeightKg: initialWeightKg,
          onChanged: onWeightChanged,
        );
    }
  }
}

class _WeightMetricSpinner extends StatelessWidget {
  const _WeightMetricSpinner({
    required this.initialWeightKg,
    required this.onChanged,
  });

  final double initialWeightKg;
  final ValueChanged<double> onChanged;

  static const minKg = 20;
  static const maxKg = 300;

  @override
  Widget build(BuildContext context) {
    final items = List<SpinnerItem<double>>.generate(maxKg - minKg + 1, (i) {
      final value = (minKg + i).toDouble();
      return SpinnerItem<double>(
        label: '${value.toStringAsFixed(1)} ${AppConstants.kg.toLowerCase()}',
        item: value,
      );
    });

    final initialIndex = (initialWeightKg - minKg).round();

    return CommonSpinner<double>(
      items: items,
      initialItem: initialIndex,
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
  });

  final double initialWeightKg;
  final ValueChanged<double> onChanged;

  static const minLbs = 40;
  static const maxLbs = 650;

  @override
  @override
  Widget build(BuildContext context) {
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
      items: items,
      initialItem: initialIndex,
      onSelected: (index) {
        final lbs = (minLbs + index).toDouble();
        final kg = lbs.lbsToKg;
        onChanged(kg);
      },
    );
  }
}
