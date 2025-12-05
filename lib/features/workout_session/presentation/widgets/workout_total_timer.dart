import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/core/extension/duration_extension.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/workout_session_cubit.dart';
import '../cubit/workout_session_state.dart';

class WorkoutTotalTimer extends StatelessWidget {
  const WorkoutTotalTimer({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate largest possible text size
    const largestText = '88:88:88';
    final trueTextStyle = AppTextStyles.h4.copyWith(color: AppColors.white);
    final truePadding = EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w);
    final textSize = calculateTextSize(text: largestText, style: trueTextStyle);

    return BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
      buildWhen: (prev, curr) => prev.totalTime != curr.totalTime,
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(1.r),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.primary, width: 2.r),
          ),
          child: Container(
            width: textSize.width + truePadding.horizontal,
            padding: EdgeInsets.symmetric(vertical: truePadding.vertical / 2),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Center(
              child: Text(state.totalTime.hhmmss, style: trueTextStyle),
            ),
          ),
        );
      },
    );
  }

  static Size calculateTextSize({required String text, TextStyle? style}) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size;
  }
}
