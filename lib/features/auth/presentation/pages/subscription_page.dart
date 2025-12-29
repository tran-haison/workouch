import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/subscription_plan.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  SubscriptionTier? _selectedTier;
  bool _enableFreeTrial = true;
  final monthlyPlan = SubscriptionTier.proMonthly.plan;
  final yearlyPlan = SubscriptionTier.proYearly.plan;
  final lifetimePlan = SubscriptionTier.proLifetime.plan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F0F1E)],
          // ),
          color: AppColors.darkBlack,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with close button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonIconButton(
                      backgroundColor: Colors.transparent,
                      icon: Assets.icons.close,
                      iconColor: AppColors.white,
                      radius: 20.r,
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
                      Gaps.vGap20,
                      // Title Section
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Unlock Premium',
                              style: AppTextStyles.h0.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                                fontSize: 32.sp,
                              ),
                            ),
                            Gaps.vGap12,
                            Text(
                              'Enjoy these benefits when you upgrade to the premium plan.',
                              style: AppTextStyles.h4.copyWith(
                                color: AppColors.white.withValues(alpha: 0.7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Gaps.vGap32,
                      // Benefits List
                      _BenefitItem(text: 'Unlimited content access'),
                      Gaps.vGap16,
                      _BenefitItem(text: 'Offline access'),
                      Gaps.vGap16,
                      _BenefitItem(text: 'No annoying ads'),
                      Gaps.vGap32,
                      // Free Trial Toggle
                      Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Enable 7-day free trial',
                              style: AppTextStyles.h4.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Switch(
                              value: _enableFreeTrial,
                              onChanged: (value) {
                                setState(() {
                                  _enableFreeTrial = value;
                                });
                              },
                              activeThumbColor: AppColors.primary,
                              activeTrackColor: AppColors.primary.withValues(
                                alpha: 0.5,
                              ),
                              inactiveThumbColor: AppColors.white,
                              inactiveTrackColor: AppColors.white.withValues(
                                alpha: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.vGap32,
                      // Plan Cards
                      _SubscriptionPlanCard(
                        plan: yearlyPlan,
                        isSelected: _selectedTier == SubscriptionTier.proYearly,
                        discountPercent: 50,
                        onTap: () {
                          setState(() {
                            _selectedTier = SubscriptionTier.proYearly;
                          });
                        },
                      ),
                      Gaps.vGap16,
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
                      Gaps.vGap24,
                      // Disclaimer
                      Center(
                        child: Text(
                          'No charges yet. Cancel anytime.',
                          style: AppTextStyles.h5.copyWith(
                            color: AppColors.white.withValues(alpha: 0.6),
                          ),
                        ),
                      ),
                      Gaps.vGap24,
                      // Continue Button
                      if (_selectedTier != null)
                        CommonButton(
                          text: 'Continue',
                          onPressed: () {
                            // TODO: Handle subscription purchase
                            context.pop();
                          },
                          backgroundGradientColor: AppColors.backgroundGradient,
                          textStyle: AppTextStyles.h4.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      Gaps.vGap24,
                      // Footer Links
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _FooterLink(
                            text: 'Restore Purchase',
                            onTap: () {
                              // TODO: Handle restore purchases
                            },
                          ),
                          Text(
                            ' • ',
                            style: AppTextStyles.h5.copyWith(
                              color: AppColors.white.withValues(alpha: 0.5),
                            ),
                          ),
                          _FooterLink(
                            text: 'Privacy Policy',
                            onTap: () {
                              // TODO: Navigate to privacy policy
                            },
                          ),
                          Text(
                            ' • ',
                            style: AppTextStyles.h5.copyWith(
                              color: AppColors.white.withValues(alpha: 0.5),
                            ),
                          ),
                          _FooterLink(
                            text: 'Terms of Use',
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
          child: Icon(Icons.check, color: AppColors.white, size: 16.r),
        ),
        Gaps.hGap12,
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.h4.copyWith(color: AppColors.white),
          ),
        ),
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
        width: double.infinity,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: isSelected ? 0.15 : 0.1),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.white.withValues(alpha: 0.3),
            width: isSelected ? 2.r : 1.r,
          ),
        ),
        child: Row(
          children: [
            // Selection indicator
            Container(
              width: 24.r,
              height: 24.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.white.withValues(alpha: 0.5),
                  width: 2.r,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, color: AppColors.white, size: 16.r)
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
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
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
                            color: AppColors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            '-$discountPercent%',
                            style: AppTextStyles.h6.copyWith(
                              color: AppColors.white.withValues(alpha: 0.8),
                              fontWeight: FontWeight.w700,
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
              style: AppTextStyles.h3.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
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
          color: AppColors.white.withValues(alpha: 0.7),
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
