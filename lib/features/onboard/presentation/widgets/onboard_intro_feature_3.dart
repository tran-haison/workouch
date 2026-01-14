import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../gen/assets.gen.dart';

class OnboardIntroFeature3 extends StatelessWidget {
  const OnboardIntroFeature3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _TestimonialItem(
          avatarPath: Assets.images.imgTestimonial1.path,
          userName: AppConstants.onboardTestimonial1UserName,
          feedback: AppConstants.onboardTestimonial1Feedback,
        ),
        Gaps.vGap12,
        _TestimonialItem(
          avatarPath: Assets.images.imgTestimonial2.path,
          userName: AppConstants.onboardTestimonial2UserName,
          feedback: AppConstants.onboardTestimonial2Feedback,
        ),
        Gaps.vGap12,
        _TestimonialItem(
          avatarPath: Assets.images.imgTestimonial3.path,
          userName: AppConstants.onboardTestimonial3UserName,
          feedback: AppConstants.onboardTestimonial3Feedback,
        ),
      ],
    );
  }
}

class _TestimonialItem extends StatelessWidget {
  const _TestimonialItem({
    required this.avatarPath,
    required this.userName,
    required this.feedback,
  });

  final String avatarPath;
  final String userName;
  final String feedback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grayBlue, width: 1.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          ClipOval(
            child: Image.asset(
              avatarPath,
              width: 50.r,
              height: 50.r,
              fit: BoxFit.cover,
            ),
          ),
          Gaps.hGap12,
          // User name and feedback
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
                ),
                Gaps.vGap4,
                Text(
                  feedback,
                  style: AppTextStyles.h5.copyWith(
                    color: AppColors.mediumGray,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
