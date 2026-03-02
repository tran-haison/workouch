import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/widgets/common_multi_select_option_dialog.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/enums/workout_goal.dart';

class NeatGoalsSelector extends StatefulWidget {
  const NeatGoalsSelector({
    super.key,
    required this.initialGoals,
    required this.onChanged,
  });

  final List<WorkoutGoal> initialGoals;
  final ValueChanged<List<WorkoutGoal>> onChanged;

  @override
  State<NeatGoalsSelector> createState() => _NeatGoalsSelectorState();
}

class _NeatGoalsSelectorState extends State<NeatGoalsSelector> {
  late List<WorkoutGoal> _currentGoals;

  @override
  void initState() {
    super.initState();
    _currentGoals = List.from(widget.initialGoals);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleGoalsSelection,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grayBlue, width: 1.r),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(_getDisplayText(), style: AppTextStyles.h4),
                ),
                Gaps.hGap12,
                CommonAssetIcon(
                  Assets.icons.arrowDown,
                  width: 16.r,
                  height: 16.r,
                  color: AppColors.black,
                ),
              ],
            ),
            if (_currentGoals.isNotEmpty) ...[
              Gaps.vGap8,
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: _currentGoals.map((goal) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.darkBlack,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      goal.label,
                      style: AppTextStyles.h5.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getDisplayText() {
    if (_currentGoals.isEmpty) {
      return AppConstants.selectYourGoals;
    }
    return AppConstants.workoutGoals;
  }

  Future<void> _handleGoalsSelection() async {
    final selected = await showCommonMultiSelectOptionDialog<WorkoutGoal>(
      context,
      optionItems: WorkoutGoal.values
          .map((goal) => OptionItem(label: goal.label, value: goal))
          .toList(),
      title: AppConstants.selectYourGoals,
      initialSelected: List.from(_currentGoals),
    );

    if (mounted && selected is List<WorkoutGoal>) {
      setState(() {
        _currentGoals = selected;
      });
      widget.onChanged(_currentGoals);
    }
  }
}
