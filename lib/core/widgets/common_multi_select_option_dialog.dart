import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'common_bottom_dialog.dart';
import 'common_button.dart';
import 'common_gaps.dart';
import 'common_icons.dart';
import '../../gen/assets.gen.dart';

Future<dynamic> showCommonMultiSelectOptionDialog<T>(
  BuildContext context, {
  required String title,
  required List<OptionItem<T>> optionItems,
  required List<T> initialSelected,
}) async {
  return await showCommonBottomDialog(
    context,
    child: _CommonMultiSelectOptionDialog<T>(
      title: title,
      optionItems: optionItems,
      initialSelected: initialSelected,
    ),
  );
}

class _CommonMultiSelectOptionDialog<T> extends StatefulWidget {
  const _CommonMultiSelectOptionDialog({
    required this.title,
    required this.optionItems,
    required this.initialSelected,
  });

  final String title;
  final List<OptionItem<T>> optionItems;
  final List<T> initialSelected;

  @override
  State<_CommonMultiSelectOptionDialog<T>> createState() =>
      _CommonMultiSelectOptionDialogState();
}

class _CommonMultiSelectOptionDialogState<T>
    extends State<_CommonMultiSelectOptionDialog<T>> {
  late List<T> _selectedItems;

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
            Expanded(
              child: Text(
                widget.title,
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
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: widget.optionItems.length,
            itemBuilder: (context, index) {
              final item = widget.optionItems[index];
              final isSelected = _selectedItems.contains(item.value);

              return _ItemTile<T>(
                optionItem: item,
                isSelected: isSelected,
                onTap: () => _toggleItem(item.value),
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

  void _toggleItem(T item) {
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

class _ItemTile<T> extends StatelessWidget {
  const _ItemTile({
    required this.optionItem,
    required this.isSelected,
    required this.onTap,
  });

  final OptionItem<T> optionItem;
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
            Expanded(child: Text(optionItem.label, style: AppTextStyles.h4)),
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

class OptionItem<T> {
  const OptionItem({required this.label, required this.value});

  final String label;
  final T value;
}
