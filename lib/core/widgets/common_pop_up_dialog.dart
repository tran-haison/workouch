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
  required VoidCallback onConfirmed,
  String? message,
  Widget? body,
  bool barrierDismissible = true,
  bool showSecondButton = true,
  String? firstButtonText,
  String? secondButtonText,
  Function()? secondButtonCallback,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) {
      return CommonPopUpDialog(
        title: title,
        message: message,
        body: body,
        onConfirmed: onConfirmed,
        showSecondButton: showSecondButton,
        firstButtonText: firstButtonText,
        secondButtonText: secondButtonText,
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
    onConfirmed: () {},
    showSecondButton: false,
    firstButtonText: AppConstants.close,
  );
}

class CommonPopUpDialog extends StatelessWidget {
  const CommonPopUpDialog({
    required this.title,
    required this.onConfirmed,
    this.message,
    this.body,
    this.showSecondButton = true,
    this.firstButtonText,
    this.secondButtonText,
    super.key,
  });

  final String title;
  final String? message;
  final Widget? body;
  final VoidCallback onConfirmed;
  final bool showSecondButton;
  final String? firstButtonText;
  final String? secondButtonText;

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
                style: AppTextStyles.h3.copyWith(
                  color: AppColors.text,
                  fontWeight: FontWeight.w600,
                ),
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
                  style: AppTextStyles.h4.copyWith(color: AppColors.text),
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
                        backgroundColor: AppColors.grayBlue.withValues(
                          alpha: 0.25,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 20.w,
                        ),
                        textStyle: AppTextStyles.h4.copyWith(
                          color: AppColors.text,
                          fontWeight: FontWeight.w500,
                        ),
                        onPressed: () {
                          context.pop();
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
                        color: AppColors.text,
                        fontWeight: FontWeight.w500,
                      ),
                      onPressed: () {
                        context.pop();
                        onConfirmed();
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
