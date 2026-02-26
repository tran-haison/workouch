import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/extension/duration_extension.dart';
import 'package:workouch/features/auth/domain/entities/user.dart';
import 'package:workouch/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../../../workout_session/domain/entities/workout_session.dart';

class HistorySessionsByDayPage extends StatelessWidget {
  const HistorySessionsByDayPage({
    required this.date,
    required this.sessions,
    super.key,
  });

  final DateTime date;
  final List<WorkoutSession> sessions;

  @override
  Widget build(BuildContext context) {
    final title = AppDateUtils.fullDate(date);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Row(
                children: [
                  CommonIconButton(
                    backgroundColor: AppColors.grayBlue,
                    icon: Assets.icons.arrowBack,
                    iconColor: AppColors.black,
                    onTap: () => context.pop(),
                  ),
                  Gaps.hGap16,
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.h3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<AuthCubit, AuthState>(
                buildWhen: (prev, curr) =>
                    prev.currentUser?.measurementSystem !=
                    curr.currentUser?.measurementSystem,
                builder: (context, state) {
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 20.h,
                    ),
                    itemCount: sessions.length,
                    separatorBuilder: (_, _) => Gaps.vGap12,
                    itemBuilder: (context, index) {
                      final session = sessions[index];
                      final system =
                          state.currentUser?.measurementSystem ??
                          MeasurementSystem.metric;

                      return _SessionItemCard(session: session, system: system);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionItemCard extends StatelessWidget {
  const _SessionItemCard({required this.session, required this.system});

  final WorkoutSession session;
  final MeasurementSystem system;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.grayBlue,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            session.workoutName.isNotEmpty
                ? session.workoutName
                : AppConstants.history,
            style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
          ),
          Gaps.vGap6,
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonAssetIcon(
                      Assets.icons.clock,
                      width: 14.r,
                      height: 14.r,
                      color: AppColors.black,
                    ),
                    Gaps.hGap4,
                    Text(session.totalDuration.hhmmss, style: AppTextStyles.h5),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonAssetIcon(
                      Assets.icons.weight,
                      width: 14.r,
                      height: 14.r,
                      color: AppColors.black,
                    ),
                    Gaps.hGap4,
                    Text(
                      session.totalVolumeString(system),
                      style: AppTextStyles.h5,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '${session.caloriesBurned.round()} kcal',
                  style: AppTextStyles.h5,
                ),
              ),
            ],
          ),
          if (session.notes.isNotEmpty) ...[
            Gaps.vGap6,
            Text(session.notes, style: AppTextStyles.h5),
          ],
          if (session.exercises.isNotEmpty) ...[
            Gaps.vGap10,
            Text(
              '${AppConstants.exercises} (${session.totalExercises})',
              style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.w600),
            ),
            Gaps.vGap4,
            Column(
              children: session.exercises.map((e) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          e.name,
                          style: AppTextStyles.h5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Gaps.hGap8,
                      Text(
                        '${e.sets.length} ${AppConstants.sets.toLowerCase()}',
                        style: AppTextStyles.h5.copyWith(
                          color: AppColors.mediumGray,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}
