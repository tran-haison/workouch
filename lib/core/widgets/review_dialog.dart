import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_constants.dart';
import '../di/injection.dart';
import '../services/review_service.dart';
import '../services/storage_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'common_button.dart';
import 'common_gaps.dart';
import 'common_icons.dart';
import '../../gen/assets.gen.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.r),
      child: Container(
        padding: EdgeInsets.all(24.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppConstants.reviewTitle,
              style: AppTextStyles.h1.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Gaps.vGap8,
            Text(
              AppConstants.reviewDescription,
              style: AppTextStyles.h4.copyWith(color: AppColors.mediumGray),
              textAlign: TextAlign.center,
            ),
            Gaps.vGap16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonAssetIcon(
                  Assets.icons.star,
                  color: AppColors.secondaryDark,
                ),
                Gaps.hGap4,
                CommonAssetIcon(
                  Assets.icons.star,
                  color: AppColors.secondaryDark,
                ),
                Gaps.hGap4,
                CommonAssetIcon(
                  Assets.icons.star,
                  color: AppColors.secondaryDark,
                ),
                Gaps.hGap4,
                CommonAssetIcon(
                  Assets.icons.star,
                  color: AppColors.secondaryDark,
                ),
                Gaps.hGap4,
                CommonAssetIcon(
                  Assets.icons.star,
                  color: AppColors.secondaryDark,
                ),
                Gaps.hGap8,
                Icon(
                  Icons.sentiment_satisfied_alt,
                  color: AppColors.darkBlack,
                  size: 24.r,
                ),
              ],
            ),
            Gaps.vGap24,
            CommonButton(
              text: AppConstants.rateUs,
              textStyle: AppTextStyles.h3.copyWith(color: AppColors.white),
              onPressed: () async {
                Navigator.of(context).pop();
                final reviewService = getIt<ReviewService>();
                final success = await reviewService.showInAppReview();
                if (!success) {
                  // If in-app review failed, show store navigation
                  await reviewService.openStoreForReview();
                }
              },
            ),
            Gaps.vGap12,
            CommonButton(
              text: AppConstants.maybeLater,
              backgroundColor: AppColors.grayBlue,
              textStyle: AppTextStyles.h3,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Gaps.vGap8,
            CommonButton(
              text: AppConstants.doNotAskAgain,
              textStyle: AppTextStyles.h4.copyWith(color: AppColors.mediumGray),
              backgroundColor: AppColors.transparent,
              onPressed: () async {
                Navigator.of(context).pop();
                final storageService = getIt<StorageService>();
                await storageService.setNeverShowAgain();
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Extension to show review dialog easily
extension ReviewDialogExtension on BuildContext {
  /// Shows the review dialog
  Future<void> showReviewDialog() async {
    await showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => const ReviewDialog(),
    );
  }
}
