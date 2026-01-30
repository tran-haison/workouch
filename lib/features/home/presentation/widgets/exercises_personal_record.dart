import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/widgets/common_button.dart';
import 'package:workouch/core/widgets/common_images.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extension/duration_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../../workout/domain/entities/working_set.dart';
import '../../domain/entities/exercise_pr.dart';

class ExercisesPersonalRecord extends StatefulWidget {
  const ExercisesPersonalRecord({super.key});

  @override
  State<ExercisesPersonalRecord> createState() =>
      _ExercisesPersonalRecordState();
}

class _ExercisesPersonalRecordState extends State<ExercisesPersonalRecord> {
  final List<ExercisePR> personalRecords = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                AppConstants.personalRecords,
                style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            CommonButton(
              isFullWidth: false,
              onPressed: _onViewAllTap,
              text: AppConstants.viewAll,
              radius: 8.r,
              backgroundColor: AppColors.transparent,
              textStyle: AppTextStyles.h5.copyWith(
                color: AppColors.mediumGray,
                fontWeight: FontWeight.w600,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              spaceWithTrailing: 6.w,
              trailing: CommonAssetIcon(
                Assets.icons.arrowTopRight,
                width: 16.r,
                height: 16.r,
                color: AppColors.mediumGray,
              ),
            ),
          ],
        ),
        Gaps.vGap16,
        if (personalRecords.isEmpty)
          Container(
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(
              color: AppColors.grayBlue,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                CommonAssetIcon(
                  Assets.icons.moodEmpty,
                  width: 20.r,
                  height: 20.r,
                  useDefaultColor: true,
                ),
                Gaps.vGap8,
                Text(
                  AppConstants.noPRsYet,
                  style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.bold),
                ),
                Gaps.vGap4,
                Text(
                  AppConstants.doWorkoutAndSetYourPRs,
                  style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        else
          ...personalRecords.map(
            (pr) => _PRCard(
              pr: pr,
              onRemove: () => _showEditPRDialog(pr.exerciseId),
              onEdit: () => _showEditPRDialog(pr.exerciseId),
            ),
          ),
      ],
    );
  }

  void _showEditPRDialog(String exerciseId) {
    // TODO: Implement edit PR dialog
  }

  void _onViewAllTap() {
    // TODO: Navigate to view all PRs screen
  }
}

class _PRCard extends StatelessWidget {
  const _PRCard({
    required this.pr,
    required this.onRemove,
    required this.onEdit,
  });

  final ExercisePR pr;
  final VoidCallback onRemove;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grayBlue),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ExerciseThumbnail(gifUrl: pr.gifUrl),
          Gaps.hGap20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(pr.name, style: AppTextStyles.h4)),
                    Gaps.hGap8,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: _getSetTypeColor(pr.setType),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Text(pr.setType.label, style: AppTextStyles.h6),
                    ),
                  ],
                ),
                Gaps.vGap4,
                Text(
                  _getFormattedValue(pr).toLowerCase(),
                  style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w700),
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
        ],
      ),
    );
  }
}

Color _getSetTypeColor(WorkingSetType setType) {
  switch (setType) {
    case WorkingSetType.weightBased:
      return AppColors.primary;
    case WorkingSetType.repsOnly:
      return AppColors.secondary;
    case WorkingSetType.timeBased:
      return AppColors.warning;
    case WorkingSetType.distanceBased:
      return AppColors.blue;
  }
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
