import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    required this.hintText,
    required this.onChanged,
    this.controller,
    this.maxLength = 100,
    this.cursorColor,
    this.autoFocus = false,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.borderColor,
    this.borderFocusColor,
    this.backgroundColor,
    this.errorText,
    this.errorStyle,
    this.minLines = 1,
    this.inputTextStyle,
    this.hintStyle,
    this.enable,
    this.textInputAction,
    this.isShowBorder = false,
    this.obscureText = false,
    this.autoValidateMode,
    this.validator,
    this.inputFormatters,
    this.expands = false,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofillHints,
    this.suffix,
    this.borderWidth = 1.0,
    this.contentPadding,
    this.radius,
    this.initialValue,
    this.isShowPasswordIcon,
    super.key,
  });

  final bool autoFocus;
  final AutovalidateMode? autoValidateMode;
  final Iterable<String>? autofillHints;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? borderFocusColor;
  final Color? cursorColor;
  final TextEditingController? controller;
  final bool? enable;
  final TextStyle? errorStyle;
  final String? errorText;
  final bool expands;
  final TextStyle? hintStyle;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? inputTextStyle;
  final bool isShowBorder;
  final TextInputType? keyboardType;
  final int maxLength;
  final int? maxLines;
  final int? minLines;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final double borderWidth;
  final EdgeInsets? contentPadding;
  final double? radius;
  final String? initialValue;
  final bool? isShowPasswordIcon;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late final TextEditingController _controller;
  late final BorderRadius _borderRadius;

  late bool _passwordVisible;
  late bool _isShowPasswordIcon;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.initialValue ?? '';
    _borderRadius = BorderRadius.circular(widget.radius ?? 30.r);
    _isShowPasswordIcon = widget.isShowPasswordIcon ?? false;
    _passwordVisible = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: widget.expands,
      autofillHints: widget.autofillHints,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      style:
          widget.inputTextStyle ??
          AppTextStyles.h4.copyWith(
            color: AppColors.text,
            fontWeight: FontWeight.w700,
          ),
      maxLength: widget.maxLength,
      autofocus: widget.autoFocus,
      enabled: widget.enable ?? true,
      controller: _controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      cursorColor: widget.cursorColor ?? AppColors.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.backgroundColor ?? AppColors.white,
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        hintStyle:
            widget.hintStyle ??
            AppTextStyles.h4.copyWith(
              color: AppColors.mediumGray,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
            ),
        isDense: false,
        hintText: widget.hintText,
        errorText: widget.errorText,
        errorStyle:
            widget.errorStyle ??
            AppTextStyles.h4.copyWith(color: AppColors.error, height: 1.8),
        errorMaxLines: 3,
        prefixIcon: (widget.prefix != null)
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                child: widget.prefix,
              )
            : null,
        counterText: '',
        focusedErrorBorder: OutlineInputBorder(
          borderSide: widget.isShowBorder
              ? BorderSide(color: AppColors.error, width: widget.borderWidth)
              : BorderSide.none,
          borderRadius: _borderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: widget.isShowBorder
              ? BorderSide(
                  color: widget.borderFocusColor ?? AppColors.error,
                  width: widget.borderWidth,
                )
              : BorderSide.none,
          borderRadius: _borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: widget.isShowBorder
              ? BorderSide(
                  color: widget.borderColor ?? AppColors.error,
                  width: widget.borderWidth,
                )
              : BorderSide.none,
          borderRadius: _borderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: widget.isShowBorder
              ? BorderSide(color: AppColors.error, width: widget.borderWidth)
              : BorderSide.none,
          borderRadius: _borderRadius,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: widget.isShowBorder
              ? BorderSide(
                  color: AppColors.mediumGray,
                  width: widget.borderWidth,
                )
              : BorderSide.none,
          borderRadius: _borderRadius,
        ),
        suffixIcon: _isShowPasswordIcon
            ? IconButton(
                splashColor: Colors.transparent,
                icon: _passwordVisible
                    ? Icon(
                        Icons.visibility_outlined,
                        color: AppColors.mediumGray,
                        size: 20.r,
                      )
                    : Icon(
                        Icons.visibility_off_outlined,
                        color: AppColors.mediumGray,
                        size: 20.r,
                      ),
                onPressed: () =>
                    setState(() => _passwordVisible = !_passwordVisible),
              )
            : (widget.suffix != null)
            ? Padding(padding: EdgeInsets.all(15.r), child: widget.suffix)
            : null,
      ),
      obscureText: widget.obscureText ? !_passwordVisible : widget.obscureText,
      validator: widget.validator,
      autovalidateMode: widget.autoValidateMode,
      onChanged: (value) {
        setState(() {
          _isShowPasswordIcon = value.isEmpty ? false : widget.obscureText;
        });

        widget.onChanged.call(value);
      },
    );
  }
}
