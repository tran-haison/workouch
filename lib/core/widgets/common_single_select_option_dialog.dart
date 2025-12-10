import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'common_bottom_dialog.dart';
import 'common_button.dart';
import 'common_gaps.dart';
import 'common_icons.dart';

Future<dynamic> showCommonSingleSelectOptionDialog(
  BuildContext context, {
  required List<String> items,
  required String title,
  required String any,
  required String initialValue,
}) async {
  return await showCommonBottomDialog(
    context,
    child: _CommonSingleSelectOptionDialog(
      items: items,
      title: title,
      any: any,
      initialValue: initialValue,
    ),
  );
}

class _CommonSingleSelectOptionDialog extends StatelessWidget {
  const _CommonSingleSelectOptionDialog({
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
        Row(
          children: [
            Expanded(
              child: Text(
                title,
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
            itemCount: items.length + 1, // +1 for "any item"
            itemBuilder: (context, index) {
              if (index == 0) {
                // "Any" item
                return _ItemTile(item: any, isSelected: initialValue == any);
              } else {
                // Other items
                return _ItemTile(
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
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({required this.item, required this.isSelected});

  final String item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(item),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary : AppColors.transparent,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.secondary : AppColors.grayBlue,
            width: 1.r,
          ),
        ),
        child: Row(
          children: [
            Expanded(child: Text(item, style: AppTextStyles.h4)),
            if (isSelected)
              CommonAssetIcon(
                Assets.icons.check,
                width: 20.r,
                height: 20.r,
                color: AppColors.black,
              ),
          ],
        ),
      ),
    );
  }
}
