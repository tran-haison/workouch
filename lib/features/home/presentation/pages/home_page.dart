import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/date_utils.dart';
import 'package:workouch/features/home/presentation/widgets/home_workout_card.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_images.dart';
import '../widgets/home_health_metrics.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40.h, bottom: 100.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    CommonNetworkImage(
                      url: 'https://i.pravatar.cc/150?img=12',
                      width: 60.r,
                      height: 60.r,
                      radius: 30.r,
                    ),
                    Gaps.vGap16,
                    Text(
                      AppDateUtils.formatTodayDate(),
                      style: AppTextStyles.h5,
                    ),
                    Text('Good morning, Hai Son!', style: AppTextStyles.h0),
                  ],
                ),
              ),
              Gaps.vGap40,
              HomeWorkoutCard(onLazyTap: () {}, onProTap: () {}),
              Gaps.vGap40,
              HomeHealthMetrics(weight: 80.9, bmi: 25.7, calories: 2123),
            ],
          ),
        ),
      ),
    );
  }
}
