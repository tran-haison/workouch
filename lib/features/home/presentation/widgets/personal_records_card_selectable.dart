import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_images.dart';
import '../../../../gen/assets.gen.dart';
import '../../../workout_session/domain/entities/exercise_personal_record.dart';

class PersonalRecordsCardSelectable extends StatelessWidget {
  const PersonalRecordsCardSelectable({
    required this.personalRecord,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final ExercisePersonalRecord personalRecord;
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
            _ExerciseThumbnail(gifUrl: personalRecord.gifUrl),
            Gaps.hGap12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    personalRecord.name,
                    style: AppTextStyles.h4,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gaps.vGap4,
                  Text(
                    personalRecord.displayValue.toLowerCase(),
                    style: AppTextStyles.h3.copyWith(
                      fontWeight: FontWeight.w600,
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
                          AppDateUtils.fullDate(personalRecord.prDate),
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
