import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/url_utils.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_loading_dialog.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/subscription_plan.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  SubscriptionTier? _selectedTier;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == AuthStateStatus.loading) {
          context.showLoadingDialog();
        } else {
          context.hideLoadingDialog();
        }

        if (state.status == AuthStateStatus.purchaseSubSuccess) {
          context.read<AuthCubit>().initUser();
          showCommonToast(AppConstants.purchaseSuccess);
          context.goNamed(AppRoute.home.name);
          return;
        }

        if (state.status == AuthStateStatus.restoreSubSuccess) {
          context.read<AuthCubit>().initUser();
          showCommonToast(AppConstants.restoreSuccess);
          context.goNamed(AppRoute.home.name);
          return;
        }

        if (state.status == AuthStateStatus.purchaseSubError) {
          showCommonToast(
            state.error?.message ?? AppConstants.purchaseError,
            isError: true,
          );
          return;
        }

        if (state.status == AuthStateStatus.restoreSubError) {
          showCommonToast(
            state.error?.message ?? AppConstants.restoreError,
            isError: true,
          );
        }
      },
      builder: (context, state) {
        final monthlyPlan = state.monthlyPlan;
        final yearlyPlan = state.yearlyPlan;
        final lifetimePlan = state.lifetimePlan;

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonIconButton(
                        backgroundColor: AppColors.transparent,
                        icon: Assets.icons.close,
                        iconColor: AppColors.black,
                        onTap: () => context.pop(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    AppConstants.unlock,
                                    style: AppTextStyles.h0.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32.sp,
                                    ),
                                  ),
                                  Gaps.hGap12,
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 8.h,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.primary,
                                          AppColors.secondary,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(12.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.primary.withValues(
                                            alpha: 0.3,
                                          ),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          AppConstants.pro,
                                          style: AppTextStyles.orbitron
                                              .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 32.sp,
                                              ),
                                        ),
                                        Gaps.hGap8,
                                        CommonAssetIcon(
                                          Assets.icons.starAi,
                                          color: AppColors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap16,
                              Text(
                                AppConstants.enjoyUnlimitedAccess,
                                style: AppTextStyles.h4.copyWith(
                                  color: AppColors.mediumGray,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Gaps.vGap32,
                        const _BenefitItem(
                          text: AppConstants.unlimitedWorkoutGeneration,
                        ),
                        Gaps.vGap16,
                        const _BenefitItem(
                          text: AppConstants.advancedProgressTrackingAnalytics,
                        ),
                        Gaps.vGap16,
                        const _BenefitItem(
                          text: AppConstants.comprehensiveBodyStatsInsights,
                        ),
                        Gaps.vGap16,
                        const _BenefitItem(
                          text: AppConstants.allFutureUpdatesIncluded,
                        ),
                        Gaps.vGap32,
                        _SubscriptionPlanCard(
                          plan: monthlyPlan,
                          isSelected: _selectedTier?.isProMonthly ?? false,
                          onTap: () {
                            setState(() {
                              _selectedTier = SubscriptionTier.proMonthly;
                            });
                          },
                        ),
                        Gaps.vGap24,
                        _SubscriptionPlanCard(
                          plan: yearlyPlan,
                          isSelected: _selectedTier?.isProYearly ?? false,
                          discountPercent: yearlyPlan.discountPercent,
                          showMostPopular: true,
                          onTap: () {
                            setState(() {
                              _selectedTier = SubscriptionTier.proYearly;
                            });
                          },
                        ),
                        Gaps.vGap20,
                        _SubscriptionPlanCard(
                          plan: lifetimePlan,
                          isSelected: _selectedTier?.isProLifetime ?? false,
                          discountPercent: lifetimePlan.discountPercent,
                          onTap: () {
                            setState(() {
                              _selectedTier = SubscriptionTier.proLifetime;
                            });
                          },
                        ),
                        Gaps.vGap24,
                        Center(
                          child: Text(
                            AppConstants.noChargesYetCancelAnytime,
                            style: AppTextStyles.h5.copyWith(
                              color: AppColors.mediumGray,
                            ),
                          ),
                        ),
                        Gaps.vGap24,
                        if (_selectedTier != null)
                          CommonButton(
                            text: AppConstants.continueText,
                            onPressed: () {
                              context.read<AuthCubit>().purchaseSubscription(
                                _selectedTier!,
                              );
                            },
                            backgroundColor: AppColors.darkBlack,
                            textStyle: AppTextStyles.h3.copyWith(
                              color: AppColors.white,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 16.h,
                              horizontal: 20.w,
                            ),
                          ),
                        Gaps.vGap24,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _FooterLink(
                              text: AppConstants.restorePurchase,
                              onTap: () {
                                context.read<AuthCubit>().restoreSubscription();
                              },
                            ),
                            Text(
                              ' • ',
                              style: AppTextStyles.h5.copyWith(
                                color: AppColors.mediumGray,
                              ),
                            ),
                            _FooterLink(
                              text: AppConstants.privacyPolicy,
                              onTap: () {
                                UrlUtils.openUrl(
                                  context,
                                  AppConstants.url.pagePrivacyPolicy,
                                );
                              },
                            ),
                            Text(
                              ' • ',
                              style: AppTextStyles.h5.copyWith(
                                color: AppColors.mediumGray,
                              ),
                            ),
                            _FooterLink(
                              text: AppConstants.termsConditions,
                              onTap: () {
                                UrlUtils.openUrl(
                                  context,
                                  AppConstants.url.pageTermsConditions,
                                );
                              },
                            ),
                          ],
                        ),
                        Gaps.vGap40,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BenefitItem extends StatelessWidget {
  const _BenefitItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            shape: BoxShape.circle,
          ),
          child: CommonAssetIcon(
            Assets.icons.check,
            color: AppColors.black,
            width: 20.r,
            height: 20.r,
          ),
        ),
        Gaps.hGap12,
        Expanded(child: Text(text, style: AppTextStyles.h4)),
      ],
    );
  }
}

class _SubscriptionPlanCard extends StatelessWidget {
  const _SubscriptionPlanCard({
    required this.plan,
    required this.isSelected,
    required this.onTap,
    this.discountPercent,
    this.showMostPopular = false,
  });

  final SubscriptionPlan plan;
  final bool isSelected;
  final VoidCallback onTap;
  final int? discountPercent;
  final bool showMostPopular;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppColors.darkBlack : AppColors.grayBlue,
            width: isSelected ? 2.r : 1.r,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.grayBlue,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              children: [
                Container(
                  width: 24.r,
                  height: 24.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.darkBlack
                          : AppColors.grayBlue,
                      width: 2.r,
                    ),
                    color: isSelected
                        ? AppColors.darkBlack
                        : Colors.transparent,
                  ),
                  child: isSelected
                      ? CommonAssetIcon(
                          Assets.icons.check,
                          color: AppColors.white,
                        )
                      : null,
                ),
                Gaps.hGap16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            plan.period,
                            style: AppTextStyles.h3.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (discountPercent != null) ...[
                            Gaps.hGap8,
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                '-$discountPercent%',
                                style: AppTextStyles.h6.copyWith(
                                  color: AppColors.text.withValues(alpha: 0.8),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  plan.priceString,
                  style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            if (showMostPopular)
              Positioned(
                top: -32.r,
                left: 0.r,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primary, AppColors.secondary],
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      AppConstants.mostPopular,
                      style: AppTextStyles.h6.copyWith(
                        color: AppColors.text,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: AppTextStyles.h5.copyWith(
          color: AppColors.mediumGray,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
