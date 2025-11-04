import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CommonSpinner<T> extends StatelessWidget {
  const CommonSpinner({
    required this.items,
    required this.onSelected,
    this.height,
    this.initialItem,
    this.backgroundColor,
    this.itemExtent,
    this.textStyle,
    super.key,
  });

  final List<SpinnerItem<T>> items;
  final Function(int index) onSelected;
  final double? height;
  final int? initialItem;
  final Color? backgroundColor;
  final double? itemExtent;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 100.h,
      child: CupertinoPicker(
        backgroundColor: backgroundColor ?? AppColors.transparent,
        magnification: 1.1,
        squeeze: 1.2,
        useMagnifier: true,
        itemExtent: itemExtent ?? 32.h,
        scrollController: FixedExtentScrollController(
          initialItem: initialItem ?? 0,
        ),
        onSelectedItemChanged: onSelected,
        children: List.generate(items.length, (i) {
          return Center(
            child: Text(
              items[i].label,
              style:
                  textStyle ??
                  AppTextStyles.h5.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.text,
                  ),
            ),
          );
        }),
      ),
    );
  }
}

class SpinnerItem<T> {
  const SpinnerItem({required this.label, required this.item});

  final String label;
  final T item;
}
