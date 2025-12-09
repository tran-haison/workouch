import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';

class LazyDurationSelector extends StatefulWidget {
  const LazyDurationSelector({
    super.key,
    required this.initialDuration,
    required this.onChanged,
  });

  final Duration initialDuration;
  final ValueChanged<Duration> onChanged;

  @override
  State<LazyDurationSelector> createState() => _LazyDurationSelectorState();
}

class _LazyDurationSelectorState extends State<LazyDurationSelector> {
  late Duration _currentDuration;
  final durations = [
    const Duration(minutes: 10),
    const Duration(minutes: 20),
    const Duration(minutes: 30),
    const Duration(minutes: 45),
    const Duration(minutes: 60),
    const Duration(minutes: 90),
  ];

  @override
  void initState() {
    super.initState();
    _currentDuration = widget.initialDuration;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: durations.length,
        separatorBuilder: (_, _) => Gaps.hGap12,
        itemBuilder: (context, index) {
          final durationOption = durations[index];
          final label = '${durationOption.inMinutes} ${AppConstants.mins}';
          final isSelected =
              _currentDuration.inMinutes == durationOption.inMinutes;

          return GestureDetector(
            onTap: () {
              setState(() {
                _currentDuration = durationOption;
              });
              widget.onChanged(durationOption);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
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
        },
      ),
    );
  }
}
