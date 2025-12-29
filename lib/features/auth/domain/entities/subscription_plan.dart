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
            'Manual workout creation',
            'Exercise database access',
            'Workout execution with timer',
            'Rest timer functionality',
            'Profile management',
            'BMI and TDEE calculation',
            'Workout history tracking',
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
            'AI-powered workout generation',
            'The Shuffle mode (custom preferences)',
            'The Neat mode (duration-based)',
            'Workout goals selection',
            'Intensity customization',
            'Target body parts selection',
            'Equipment-based filtering',
            'Injuries/Limitations consideration',
            'All basic features included',
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
            'AI-powered workout generation',
            'The Shuffle mode (custom preferences)',
            'The Neat mode (duration-based)',
            'Workout goals selection',
            'Intensity customization',
            'Target body parts selection',
            'Equipment-based filtering',
            'Injuries/Limitations consideration',
            'All basic features included',
            'Best value - Save 33%',
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
          period: 'Forever',
          features: [
            'AI-powered workout generation',
            'The Shuffle mode (custom preferences)',
            'The Neat mode (duration-based)',
            'Workout goals selection',
            'Intensity customization',
            'Target body parts selection',
            'Equipment-based filtering',
            'Injuries/Limitations consideration',
            'All basic features included',
            'One-time payment, lifetime access',
            'All future features included',
          ],
          packageId: '\$rc_lifetime',
          appleProductId: 'pomofy_pro_lifetime',
          googleProductId: 'pomofy_pro_lifetime',
        );
    }
  }
}
