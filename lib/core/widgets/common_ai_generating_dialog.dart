import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../gen/assets.gen.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'common_gaps.dart';

bool _isDialogVisible = false;

class CommonAiGeneratingDialog extends StatefulWidget {
  const CommonAiGeneratingDialog({required this.message, super.key});

  final String message;

  @override
  State<CommonAiGeneratingDialog> createState() =>
      _CommonAiGeneratingDialogState();
}

class _CommonAiGeneratingDialogState extends State<CommonAiGeneratingDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                width: 100.r,
                height: 100.r,
                child: Lottie.asset(
                  Assets.animations.wave,
                  fit: BoxFit.contain,
                  repeat: true,
                ),
              ),
              Gaps.vGap16,
              Text(
                widget.message,
                style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Extension to show AI workout generation dialog easily
extension BuildContextExt on BuildContext {
  void showCommonAiGeneratingDialog({
    String message = AppConstants.buildingWorkout,
    bool barrierDismissible = false,
  }) {
    if (_isDialogVisible) {
      return;
    }
    _isDialogVisible = true;

    showDialog(
      context: this,
      barrierDismissible: barrierDismissible,
      barrierColor: AppColors.white.withValues(alpha: 0.6),
      builder: (context) => CommonAiGeneratingDialog(message: message),
    );
  }

  void hideCommonAiGeneratingDialog() {
    if (!_isDialogVisible) {
      return;
    }
    _isDialogVisible = false;

    Navigator.of(this).pop();
  }
}
