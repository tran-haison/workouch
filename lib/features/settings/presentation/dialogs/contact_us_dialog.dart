import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_bottom_dialog.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../gen/assets.gen.dart';

Future<void> showContactUsDialog(BuildContext context) async {
  return await showCommonBottomDialog(context, child: const _ContactUsDialog());
}

class _ContactUsDialog extends StatelessWidget {
  const _ContactUsDialog();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.contactUs,
          style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
        ),
        Gaps.vGap24,
        _ContactItem(
          icon: Assets.icons.email,
          title: AppConstants.email,
          value: AppConstants.contactEmailAddress,
          onTap: () => _openEmail(context),
        ),
        Gaps.vGap16,
        _ContactItem(
          icon: Assets.icons.website,
          title: AppConstants.website,
          value: AppConstants.url.website,
          onTap: () => _openWebsite(context),
        ),
        Gaps.vGap16,
        _ContactItem(
          icon: Assets.icons.feedback,
          title: AppConstants.feedback,
          value: AppConstants.feedbackDescription,
          onTap: () => _openFeedback(context),
        ),
        Gaps.vGap24,
        _InfoSection(
          title: AppConstants.responseTime,
          description: AppConstants.responseTimeDescription,
        ),
        Gaps.vGap16,
        _InfoSection(
          title: AppConstants.workingHours,
          description: AppConstants.workingHoursDescription,
        ),
        Gaps.vGap24,
      ],
    );
  }

  Future<void> _openEmail(BuildContext context) async {
    try {
      final url = Uri.parse(AppConstants.url.contactEmail);
      await launchUrl(url);
    } catch (e) {
      if (context.mounted) {
        showCommonToast(AppConstants.commonError, isError: true);
      }
    }
  }

  Future<void> _openWebsite(BuildContext context) async {
    try {
      final url = Uri.parse(AppConstants.url.website);
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (context.mounted) {
        showCommonToast(AppConstants.commonError, isError: true);
      }
    }
  }

  Future<void> _openFeedback(BuildContext context) async {
    try {
      final url = Uri.parse(AppConstants.url.pageFeedback);
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (context.mounted) {
        showCommonToast(AppConstants.commonError, isError: true);
      }
    }
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  final SvgGenImage icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayBlue, width: 1.r),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.grayBlue,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CommonAssetIcon(
                icon,
                width: 20.r,
                height: 20.r,
                color: AppColors.black,
              ),
            ),
            Gaps.hGap16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.h5.copyWith(
                      color: AppColors.mediumGray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gaps.vGap4,
                  Text(
                    value,
                    style: AppTextStyles.h4.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            CommonAssetIcon(
              Assets.icons.arrowTopRight,
              width: 16.r,
              height: 16.r,
              color: AppColors.mediumGray,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h5.copyWith(
            color: AppColors.mediumGray,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gaps.vGap8,
        Text(description, style: AppTextStyles.h4.copyWith(height: 1.5)),
      ],
    );
  }
}
