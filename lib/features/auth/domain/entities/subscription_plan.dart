import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../gen/assets.gen.dart';

part 'subscription_plan.freezed.dart';

enum SubscriptionTier { basic, proMonthly, proYearly, proLifetime }

@freezed
class SubscriptionPlan with _$SubscriptionPlan {
  const factory SubscriptionPlan({
    required SubscriptionTier tier,
    required String name,
    required String description,
    required SvgGenImage icon,
    required double price,
    required String priceString,
    required String period,
    required List<String> features,
    required String packageId,
    required String appleProductId,
    required String googleProductId,
  }) = _SubscriptionPlan;
}

extension SubscriptionPlanExtension on SubscriptionPlan {
  String get productId => Platform.isIOS ? appleProductId : googleProductId;

  /// Calculate discount percentage compared to monthly plan
  /// Returns null if no discount applies (e.g., for basic or monthly plans)
  int? get discountPercent {
    if (tier == SubscriptionTier.basic || tier == SubscriptionTier.proMonthly) {
      return null;
    }

    final monthlyPlan = SubscriptionTier.proMonthly.plan;
    final monthlyPrice = monthlyPlan.price;

    if (tier == SubscriptionTier.proYearly) {
      // Yearly: $49.99/year vs Monthly: $5.99/month × 12 = $71.88/year
      // Discount: (($71.88 - $49.99) / $71.88) × 100 = 30.45% ≈ 30%
      const monthsInYear = 12;
      final monthlyCostForYear = monthlyPrice * monthsInYear;
      final discount =
          ((monthlyCostForYear - price) / monthlyCostForYear) * 100;
      return discount.round();
    } else if (tier == SubscriptionTier.proLifetime) {
      // Lifetime: $149.99 vs Monthly: $5.99/month × 36 months (3 years) = $215.64
      // Discount: (($215.64 - $149.99) / $215.64) × 100 = 30.45% ≈ 30%
      const comparisonMonths = 36; // Compare to 3 years of monthly subscription
      final monthlyCostForPeriod = monthlyPrice * comparisonMonths;
      final discount =
          ((monthlyCostForPeriod - price) / monthlyCostForPeriod) * 100;
      return discount.round();
    }

    return null;
  }
}

extension SubscriptionTierExtension on SubscriptionTier {
  String get string {
    switch (this) {
      case SubscriptionTier.basic:
        return 'Basic';
      case SubscriptionTier.proMonthly:
        return 'Pro Monthly';
      case SubscriptionTier.proYearly:
        return 'Pro Yearly';
      case SubscriptionTier.proLifetime:
        return 'Pro Lifetime';
    }
  }

  SubscriptionPlan get plan {
    switch (this) {
      case SubscriptionTier.basic:
        return SubscriptionPlan(
          tier: SubscriptionTier.basic,
          name: 'Basic',
          description: 'Basic workout features',
          icon: Assets.icons.lineWeight,
          price: 0.0,
          priceString: 'FREE',
          period: 'Forever',
          features: [
            'Manual workout creation & management',
            'Exercise database access',
            'Basic progress tracking',
          ],
          packageId: '',
          appleProductId: '',
          googleProductId: '',
        );
      case SubscriptionTier.proMonthly:
        return SubscriptionPlan(
          tier: SubscriptionTier.proMonthly,
          name: 'Pro Monthly',
          description: 'Unlimited access to all features',
          icon: Assets.icons.rocket,
          price: 5.99,
          priceString: '\$5.99',
          period: 'Monthly',
          features: [
            'Unlimited access to all premium features',
            'Unlimited AI-powered workout generation',
            'Advanced progress tracking & analytics',
            'Comprehensive body stats & insights',
            'All future updates included',
          ],
          packageId: '\$rc_monthly',
          appleProductId: 'pomofy_pro_monthly',
          googleProductId: 'pomofy_pro_monthly',
        );
      case SubscriptionTier.proYearly:
        return SubscriptionPlan(
          tier: SubscriptionTier.proYearly,
          name: 'Pro Yearly',
          description: 'Unlimited access to all features',
          icon: Assets.icons.rocket,
          price: 49.99,
          priceString: '\$49.99',
          period: 'Yearly',
          features: [
            'Unlimited access to all premium features',
            'Unlimited AI-powered workout generation',
            'Advanced progress tracking & analytics',
            'Comprehensive body stats & insights',
            'All future updates included',
          ],
          packageId: '\$rc_yearly',
          appleProductId: 'pomofy_pro_yearly',
          googleProductId: 'pomofy_pro_yearly',
        );
      case SubscriptionTier.proLifetime:
        return SubscriptionPlan(
          tier: SubscriptionTier.proLifetime,
          name: 'Pro Lifetime',
          description: 'Unlimited access to all features',
          icon: Assets.icons.rocket,
          price: 149.99,
          priceString: '\$149.99',
          period: 'Lifetime',
          features: [
            'Unlimited access to all premium features',
            'Unlimited AI-powered workout generation',
            'Advanced progress tracking & analytics',
            'Comprehensive body stats & insights',
            'Lifetime access with all future updates',
          ],
          packageId: '\$rc_lifetime',
          appleProductId: 'pomofy_pro_lifetime',
          googleProductId: 'pomofy_pro_lifetime',
        );
    }
  }
}
