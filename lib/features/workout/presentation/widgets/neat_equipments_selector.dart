import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../core/widgets/common_multi_select_option_dialog.dart';

class NeatEquipmentsSelector extends StatefulWidget {
  const NeatEquipmentsSelector({
    super.key,
    required this.initialEquipments,
    required this.equipments,
    required this.onChanged,
  });

  final List<String> initialEquipments;
  final List<String> equipments;
  final ValueChanged<List<String>> onChanged;

  @override
  State<NeatEquipmentsSelector> createState() => _NeatEquipmentsSelectorState();
}

class _NeatEquipmentsSelectorState extends State<NeatEquipmentsSelector> {
  late List<String> _currentEquipments;

  @override
  void initState() {
    super.initState();
    _currentEquipments = List.from(widget.initialEquipments);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleEquipmentsSelection,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.grayBlue, width: 1.r),
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
            if (_currentEquipments.isNotEmpty) ...[
              Gaps.vGap8,
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: _currentEquipments.map((equipment) {
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
                      equipment,
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
    if (_currentEquipments.isEmpty) {
      return AppConstants.selectEquipments;
    }
    return AppConstants.availableEquipments;
  }

  Future<void> _handleEquipmentsSelection() async {
    if (widget.equipments.isEmpty) {
      showCommonToast(AppConstants.commonError, isError: true);
      return;
    }

    final selected = await showCommonMultiSelectOptionDialog<String>(
      context,
      optionItems: widget.equipments
          .map((equipment) => OptionItem(label: equipment, value: equipment))
          .toList(),
      title: AppConstants.selectEquipments,
      initialSelected: List.from(_currentEquipments),
    );

    if (mounted && selected is List<String>) {
      setState(() {
        _currentEquipments = selected;
      });
      widget.onChanged(_currentEquipments);
    }
  }
}
