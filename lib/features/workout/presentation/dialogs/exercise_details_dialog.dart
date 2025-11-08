import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/extension/duration_extension.dart';
import 'package:workouch/features/workout/domain/entities/working_exercise.dart';
import 'package:workouch/features/workout/presentation/widgets/exercise_card_item.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_bottom_dialog.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/working_set.dart';
import 'rest_time_dialog.dart';
import '../widgets/working_set_input.dart';

enum _Action { add, edit }

class ExerciseDetailsDialog {
  const ExerciseDetailsDialog._();

  static Future<dynamic> showToAdd(
    BuildContext context, {
    required WorkingExercise workingExercise,
  }) async {
    return await showCommonBottomDialog(
      context,
      child: _ExerciseDetailsDialog(
        action: _Action.add,
        workingExercise: workingExercise,
      ),
    );
  }

  static Future<dynamic> showToEdit(
    BuildContext context, {
    required WorkingExercise workingExercise,
  }) async {
    return await showCommonBottomDialog(
      context,
      child: _ExerciseDetailsDialog(
        action: _Action.edit,
        workingExercise: workingExercise,
      ),
    );
  }
}

class _ExerciseDetailsDialog extends StatefulWidget {
  const _ExerciseDetailsDialog({
    required this.action,
    required this.workingExercise,
  });

  final _Action action;
  final WorkingExercise workingExercise;

  @override
  State<_ExerciseDetailsDialog> createState() => _ExerciseDetailsDialogState();
}

class _ExerciseDetailsDialogState extends State<_ExerciseDetailsDialog> {
  final List<GlobalKey> _setKeys = []; // To keep track of sets
  late WorkingExercise _exercise;

  @override
  void initState() {
    super.initState();

    switch (widget.action) {
      case _Action.add:
        // Init new exercise with 1 empty set as weight based
        _exercise = widget.workingExercise.copyWith(
          sets: [WorkingSet.weightBased()],
          setType: WorkingSetType.weightBased,
        );
        _setKeys.add(GlobalKey());
        break;
      case _Action.edit:
        // Set existing exercise
        // Set number of keys equals to number of sets
        _exercise = widget.workingExercise;
        _setKeys.addAll(_exercise.sets.map((_) => GlobalKey()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                AppConstants.exercise,
                style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
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
        Expanded(
          child: ListView(
            children: [
              ExerciseCardItem(exercise: _exercise.toExercise()),
              Gaps.vGap30,
              Text(
                AppConstants.exerciseType,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w500),
              ),
              Gaps.vGap10,
              _ExerciseTypeSelector(
                initialType:
                    _exercise.effectiveSetType ?? WorkingSetType.weightBased,
                onTypeChanged: _changeExerciseType,
              ),
              Gaps.vGap30,
              Text(
                AppConstants.sets,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w500),
              ),
              Gaps.vGap10,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _setKeys.length,
                itemBuilder: (context, index) {
                  return WorkingSetInput(
                    key: _setKeys[index],
                    showDeleteButton: _setKeys.length > 1,
                    onEdit: (workoutSet) => _editWorkoutSet(workoutSet, index),
                    onDelete: () => _deleteWorkoutSet(index),
                    type:
                        _exercise.effectiveSetType ??
                        WorkingSetType.weightBased,
                    initialWorkingSet: _exercise.sets[index],
                  );
                },
                separatorBuilder: (_, _) => Gaps.vGap10,
              ),
              Gaps.vGap10,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonButton(
                    isFullWidth: false,
                    text: AppConstants.newSet,
                    backgroundColor: AppColors.secondary,
                    textStyle: AppTextStyles.h5,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    trailing: CommonAssetIcon(
                      Assets.icons.add,
                      color: AppColors.black,
                      width: 16.r,
                      height: 16.r,
                    ),
                    onPressed: _addWorkoutSet,
                  ),
                ],
              ),
              Gaps.vGap30,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppConstants.restBetweenSets,
                      style: AppTextStyles.h4.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Gaps.hGap10,
                  CommonButton(
                    text: _exercise.restTimeBetweenSets.mmss,
                    onPressed: _showRestTimeDialog,
                    isFullWidth: false,
                    textStyle: AppTextStyles.h5,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    radius: 12.r,
                    borderColor: AppColors.black,
                    backgroundColor: AppColors.transparent,
                    spaceWithTrailing: 4.w,
                    trailing: CommonAssetIcon(
                      Assets.icons.arrowDown,
                      width: 16.r,
                      height: 16.r,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gaps.vGap16,
        CommonButton(
          text: widget.action == _Action.add
              ? AppConstants.addExercise
              : AppConstants.updateExercise,
          onPressed: _confirm,
        ),
        if (widget.action == _Action.edit) ...[
          CommonButton(
            text: AppConstants.delete,
            backgroundColor: AppColors.transparent,
            textStyle: AppTextStyles.h4.copyWith(
              color: AppColors.errorDark,
              fontWeight: FontWeight.w600,
            ),
            onPressed: _deleteExercise,
          ),
        ],
      ],
    );
  }

  void _changeExerciseType(WorkingSetType type) {
    if (_exercise.effectiveSetType == type) return;

    setState(() {
      // Reset all workout sets with new type
      _setKeys.clear();
      _setKeys.add(GlobalKey());

      // Create empty set based on type
      final emptySet = WorkingSet.empty(type);
      _exercise = _exercise.copyWith(setType: type, sets: [emptySet]);
    });
  }

  void _editWorkoutSet(WorkingSet editedWorkingSet, int index) {
    setState(() {
      _exercise = _exercise.copyWith(
        sets: [
          ..._exercise.sets.sublist(0, index),
          ...[editedWorkingSet],
          ..._exercise.sets.sublist(index + 1),
        ],
      );
    });
  }

  void _addWorkoutSet() {
    final currentType =
        _exercise.effectiveSetType ?? WorkingSetType.weightBased;

    setState(() {
      _setKeys.add(GlobalKey());

      // Create empty set based on current type
      final emptySet = WorkingSet.empty(currentType);
      _exercise = _exercise.copyWith(sets: [..._exercise.sets, emptySet]);
    });
  }

  void _deleteWorkoutSet(int index) {
    if (_setKeys.length <= 1) return; // Don't delete if it's the only set

    setState(() {
      _setKeys.removeAt(index);
      _exercise = _exercise.copyWith(
        sets: [
          ..._exercise.sets.sublist(0, index),
          ..._exercise.sets.sublist(index + 1),
        ],
      );
    });
  }

  void _confirm() {
    // If there is no set, not allow submission
    if (_exercise.missingSets) {
      return;
    }

    context.pop(_exercise);
  }

  void _deleteExercise() {
    // Return the exercise ID as String to indicate deletion
    context.pop(_exercise.exerciseId);
  }

  Future<void> _showRestTimeDialog() async {
    final restTime = await showRestTimeDialog(
      context,
      title: AppConstants.restBetweenSets,
      initialValue: _exercise.restTimeBetweenSets,
    );

    if (mounted && restTime is Duration) {
      setState(() {
        _exercise = _exercise.copyWith(restTimeBetweenSets: restTime);
      });
    }
  }
}

class _ExerciseTypeSelector extends StatefulWidget {
  const _ExerciseTypeSelector({
    required this.initialType,
    required this.onTypeChanged,
  });

