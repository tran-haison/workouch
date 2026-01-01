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
    required int discountPercent,
    required String period,
    required List<String> features,
    required String packageId,
    required String appleProductId,
    required String googleProductId,
  }) = _SubscriptionPlan;
}

extension SubscriptionPlanExtension on SubscriptionPlan {
  String get productId => Platform.isIOS ? appleProductId : googleProductId;

  bool isActive(String productId) {
    return productId == appleProductId || productId == googleProductId;
  }
}

extension SubscriptionTierExtension on SubscriptionTier {
  bool get isBasic => this == SubscriptionTier.basic;
  bool get isProMonthly => this == SubscriptionTier.proMonthly;
  bool get isProYearly => this == SubscriptionTier.proYearly;
  bool get isProLifetime => this == SubscriptionTier.proLifetime;
  bool get isPro => isProMonthly || isProYearly || isProLifetime;

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

  String get stringShort {
    switch (this) {
      case SubscriptionTier.basic:
        return 'Basic';
      case SubscriptionTier.proMonthly:
        return 'Pro';
      case SubscriptionTier.proYearly:
        return 'Pro';
      case SubscriptionTier.proLifetime:
        return 'Pro';
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
          discountPercent: 0,
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
          price:
              5.99, // This is base price in USD, actual price will be fetched from RevenueCat
          priceString:
              '\$5.99', // This is base price string in USD, actual price string will be fetched from RevenueCat
          discountPercent: 0,
          period: 'Monthly',
          features: [
            'Unlimited AI-powered workout generation',
            'Advanced progress tracking & analytics',
            'Comprehensive body stats & insights',
            'All future updates included',
          ],
          packageId: '\$rc_monthly',
          appleProductId: 'workouch_pro_monthly',
          googleProductId: 'workouch_pro:workouch-pro-monthly',
        );
      case SubscriptionTier.proYearly:
        return SubscriptionPlan(
          tier: SubscriptionTier.proYearly,
          name: 'Pro Yearly',
          description: 'Unlimited access to all features',
          icon: Assets.icons.rocket,
          price:
              49.99, // This is base price in USD, actual price will be fetched from RevenueCat
          priceString:
              '\$49.99', // This is base price string in USD, actual price string will be fetched from RevenueCat
          discountPercent: 30,
          period: 'Yearly',
          features: [
            'Unlimited AI-powered workout generation',
            'Advanced progress tracking & analytics',
            'Comprehensive body stats & insights',
            'All future updates included',
          ],
          packageId: '\$rc_annual',
          appleProductId: 'workouch_pro_yearly',
          googleProductId: 'workouch_pro:workouch-pro-yearly',
        );
      case SubscriptionTier.proLifetime:
        return SubscriptionPlan(
          tier: SubscriptionTier.proLifetime,
          name: 'Pro Lifetime',
          description: 'Unlimited access to all features',
          icon: Assets.icons.rocket,
          price:
              149.99, // This is base price in USD, actual price will be fetched from RevenueCat
          priceString:
              '\$149.99', // This is base price string in USD, actual price string will be fetched from RevenueCat
          discountPercent: 30,
          period: 'Lifetime',
          features: [
            'Unlimited AI-powered workout generation',
            'Advanced progress tracking & analytics',
            'Comprehensive body stats & insights',
            'Lifetime access with all future updates',
          ],
          packageId: '\$rc_lifetime',
          appleProductId: 'workouch_pro_lifetime',
          googleProductId: 'workouch_pro_lifetime',
        );
    }
  }
}
