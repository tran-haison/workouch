import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/extension/string_extension.dart';
import '../../gen/assets.gen.dart';
import '../theme/app_colors.dart';
import '../utils/log.dart';
import 'common_icons.dart';

class CommonLocalImage extends StatelessWidget {
  const CommonLocalImage({required this.image, this.errorIconSize, super.key});

  final String image;
  final double? errorIconSize;

  @override
  Widget build(BuildContext context) {
    try {
      final file = File(image);
      if (!file.existsSync()) {
        return const _ErrorImagePlaceholder();
      }
      return Image.file(
        file,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const _ErrorImagePlaceholder();
        },
      );
    } catch (e) {
      Log.e('Error loading image: $e');
      return const _ErrorImagePlaceholder();
    }
  }
}

class _ErrorImagePlaceholder extends StatelessWidget {
  const _ErrorImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mediumGray,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Icon(Icons.broken_image, color: AppColors.text, size: 16.r),
    );
  }
}

class CommonNetworkImage extends StatelessWidget {
  const CommonNetworkImage({
    required this.url,
    this.height,
    this.width,
    this.backgroundColor,
    this.fit,
    this.radius,
    this.errorWidget,
    this.placeholderWidget,
    super.key,
  });

  final String url;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final BoxFit? fit;
  final double? radius;
  final Widget? errorWidget;
  final Widget? placeholderWidget;

  @override
  Widget build(BuildContext context) {
    // If URL is empty or invalid, show error widget immediately
    if (url.isEmpty || !url.isValidUrl) {
      return errorWidget ??
          _ErrorImage(
            width: width ?? 50.r,
            height: height ?? 50.r,
            radius: radius ?? 25.r,
          );
    }

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: CachedNetworkImage(
          imageUrl: url,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          placeholder: placeholderWidget != null
              ? (context, url) => placeholderWidget!
              : null,
          errorWidget: (context, url, error) {
            return errorWidget ??
                _ErrorImage(
                  width: width ?? 0,
                  height: height ?? 0,
                  radius: radius ?? 0,
                );
          },
        ),
      ),
    );
  }
}

class _ErrorImage extends StatelessWidget {
  const _ErrorImage({
    required this.width,
    required this.height,
    required this.radius,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: AppColors.backgroundLight,
      ),
      child: Center(
        child: CommonAssetIcon(Assets.icons.error, color: AppColors.white),
      ),
    );
  }
}
