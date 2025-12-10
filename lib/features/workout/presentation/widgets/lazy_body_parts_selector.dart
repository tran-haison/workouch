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

class LazyBodyPartsSelector extends StatefulWidget {
  const LazyBodyPartsSelector({
    super.key,
    required this.initialBodyParts,
    required this.bodyParts,
    required this.onChanged,
  });

  final List<String> initialBodyParts;
  final List<String> bodyParts;
  final ValueChanged<List<String>> onChanged;

  @override
  State<LazyBodyPartsSelector> createState() => _LazyBodyPartsSelectorState();
}

class _LazyBodyPartsSelectorState extends State<LazyBodyPartsSelector> {
  late List<String> _currentBodyParts;

  @override
  void initState() {
    super.initState();
    _currentBodyParts = List.from(widget.initialBodyParts);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleBodyPartsSelection,
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
            if (_currentBodyParts.isNotEmpty) ...[
              Gaps.vGap8,
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: _currentBodyParts.map((bodyPart) {
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
                      bodyPart,
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
    if (_currentBodyParts.isEmpty) {
      return AppConstants.selectBodyParts;
    }
    return AppConstants.bodyParts;
  }

  Future<void> _handleBodyPartsSelection() async {
    if (widget.bodyParts.isEmpty) {
      showCommonToast(AppConstants.commonError, isError: true);
      return;
    }

    final selected = await showCommonMultiSelectOptionDialog<String>(
      context,
      optionItems: widget.bodyParts
          .map((bodyPart) => OptionItem(label: bodyPart, value: bodyPart))
          .toList(),
      title: AppConstants.selectBodyParts,
      initialSelected: List.from(_currentBodyParts),
    );

    if (mounted && selected is List<String>) {
      setState(() {
        _currentBodyParts = selected;
      });
      widget.onChanged(_currentBodyParts);
    }
  }
}
