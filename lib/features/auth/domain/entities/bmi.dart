import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

enum BmiStatus {
  underweight(15, 18.5, 'Underweight', AppColors.blue),
  normal(18.5, 25, 'Normal', AppColors.success),
  overweight(25, 30, 'Overweight', AppColors.orange),
  obese(30, 40, 'Obese', AppColors.error);

  const BmiStatus(this.min, this.max, this.label, this.color);

  final double min; // inclusive
  final double max; // exclusive
  final String label;
  final Color color;
}

extension BmiStatusExt on BmiStatus {
  bool get isUnderweight => this == BmiStatus.underweight;
  bool get isNormal => this == BmiStatus.normal;
  bool get isOverweight => this == BmiStatus.overweight;
  bool get isObese => this == BmiStatus.obese;

  static BmiStatus fromBmi(double bmi) {
    return BmiStatus.values.firstWhere(
      (e) =>
          (bmi >= e.min && bmi < e.max) ||
          (bmi < e.min && e.isUnderweight) ||
          (bmi >= e.max && e.isObese),
      orElse: () => BmiStatus.normal,
    );
  }
}
