import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import 'common_gaps.dart';

Future<void> showCommonBottomDialog(
  BuildContext context, {
  required Widget child,
}) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    useSafeArea: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
    ),
    builder: (context) {
      return CommonBottomDialog(child: child);
    },
  );
}

class CommonBottomDialog extends StatelessWidget {
  const CommonBottomDialog({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            Gaps.vGap16,
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}
