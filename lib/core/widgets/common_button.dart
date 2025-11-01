import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'common_gaps.dart';
import 'common_icons.dart';

class CommonButton extends StatefulWidget {
  const CommonButton({
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
    this.alignCenter = true,
    this.isFullWidth = true,
    this.formKey,
    this.backgroundColor,
    this.textStyle,
    this.padding,
    this.radius,
    this.leading,
    this.trailing,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isDisabled;
  final bool alignCenter;
  final bool isFullWidth;
  final GlobalKey<FormState>? formKey;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Widget? leading;
  final Widget? trailing;

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.90,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        if (!widget.isDisabled) {
          _controller.forward();
        }
      },
      onTapUp: (_) {
        if (!widget.isDisabled) {
          _controller.reverse();
          if (widget.formKey != null) {
            final currentState = widget.formKey!.currentState;
            if (currentState == null || !currentState.validate()) {
              return;
            }
          }
          widget.onPressed();
        }
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius ?? 30.r),
            color: widget.backgroundColor ?? AppColors.primary,
          ),
          child: ElevatedButton(
            onPressed: widget.isDisabled
                ? null
                : () {
                    if (widget.formKey != null) {
                      final currentState = widget.formKey!.currentState;
                      if (currentState == null || !currentState.validate()) {
                        return;
                      }
                    }
                    widget.onPressed();
                  },
            style: ButtonStyle(
              elevation: WidgetStateProperty.resolveWith((states) => 0),
              backgroundColor: WidgetStateProperty.resolveWith(
                (states) => AppColors.transparent,
              ),
              overlayColor: WidgetStateProperty.resolveWith(
                (states) => states.contains(WidgetState.pressed)
                    ? AppColors.overlay
                    : null,
              ),
              shadowColor: WidgetStateProperty.resolveWith(
                (states) => AppColors.transparent,
              ),
              padding: WidgetStateProperty.resolveWith(
                (states) =>
                    widget.padding ??
                    EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
              ),
              shape: WidgetStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.radius ?? 30.r),
                ),
              ),
            ),
            child: Row(
              mainAxisSize: widget.isFullWidth
                  ? MainAxisSize.max
                  : MainAxisSize.min,
              mainAxisAlignment: widget.alignCenter
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                if (widget.leading != null) ...[widget.leading!, Gaps.hGap12],
                Flexible(
                  child: Text(
                    widget.title,
                    style:
                        widget.textStyle ??
                        AppTextStyles.h3.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (widget.trailing != null) ...[Gaps.hGap12, widget.trailing!],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommonIconButton extends StatefulWidget {
  const CommonIconButton({
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,
    this.padding,
    this.radius,
    this.borderColor,
    super.key,
  });

  final SvgGenImage icon;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? iconSize;
  final EdgeInsets? padding;
  final double? radius;
  final Color? borderColor;

  @override
  State<CommonIconButton> createState() => _CommonIconButtonState();
}

class _CommonIconButtonState extends State<CommonIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.90,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.radius ?? 10.r;

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: widget.borderColor != null
                ? Border.all(color: widget.borderColor!)
                : null,
          ),
          child: Padding(
            padding: widget.padding ?? EdgeInsets.all(12.r),
            child: CommonAssetIcon(
              widget.icon,
              width: widget.iconSize,
              height: widget.iconSize,
              color: widget.iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
