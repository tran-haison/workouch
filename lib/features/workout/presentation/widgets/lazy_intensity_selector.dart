import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../domain/enums/workout_intensity.dart';

class LazyIntensitySelector extends StatefulWidget {
  const LazyIntensitySelector({
    super.key,
    required this.initialIntensity,
    required this.onChanged,
  });

  final WorkoutIntensity initialIntensity;
  final ValueChanged<WorkoutIntensity> onChanged;

  @override
  State<LazyIntensitySelector> createState() => _LazyIntensitySelectorState();
}

class _LazyIntensitySelectorState extends State<LazyIntensitySelector> {
  late WorkoutIntensity _currentIntensity;

  @override
  void initState() {
    super.initState();
    _currentIntensity = widget.initialIntensity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: WorkoutIntensity.values
          .expand(
            (intensity) => [
              Expanded(
                child: _IntensityButton(
                  label: intensity.label,
                  isSelected: _currentIntensity == intensity,
                  onTap: () {
                    setState(() {
                      _currentIntensity = intensity;
                    });
                    widget.onChanged(intensity);
                  },
                ),
              ),
              if (intensity != WorkoutIntensity.values.last) Gaps.hGap12,
            ],
          )
          .toList(),
    );
  }
}

class _IntensityButton extends StatelessWidget {
  const _IntensityButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.grayBlue,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.h4.copyWith(
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
