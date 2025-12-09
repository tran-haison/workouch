import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_bottom_dialog.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/enums/workout_goal.dart';

class LazyGoalsSelector extends StatefulWidget {
  const LazyGoalsSelector({
    super.key,
    required this.initialGoals,
    required this.onChanged,
  });

  final List<WorkoutGoal> initialGoals;
  final ValueChanged<List<WorkoutGoal>> onChanged;

  @override
  State<LazyGoalsSelector> createState() => _LazyGoalsSelectorState();
}

class _LazyGoalsSelectorState extends State<LazyGoalsSelector> {
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
          color: AppColors.grayBlue,
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
                      color: AppColors.black,
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
    final selected = await _showGoalsSelectionDialog();
    if (mounted && selected is List<WorkoutGoal>) {
      setState(() {
        _currentGoals = selected;
      });
      widget.onChanged(_currentGoals);
    }
  }

  Future<dynamic> _showGoalsSelectionDialog() async {
    return await showCommonBottomDialog(
      context,
      child: _MultiSelectGoalsDialog(initialSelected: List.from(_currentGoals)),
    );
  }
}

class _MultiSelectGoalsDialog extends StatefulWidget {
  const _MultiSelectGoalsDialog({required this.initialSelected});

  final List<WorkoutGoal> initialSelected;

  @override
  State<_MultiSelectGoalsDialog> createState() =>
      _MultiSelectGoalsDialogState();
}

class _MultiSelectGoalsDialogState extends State<_MultiSelectGoalsDialog> {
  final allGoals = WorkoutGoal.values;
  late List<WorkoutGoal> _selectedGoals;

  @override
  void initState() {
    super.initState();
    _selectedGoals = List.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                AppConstants.selectYourGoals,
                style: AppTextStyles.h3,
              ),
            ),
            Gaps.hGap10,
            CommonIconButton(
              icon: Assets.icons.close,
              iconSize: 20.r,
              padding: EdgeInsets.all(8.r),
              iconColor: AppColors.black,
              backgroundColor: AppColors.grayBlue,
              onTap: () => context.pop(),
            ),
          ],
        ),
        Gaps.vGap16,
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: allGoals.length,
            itemBuilder: (context, index) {
              final goal = allGoals[index];
              final isSelected = _selectedGoals.contains(goal);

              return _GoalTile(
                goal: goal,
                isSelected: isSelected,
                onTap: () => _toggleGoal(goal),
              );
            },
            separatorBuilder: (_, _) => Gaps.vGap12,
          ),
        ),
        Gaps.vGap16,
        CommonButton(text: AppConstants.confirm, onPressed: _onConfirm),
        Gaps.vGap8,
      ],
    );
  }

  void _toggleGoal(WorkoutGoal goal) {
    setState(() {
      if (_selectedGoals.contains(goal)) {
        _selectedGoals.remove(goal);
      } else {
        _selectedGoals.add(goal);
      }
    });
  }

  void _onConfirm() {
    context.pop(_selectedGoals);
  }
}

class _GoalTile extends StatelessWidget {
  const _GoalTile({
    required this.goal,
    required this.isSelected,
    required this.onTap,
  });

  final WorkoutGoal goal;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary : AppColors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.secondary : AppColors.grayBlue,
            width: 1.r,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                goal.label,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Gaps.hGap12,
            Container(
              width: 24.r,
              height: 24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.black : AppColors.grayBlue,
                  width: 2.r,
                ),
                color: isSelected ? AppColors.black : AppColors.transparent,
              ),
              padding: EdgeInsets.all(2.r),
              child: isSelected
                  ? CommonAssetIcon(
                      Assets.icons.check,
                      width: 20.r,
                      height: 20.r,
                      color: AppColors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
