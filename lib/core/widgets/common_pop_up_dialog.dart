import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'common_button.dart';
import 'common_gaps.dart';

Future<void> showCommonPopUpDialog(
  BuildContext context, {
  required String title,
  String? message,
  Widget? body,
  bool barrierDismissible = true,
  bool showSecondButton = true,
  String? firstButtonText,
  String? secondButtonText,
  VoidCallback? onFirstButtonPressed,
  VoidCallback? onSecondButtonPressed,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) {
      return CommonPopUpDialog(
        title: title,
        message: message,
        body: body,
        showSecondButton: showSecondButton,
        firstButtonText: firstButtonText,
        secondButtonText: secondButtonText,
        onFirstButtonPressed: onFirstButtonPressed,
        onSecondButtonPressed: onSecondButtonPressed,
      );
    },
  );
}

Future<void> showCommonErrorDialog(
  BuildContext context, {
  required String message,
  String? title,
}) async {
  return await showCommonPopUpDialog(
    context,
    title: title ?? AppConstants.error,
    message: message,
    showSecondButton: false,
    firstButtonText: AppConstants.close,
  );
}

class CommonPopUpDialog extends StatelessWidget {
  const CommonPopUpDialog({
    required this.title,
    this.message,
    this.body,
    this.showSecondButton = true,
    this.firstButtonText,
    this.secondButtonText,
    this.onFirstButtonPressed,
    this.onSecondButtonPressed,
    super.key,
  });

  final String title;
  final String? message;
  final Widget? body;
  final bool showSecondButton;
  final String? firstButtonText;
  final String? secondButtonText;
  final VoidCallback? onFirstButtonPressed;
  final VoidCallback? onSecondButtonPressed;

  @override
  Widget build(BuildContext context) {
    var dialogWidth = min<double>(0.86.sw, 400);

    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      elevation: 0,
      backgroundColor: AppColors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.white,
        ),
        width: dialogWidth,
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
              ),
              Gaps.vGap20,
              Container(
                width: 50.w,
                height: 2.h,
                decoration: BoxDecoration(
                  color: AppColors.mediumGray,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              Gaps.vGap20,
              if (message != null) ...[
                Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h4,
                ),
                Gaps.vGap20,
              ],
              if (body != null) ...[body!, Gaps.vGap20],
              Row(
                children: [
                  if (showSecondButton) ...[
                    Expanded(
                      child: CommonButton(
                        text: secondButtonText ?? AppConstants.cancel,
                        backgroundColor: AppColors.grayBlue,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 20.w,
                        ),
                        textStyle: AppTextStyles.h4,
                        onPressed: () {
                          context.pop();
                          onSecondButtonPressed?.call();
                        },
                      ),
                    ),
                    Gaps.hGap12,
                  ],
                  Expanded(
                    child: CommonButton(
                      text: firstButtonText ?? AppConstants.confirm,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.w,
                      ),
                      textStyle: AppTextStyles.h4.copyWith(
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        context.pop();
                        onFirstButtonPressed?.call();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
