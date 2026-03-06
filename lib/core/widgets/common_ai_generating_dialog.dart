import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../gen/assets.gen.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'common_gaps.dart';

bool _isDialogVisible = false;

class CommonAiGeneratingDialog extends StatefulWidget {
  const CommonAiGeneratingDialog({super.key});

  @override
  State<CommonAiGeneratingDialog> createState() =>
      _CommonAiGeneratingDialogState();
}

class _CommonAiGeneratingDialogState extends State<CommonAiGeneratingDialog> {
  late Timer _messageTimer;
  int _currentMessageIndex = 0;

  @override
  void initState() {
    super.initState();
    // Start cycling through messages
    _messageTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (!mounted) return;

      // Stop updating when we reach the last message
      if (_currentMessageIndex >=
          AppConstants.aiGenerationMessages.length - 1) {
        _messageTimer.cancel();
        return;
      }

      setState(() {
        _currentMessageIndex++;
      });
    });
  }

  @override
  void dispose() {
    _messageTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentMessage =
        AppConstants.aiGenerationMessages[_currentMessageIndex];

    return Dialog(
      backgroundColor: AppColors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.grayBlue,
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, 0.2),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                  child: Text(
                    currentMessage,
                    key: ValueKey<String>(currentMessage),
                    style: AppTextStyles.h3.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Extension to show AI workout generation dialog easily
extension BuildContextExt on BuildContext {
  void showCommonAiGeneratingDialog({bool barrierDismissible = false}) {
    if (_isDialogVisible) {
      return;
    }
    _isDialogVisible = true;

    showDialog(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (context) => const CommonAiGeneratingDialog(),
    );
  }

  void hideCommonAiGeneratingDialog() {
    if (!_isDialogVisible) {
      return;
    }
    _isDialogVisible = false;

    pop();
  }
}
