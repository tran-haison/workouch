import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/widgets/common_toast.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_images.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../../../auth/presentation/widgets/avatar_placeholder.dart';
import 'home_workout_card.dart';
import 'home_health_metrics.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return SizedBox.expand(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 40.h,
              bottom: 100.h,
              left: 4.w,
              right: 4.w,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRoute.profile.name);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.grayBlue,
                              width: 4.r,
                            ),
                          ),
                          child: CommonNetworkImage(
                            url: state.currentUser?.avatarUrl ?? '',
                            width: 60.r,
                            height: 60.r,
                            radius: 30.r,
                            errorWidget: AvatarPlaceholder(
                              user: state.currentUser,
                            ),
                          ),
                        ),
                      ),
                      Gaps.vGap16,
                      Text(
                        AppDateUtils.formatTodayDate(),
                        style: AppTextStyles.h5,
                      ),
                      Text(
                        AppDateUtils.greetUser(state.currentUser?.fullName),
                        style: AppTextStyles.h0,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Gaps.vGap40,
                HomeWorkoutCard(
                  onLazyTap: () => _onLazyTap(context),
                  onProTap: () {
                    context.pushNamed(AppRoute.workoutPro.name);
                  },
                ),
                Gaps.vGap40,
                HomeHealthMetrics(
                  weight: state.currentUser?.weight ?? 0.0,
                  bmi: state.currentUser?.bmi ?? 0.0,
                  calories: state.currentUser?.calories ?? 0.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onLazyTap(BuildContext context) {
    final user = context.read<AuthCubit>().state.currentUser;

    if (user == null) {
      showCommonToast(AppConstants.pleaseSignIn, isError: true);
      return;
    }

    if (!user.hasOnboard) {
      context.pushNamed(AppRoute.onboard.name);
    } else {
      context.pushNamed(AppRoute.workoutLazyBuilder.name);
    }
  }
}