  final WorkingSetType initialType;
  final Function(WorkingSetType) onTypeChanged;

  @override
  State<_ExerciseTypeSelector> createState() => _ExerciseTypeSelectorState();
}

class _ExerciseTypeSelectorState extends State<_ExerciseTypeSelector> {
  late WorkingSetType _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialType;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _ExerciseTypeItem(
          text: AppConstants.weight,
          type: WorkingSetType.weightBased,
          onSelected: (type) {
            setState(() => _selectedType = type);
            widget.onTypeChanged(type);
          },
          isSelected: _selectedType == WorkingSetType.weightBased,
        ),
        Gaps.hGap10,
        _ExerciseTypeItem(
          text: AppConstants.repsOnly,
          type: WorkingSetType.repsOnly,
          onSelected: (type) {
            setState(() => _selectedType = type);
            widget.onTypeChanged(type);
          },
          isSelected: _selectedType == WorkingSetType.repsOnly,
        ),
        Gaps.hGap10,
        _ExerciseTypeItem(
          text: AppConstants.time,
          type: WorkingSetType.timeBased,
          onSelected: (type) {
            setState(() => _selectedType = type);
            widget.onTypeChanged(type);
          },
          isSelected: _selectedType == WorkingSetType.timeBased,
        ),
        Gaps.hGap10,
        _ExerciseTypeItem(
          text: AppConstants.distance,
          type: WorkingSetType.distanceBased,
          onSelected: (type) {
            setState(() => _selectedType = type);
            widget.onTypeChanged(type);
          },
          isSelected: _selectedType == WorkingSetType.distanceBased,
        ),
      ],
    );
  }
}

class _ExerciseTypeItem extends StatelessWidget {
  const _ExerciseTypeItem({
    required this.text,
    required this.type,
    required this.onSelected,
    required this.isSelected,
  });

  final String text;
  final WorkingSetType type;
  final Function(WorkingSetType) onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelected(type),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.grayBlue,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          text,
          style: AppTextStyles.h5.copyWith(
            color: isSelected ? AppColors.white : AppColors.text,
          ),
        ),
      ),
    );
  }
}
