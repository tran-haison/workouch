import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_text_styles.dart';

class HomeHealthMetrics extends StatelessWidget {
  const HomeHealthMetrics({
    super.key,
    required this.weight,
    required this.bmi,
    required this.calories,
  });

  final String weight;
  final String bmi;
  final String calories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _HomeHealthMetricItem(label: AppConstants.weight, value: weight),
          _HomeHealthMetricItem(label: AppConstants.bmi, value: bmi),
          _HomeHealthMetricItem(label: AppConstants.calories, value: calories),
        ],
      ),
    );
  }
}

class _HomeHealthMetricItem extends StatelessWidget {
  const _HomeHealthMetricItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: AppTextStyles.h5),
        Text(value, style: AppTextStyles.anton.copyWith(fontSize: 16.sp)),
      ],
    );
  }
}
