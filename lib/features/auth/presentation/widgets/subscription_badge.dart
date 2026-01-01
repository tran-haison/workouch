import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workouch/features/auth/domain/entities/subscription_plan.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class SubscriptionBadge extends StatelessWidget {
  const SubscriptionBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = state.currentUser;
        if (user == null) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: user.subscriptionTier.isBasic ? AppColors.grayBlue : null,
            gradient: user.subscriptionTier.isBasic
                ? null
                : AppColors.backgroundGradient,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            user.subscriptionTier.stringShort,
            style: AppTextStyles.h5,
          ),
        );
      },
    );
  }
}
