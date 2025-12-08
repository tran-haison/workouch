import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/widgets/common_icons.dart';
import 'package:workouch/core/widgets/common_loading_dialog.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStateStatus.loading) {
          context.showLoadingDialog();
        } else {
          context.hideLoadingDialog();
        }

        if (state.status == AuthStateStatus.authenticated &&
            state.currentUser != null) {
          showCommonToast(AppConstants.signInSuccess);
          context.pushReplacementNamed(AppRoute.home.name);
          return;
        }

        if (state.status == AuthStateStatus.error) {
          showCommonToast(
            state.error?.message ?? AppConstants.signInError,
            isError: true,
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo/Title
                Text(
                  AppConstants.appName,
                  style: AppTextStyles.anton.copyWith(fontSize: 48.sp),
                ),
                Gaps.vGap8,
                Text(
                  AppConstants.signInSubtitle,
                  style: AppTextStyles.h4.copyWith(color: AppColors.mediumGray),
                  textAlign: TextAlign.center,
                ),
                Gaps.vGap40,
                // Google Sign In Button
                CommonButton(
                  text: AppConstants.continueWithGoogle,
                  onPressed: () => context.read<AuthCubit>().signInWithGoogle(),
                  backgroundColor: AppColors.white,
                  textStyle: AppTextStyles.h4.copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.w600,
                  ),
                  borderColor: AppColors.grayBlue,
                  leading: CommonAssetIcon(
                    Assets.icons.google,
                    useDefaultColor: true,
                  ),
                ),
                Gaps.vGap16,
                // Apple Sign In Button
                CommonButton(
                  text: AppConstants.continueWithApple,
                  onPressed: () => context.read<AuthCubit>().signInWithApple(),
                  backgroundColor: AppColors.black,
                  textStyle: AppTextStyles.h4.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  leading: CommonAssetIcon(
                    Assets.icons.apple,
                    useDefaultColor: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
