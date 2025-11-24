import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/common_icons.dart';
import '../../../gen/assets.gen.dart';
import 'common_gaps.dart';

bool _isLoadingDialogVisible = false;

class CommonLoadingDialog extends StatefulWidget {
  const CommonLoadingDialog({required this.message, super.key});

  final String message;

  @override
  State<CommonLoadingDialog> createState() => _CommonLoadingDialogState();
}

class _CommonLoadingDialogState extends State<CommonLoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonAnimatedLoadingIcon(),
          Gaps.vGap16,
          Text(
            widget.message,
            style: AppTextStyles.h3.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CommonAnimatedLoadingIcon extends StatefulWidget {
  const CommonAnimatedLoadingIcon({this.color, super.key});

  final Color? color;

  @override
  State<CommonAnimatedLoadingIcon> createState() =>
      _CommonAnimatedLoadingIconState();
}

class _CommonAnimatedLoadingIconState extends State<CommonAnimatedLoadingIcon>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.linear),
    );
    _rotationController.repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotationAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotationAnimation.value * 2 * math.pi,
          child: Center(
            child: CommonAssetIcon(
              Assets.icons.loading,
              width: 48.r,
              height: 48.r,
              color: widget.color ?? AppColors.white,
            ),
          ),
        );
      },
    );
  }
}

// Extension to show loading dialog easily
extension LoadingDialogExtension on BuildContext {
  void showLoadingDialog({
    String message = AppConstants.loading,
    bool barrierDismissible = false,
  }) {
    if (_isLoadingDialogVisible) {
      return;
    }
    _isLoadingDialogVisible = true;

    showDialog(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (context) => CommonLoadingDialog(message: message),
    );
  }

  void hideLoadingDialog() {
    if (!_isLoadingDialogVisible) {
      return;
    }
    _isLoadingDialogVisible = false;

    Navigator.of(this).pop();
  }
}
