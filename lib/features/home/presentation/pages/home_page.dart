import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/features/auth/domain/entities/user.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/date_utils.dart';
import 'package:workouch/features/home/presentation/widgets/home_workout_card.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_images.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../widgets/home_health_metrics.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
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
                          child: CommonNetworkImage(
                            url: state.currentUser?.avatarUrl ?? '',
                            width: 60.r,
                            height: 60.r,
                            radius: 30.r,
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
                        ),
                      ],
                    ),
                  ),
                  Gaps.vGap40,
                  HomeWorkoutCard(
                    onLazyTap: () {
                      context.pushNamed(AppRoute.workoutLazyBuilder.name);
                    },
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
          ),
        );
      },
    );
  }
}
