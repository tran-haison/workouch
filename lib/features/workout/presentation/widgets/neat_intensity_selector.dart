import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/widgets/common_icons.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../domain/enums/workout_intensity.dart';

class NeatIntensitySelector extends StatefulWidget {
  const NeatIntensitySelector({
    super.key,
    required this.initialIntensity,
    required this.onChanged,
  });

  final WorkoutIntensity initialIntensity;
  final ValueChanged<WorkoutIntensity> onChanged;

  @override
  State<NeatIntensitySelector> createState() => _NeatIntensitySelectorState();
}

class _NeatIntensitySelectorState extends State<NeatIntensitySelector> {
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
                child: _IntensityCard(
                  intensity: intensity,
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

class _IntensityCard extends StatelessWidget {
  const _IntensityCard({
    required this.intensity,
    required this.isSelected,
    required this.onTap,
  });

  final WorkoutIntensity intensity;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.darkBlack : AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.darkBlack : AppColors.grayBlue,
            width: 1.r,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              CommonAssetIcon(
                intensity.icon,
                width: 20.r,
                height: 20.r,
                color: isSelected ? intensity.iconColor : AppColors.darkBlack,
              ),
              Gaps.vGap4,
              Text(
                intensity.label,
                style: AppTextStyles.h4.copyWith(
                  color: isSelected ? AppColors.white : AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
