import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/extension/string_extension.dart';
import 'package:workouch/core/widgets/common_button.dart';
import 'package:workouch/core/widgets/common_images.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../../workout/domain/entities/working_set.dart';
import '../../../workout_session/domain/entities/exercise_personal_record.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class PersonalRecordsSelectedExercises extends StatelessWidget {
  const PersonalRecordsSelectedExercises({super.key});

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
                AppConstants.selectedExercises.capitalizeOnlyFirstLetter,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            CommonButton(
              isFullWidth: false,
              onPressed: () => context.pushNamed(AppRoute.personalRecords.name),
              text: AppConstants.viewAll,
              radius: 8.r,
              backgroundColor: AppColors.transparent,
              textStyle: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
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
        Gaps.vGap12,
        const _ExercisePrList(),
      ],
    );
  }
}

class _ExercisePrList extends StatelessWidget {
  const _ExercisePrList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) =>
          prev.selectedPersonalRecords != curr.selectedPersonalRecords,
      builder: (context, state) {
        if (state.selectedPersonalRecords.isEmpty) {
          return Container(
            width: 1.sw,
            padding: EdgeInsets.all(24.r),
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
                  AppConstants.selectExercisesAndSetPRs,
                  style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Gaps.vGap12,
          itemCount: state.selectedPersonalRecords.length,
          itemBuilder: (context, index) {
            final pr = state.selectedPersonalRecords[index];
            return _ExercisePrItem(personalRecord: pr);
          },
        );
      },
    );
  }
}

class _ExercisePrItem extends StatelessWidget {
  const _ExercisePrItem({required this.personalRecord});

  final ExercisePersonalRecord personalRecord;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ExerciseImg(gifUrl: personalRecord.gifUrl),
          Gaps.hGap20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(personalRecord.name, style: AppTextStyles.h4),
                    ),
                    Gaps.hGap8,
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: _getSetTypeColor(personalRecord.setType),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Text(
                        personalRecord.setType.label,
                        style: AppTextStyles.h6,
                      ),
                    ),
                  ],
                ),
                Gaps.vGap4,
                Text(
                  personalRecord.displayValue.toLowerCase(),
                  style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
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
        ],
      ),
    );
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
}

class _ExerciseImg extends StatelessWidget {
  const _ExerciseImg({required this.gifUrl});

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
