import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';

class MultiSelectOptionListDialog extends StatefulWidget {
  const MultiSelectOptionListDialog({
    super.key,
    required this.items,
    required this.title,
    required this.initialSelected,
  });

  final List<String> items;
  final String title;
  final List<String> initialSelected;

  @override
  State<MultiSelectOptionListDialog> createState() =>
      _MultiSelectOptionListDialogState();
}

class _MultiSelectOptionListDialogState
    extends State<MultiSelectOptionListDialog> {
  late List<String> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(widget.title, style: AppTextStyles.h3)),
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
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              final isSelected = _selectedItems.contains(item);

              return _ItemTile(
                item: item,
                isSelected: isSelected,
                onTap: () => _toggleItem(item),
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

  void _toggleItem(String item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
    });
  }

  void _onConfirm() {
    context.pop(_selectedItems);
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final String item;
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
                item,
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
