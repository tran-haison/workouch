import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/widgets/common_icons.dart';
import 'package:workouch/gen/assets.gen.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'personal_records_selected_exercises.dart';

class PersonalRecordsTab extends StatelessWidget {
  const PersonalRecordsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 20.h, bottom: 120.h),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      AppConstants.personalRecords,
                      style: AppTextStyles.anton.copyWith(fontSize: 24.sp),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gaps.vGap10,
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _PrsOverviewNumberCard(
                          title: AppConstants.total,
                          value: state.personalRecords.length.toString(),
                          textColor: AppColors.white,
                          backgroundColor: AppColors.darkBlack,
                        ),
                      ),
                      Gaps.hGap6,
                      Expanded(
                        child: _PrsOverviewNumberCard(
                          title: AppConstants.featured,
                          value: state.selectedPersonalRecords.length
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                  Gaps.vGap6,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grayBlue,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CommonAssetIcon(
                              Assets.icons.award,
                              width: 16.r,
                              height: 16.r,
                              color: AppColors.darkBlack,
                            ),
                            Gaps.hGap8,
                            Expanded(
                              child: Text(
                                AppConstants.newPRs,
                                style: AppTextStyles.h4.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gaps.vGap12,
                        Row(
                          children: [
                            Expanded(
                              child: _PrsCountByTimeCard(
                                title: AppConstants.thisWeek,
                                value: state.newPRsThisWeek.toString(),
                                color: AppColors.primaryDark,
                              ),
                            ),
                            Gaps.hGap10,
                            Expanded(
                              child: _PrsCountByTimeCard(
                                title: AppConstants.thisMonth,
                                value: state.newPRsThisMonth.toString(),
                                color: AppColors.secondaryDark,
                              ),
                            ),
                            Gaps.hGap10,
                            Expanded(
                              child: _PrsCountByTimeCard(
                                title: AppConstants.thisYear,
                                value: state.newPRsThisYear.toString(),
                                color: AppColors.warningDark,
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
          },
        ),
        Gaps.vGap16,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: AppColors.grayBlue,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: const PersonalRecordsSelectedExercises(),
        ),
      ],
    );
  }
}

class _PrsOverviewNumberCard extends StatelessWidget {
  const _PrsOverviewNumberCard({
    required this.title,
    required this.value,
    this.textColor,
    this.backgroundColor,
  });

  final String title;
  final String value;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grayBlue,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.h5.copyWith(
                color: textColor ?? AppColors.text,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Gaps.hGap10,
          Text(
            value,
            style: AppTextStyles.anton.copyWith(
              fontSize: 18.sp,
              color: textColor ?? AppColors.text,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrsCountByTimeCard extends StatelessWidget {
  const _PrsCountByTimeCard({
    required this.title,
    required this.value,
    required this.color,
  });

  final Color color;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        Gaps.vGap8,
        Text(
          title,
          style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
        ),
        Gaps.vGap4,
        Text(
          value,
          style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
