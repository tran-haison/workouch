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
import '../../domain/entities/exercise_filter.dart';

Future<dynamic> showExerciseFilterDialog(
  BuildContext context, {
  required List<String> muscles,
  required List<String> equipments,
  required ExerciseFilter initialFilter,
}) async {
  return await showCommonBottomDialog(
    context,
    child: _ExerciseFilterDialog(
      muscles: muscles,
      equipments: equipments,
      initialFilter: initialFilter,
    ),
  );
}

Future<dynamic> _showOptionListDialog(
  BuildContext context, {
  required List<String> items,
  required String title,
  required String any,
  required String initialValue,
}) async {
  return await showCommonBottomDialog(
    context,
    child: _OptionListDialog(
      items: items,
      title: title,
      any: any,
      initialValue: initialValue,
    ),
  );
}

class _ExerciseFilterDialog extends StatefulWidget {
  const _ExerciseFilterDialog({
    required this.muscles,
    required this.equipments,
    required this.initialFilter,
  });

  final List<String> muscles;
  final List<String> equipments;
  final ExerciseFilter initialFilter;

  @override
  State<_ExerciseFilterDialog> createState() => _ExerciseFilterDialogState();
}

class _ExerciseFilterDialogState extends State<_ExerciseFilterDialog> {
  late var _filter = widget.initialFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonAssetIcon(
              Assets.icons.filter,
              color: AppColors.black,
              width: 20.r,
              height: 20.r,
            ),
            Gaps.hGap10,
            Flexible(
              child: Text(AppConstants.exerciseFilter, style: AppTextStyles.h3),
            ),
          ],
        ),
        Gaps.vGap20,
        Text(AppConstants.muscle, style: AppTextStyles.h4),
        Gaps.vGap10,
        InkWell(
          onTap: _showMusclesListDialog,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.grayBlue,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _filter.muscle.isNotEmpty
                        ? _filter.muscle
                        : AppConstants.anyMuscle,
                    style: AppTextStyles.h5,
                  ),
                ),
                Gaps.hGap16,
                CommonAssetIcon(
                  Assets.icons.arrowDown,
                  color: AppColors.black,
                  width: 20.r,
                  height: 20.r,
                ),
              ],
            ),
          ),
        ),
        Gaps.vGap20,
        Text(AppConstants.equipment, style: AppTextStyles.h4),
        Gaps.vGap10,
        InkWell(
          onTap: _showEquipmentsListDialog,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.grayBlue,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _filter.equipment.isNotEmpty
                        ? _filter.equipment
                        : AppConstants.anyEquipment,
                    style: AppTextStyles.h5,
                  ),
                ),
                Gaps.hGap16,
                CommonAssetIcon(
                  Assets.icons.arrowDown,
                  color: AppColors.black,
                  width: 20.r,
                  height: 20.r,
                ),
              ],
            ),
          ),
        ),
        Gaps.vGap30,
        CommonButton(
          text: AppConstants.confirm,
          textStyle: AppTextStyles.h4.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
          onPressed: () => context.pop(_filter),
        ),
      ],
    );
  }

  Future<void> _showMusclesListDialog() async {
    final muscle = await _showOptionListDialog(
      context,
      items: widget.muscles,
      title: AppConstants.muscle,
      any: AppConstants.anyMuscle,
      initialValue: _filter.muscle.isNotEmpty
          ? _filter.muscle
          : AppConstants.anyMuscle,
    );

    if (!mounted || muscle == null) return;

    if (muscle is String) {
      setState(() {
        _filter = _filter.copyWith(
          muscle: muscle == AppConstants.anyMuscle ? '' : muscle,
        );
      });
    }
  }

  Future<void> _showEquipmentsListDialog() async {
    final equipment = await _showOptionListDialog(
      context,
      items: widget.equipments,
      title: AppConstants.equipment,
      any: AppConstants.anyEquipment,
      initialValue: _filter.equipment.isNotEmpty
          ? _filter.equipment
          : AppConstants.anyEquipment,
    );

    if (!mounted || equipment == null) return;

    if (equipment is String) {
      setState(() {
        _filter = _filter.copyWith(
          equipment: equipment == AppConstants.anyEquipment ? '' : equipment,
        );
      });
    }
  }
}

class _OptionListDialog extends StatelessWidget {
  const _OptionListDialog({
    required this.items,
    required this.title,
    required this.any,
    required this.initialValue,
  });

  final List<String> items;
  final String title;
  final String any;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.h3),
        Gaps.vGap16,
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: items.length + 1, // +1 for "any item"
            itemBuilder: (context, index) {
              if (index == 0) {
                // "Any" item
                return _buildItemTile(
                  context,
                  item: any,
                  isSelected: initialValue == any,
                );
              } else {
                // Other items
                return _buildItemTile(
                  context,
                  item: items[index - 1],
                  isSelected: initialValue == items[index - 1],
                );
              }
            },
            separatorBuilder: (_, _) => Gaps.vGap12,
          ),
        ),
      ],
    );
  }

  Widget _buildItemTile(
    BuildContext context, {
    required String item,
    bool isSelected = false,
  }) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(item),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.grayBlue,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item,
                style: AppTextStyles.h4.copyWith(
                  color: isSelected ? AppColors.white : AppColors.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
