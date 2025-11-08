import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_bottom_dialog.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_dismissible.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/working_exercise.dart';
import '../cubit/exercise_cubit.dart';
import '../cubit/exercise_state.dart';
import '../widgets/exercise_card_item.dart';
import 'exercise_details_dialog.dart';

Future<void> showExerciseSelectedListDialog(BuildContext context) async {
  return await showCommonBottomDialog(
    context,
    child: BlocProvider.value(
      value: context.read<ExerciseCubit>(),
      child: const _ExerciseSelectedListDialog(),
    ),
  );
}

class _ExerciseSelectedListDialog extends StatelessWidget {
  const _ExerciseSelectedListDialog();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseCubit, ExerciseState>(
      builder: (context, state) {
        final exercises = state.selectedExercises;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${exercises.length} ${AppConstants.exercises.toLowerCase()}',
                        style: AppTextStyles.h3,
                      ),
                      Text(
                        AppConstants.dragToReorder,
                        style: AppTextStyles.h5.copyWith(
                          color: AppColors.mediumGray,
                        ),
                      ),
                    ],
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
            Gaps.vGap20,
            Flexible(
              child: ReorderableListView.builder(
                shrinkWrap: true,
                proxyDecorator: (child, index, animation) => child,
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final exercise = exercises[index];
                  return _SelectedExerciseItem(
                    key: ValueKey(exercise.exerciseId),
                    workingExercise: exercise,
                    onTap: () => _onSelectExercise(context, exercise),
                    onRemove: () => _onRemoveExercise(context, exercise),
                  );
                },
                onReorder: (oldIndex, newIndex) =>
                    _onReorderExercises(context, oldIndex, newIndex),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _onSelectExercise(
    BuildContext context,
    WorkingExercise workingExercise,
  ) async {
    final cubit = context.read<ExerciseCubit>();
    final res = await ExerciseDetailsDialog.showToEdit(
      context,
      workingExercise: workingExercise,
    );

    if (!context.mounted) return;

    if (res is WorkingExercise) {
      // Update exercise
      cubit.selectExercise(res);
      return;
    }

    if (res is String) {
      // Delete exercise (res is the exerciseId)
      cubit.removeExercise(res);
    }
  }

  void _onRemoveExercise(
    BuildContext context,
    WorkingExercise workingExercise,
  ) {
    context.read<ExerciseCubit>().removeExercise(workingExercise.exerciseId);

    // Close dialog if no exercises left
    if (context.mounted) {
      final remainingCount = context
          .read<ExerciseCubit>()
          .state
          .selectedExercises
          .length;
      if (remainingCount == 0) {
        context.pop();
      }
    }
  }

  void _onReorderExercises(BuildContext context, int oldIndex, int newIndex) {
    context.read<ExerciseCubit>().reorderExercise(oldIndex, newIndex);
  }
}

class _SelectedExerciseItem extends StatelessWidget {
  const _SelectedExerciseItem({
    required this.workingExercise,
    required this.onTap,
    required this.onRemove,
    super.key,
  });

  final WorkingExercise workingExercise;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return CommonDismissible(
      id: workingExercise.exerciseId,
      onDismissed: onRemove,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: Row(
            children: [
              Expanded(
                child: ExerciseCardItem(
                  exercise: workingExercise.toExercise(),
                  noPadding: true,
                ),
              ),
              Gaps.hGap12,
              CommonAssetIcon(
                Assets.icons.reorder,
                width: 20.r,
                height: 20.r,
                color: AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
