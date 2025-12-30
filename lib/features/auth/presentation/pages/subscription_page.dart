import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/subscription_plan.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  SubscriptionTier? _selectedTier;
  final monthlyPlan = SubscriptionTier.proMonthly.plan;
  final yearlyPlan = SubscriptionTier.proYearly.plan;
  final lifetimePlan = SubscriptionTier.proLifetime.plan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary,
                    AppColors.backgroundLight,
                    AppColors.backgroundLight,
                    AppColors.secondary,
                  ],
                  stops: const [0.0, 0.2, 0.8, 1.0],
                ),
              ),
            ),
          ),
          SafeArea(
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
                        backgroundColor: Colors.transparent,
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
                              Gaps.vGap12,
                              Text(
                                AppConstants.enjoyUnlimitedAccess,
                                style: AppTextStyles.h4.copyWith(
                                  color: AppColors.text.withValues(alpha: 0.7),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Gaps.vGap32,
                        // Benefits List
                        ...yearlyPlan.features.asMap().entries.expand((entry) {
                          final index = entry.key;
                          final feature = entry.value;
                          return [
                            _BenefitItem(text: feature),
                            if (index < yearlyPlan.features.length - 1)
                              Gaps.vGap16,
                          ];
                        }),
                        Gaps.vGap32,
                        _SubscriptionPlanCard(
                          plan: monthlyPlan,
                          isSelected:
                              _selectedTier == SubscriptionTier.proMonthly,
                          onTap: () {
                            setState(() {
                              _selectedTier = SubscriptionTier.proMonthly;
                            });
                          },
                        ),
                        Gaps.vGap16,
                        _SubscriptionPlanCard(
                          plan: yearlyPlan,
                          isSelected:
                              _selectedTier == SubscriptionTier.proYearly,
                          discountPercent: 50,
                          onTap: () {
                            setState(() {
                              _selectedTier = SubscriptionTier.proYearly;
                            });
                          },
                        ),
                        Gaps.vGap16,
                        _SubscriptionPlanCard(
                          plan: lifetimePlan,
                          isSelected:
                              _selectedTier == SubscriptionTier.proLifetime,
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
                              // TODO: Handle subscription purchase
                              context.pop();
                            },
                            backgroundGradientColor:
                                AppColors.backgroundGradient,
                            textStyle: AppTextStyles.h4.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        Gaps.vGap24,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _FooterLink(
                              text: AppConstants.restorePurchase,
                              onTap: () {
                                // TODO: Handle restore purchases
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
                                // TODO: Navigate to privacy policy
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
                                // TODO: Navigate to terms of use
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
        ],
      ),
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
          width: 24.r,
          height: 24.r,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: CommonAssetIcon(Assets.icons.check, color: AppColors.black),
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
  });

  final SubscriptionPlan plan;
  final bool isSelected;
  final VoidCallback onTap;
  final int? discountPercent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.grayBlue,
            width: isSelected ? 2.r : 1.r,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24.r,
              height: 24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.grayBlue,
                  width: 2.r,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? CommonAssetIcon(Assets.icons.check, color: AppColors.black)
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
                        plan.name,
                        style: AppTextStyles.h2.copyWith(
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
                            color: AppColors.primary.withValues(alpha: 0.2),
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
              '${plan.priceString}/${plan.period.toLowerCase()}',
              style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600),
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
