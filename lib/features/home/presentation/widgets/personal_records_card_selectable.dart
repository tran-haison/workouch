import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extension/duration_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_images.dart';
import '../../../../gen/assets.gen.dart';
import '../../../workout/domain/entities/working_set.dart';
import '../../domain/entities/exercise_pr.dart';

class PersonalRecordsCardSelectable extends StatelessWidget {
  const PersonalRecordsCardSelectable({
    required this.pr,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final ExercisePR pr;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.darkBlack : AppColors.grayBlue,
            width: isSelected ? 1.5.r : 1.r,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ExerciseThumbnail(gifUrl: pr.gifUrl),
            Gaps.hGap12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    pr.name,
                    style: AppTextStyles.h4,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gaps.vGap4,
                  Text(
                    _getFormattedValue(pr).toLowerCase(),
                    style: AppTextStyles.h2.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.vGap8,
                  Row(
                    children: [
                      CommonAssetIcon(
                        Assets.icons.clock,
                        width: 14.r,
                        height: 14.r,
                        color: AppColors.mediumGray,
                      ),
                      Gaps.hGap4,
                      Expanded(
                        child: Text(
                          AppDateUtils.formatDate(pr.prDate),
                          style: AppTextStyles.h6.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gaps.hGap8,
            if (isSelected)
              Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: AppColors.darkBlack,
                  shape: BoxShape.circle,
                ),
                child: CommonAssetIcon(
                  Assets.icons.check,
                  width: 16.r,
                  height: 16.r,
                  color: AppColors.white,
                ),
              )
            else
              Container(
                width: 24.r,
                height: 24.r,
                decoration: BoxDecoration(
                  color: AppColors.grayBlue,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _getFormattedValue(ExercisePR pr) {
    switch (pr.setType) {
      case WorkingSetType.weightBased:
        return '${pr.maxWeight.toStringAsFixed(1)} ${AppConstants.kg} × ${pr.maxReps} ${AppConstants.reps}';
      case WorkingSetType.repsOnly:
        return '${pr.maxReps} ${AppConstants.reps}';
      case WorkingSetType.timeBased:
        return pr.maxDuration.hhmmss;
      case WorkingSetType.distanceBased:
        return '${pr.maxDistance.toStringAsFixed(1)} m';
    }
  }
}

class _ExerciseThumbnail extends StatelessWidget {
  const _ExerciseThumbnail({required this.gifUrl});

  final String gifUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.r,
      height: 56.r,
      child: gifUrl.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CommonNetworkImage(
                url: gifUrl,
                width: 56.r,
                height: 56.r,
                radius: 12.r,
                backgroundColor: AppColors.grayBlue,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: AppColors.grayBlue,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: CommonAssetIcon(
                  Assets.icons.dumbbell,
                  color: AppColors.mediumGray,
                ),
              ),
            ),
    );
  }
}
