import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/user.dart';

class AvatarPlaceholder extends StatelessWidget {
  const AvatarPlaceholder({super.key, required this.user, this.containerSize});

  final User? user;
  final double? containerSize;

  String _getInitial() {
    if (user == null) return '?';

    // Try to get first character from fullName
    if (user!.fullName.isNotEmpty) {
      return user!.fullName.trim()[0].toUpperCase();
    }

    // Fallback to email
    if (user!.email.isNotEmpty) {
      return user!.email.trim()[0].toUpperCase();
    }

    return '?';
  }

  @override
  Widget build(BuildContext context) {
    final initial = _getInitial();

    return Container(
      width: containerSize ?? 60.r,
      height: containerSize ?? 60.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.backgroundGradient,
      ),
      child: Center(
        child: Text(
          initial,
          style: AppTextStyles.h1.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
