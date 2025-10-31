import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../theme/app_colors.dart';

class CommonAssetIcon extends StatelessWidget {
  const CommonAssetIcon(
    this.icon, {
    this.height,
    this.width,
    this.color,
    this.useDefaultColor = false,
    super.key,
  });

  final SvgGenImage icon;
  final bool useDefaultColor;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return icon.svg(
      height: height ?? 24.r,
      width: width ?? 24.r,
      colorFilter: useDefaultColor
          ? null
          : ColorFilter.mode(color ?? AppColors.white, BlendMode.srcIn),
    );
  }
}
