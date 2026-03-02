import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:workouch/features/auth/domain/entities/subscription_plan.dart';

import '../../../../core/utils/error.dart';
import '../../../workout/domain/entities/user_subscription.dart';
import '../../domain/entities/user.dart';

part 'auth_state.freezed.dart';

enum AuthStateStatus {
  initial,
  loading,
  unauthenticated,
  authenticated,
  error,
  purchaseSubSuccess,
  restoreSubSuccess,
  purchaseSubError,
  restoreSubError,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStateStatus.initial) AuthStateStatus status,
    @Default([]) List<Package> availablePackages,
    User? currentUser,
    UserSubscription? userSubscription,
    Error? error,
  }) = _AuthState;
}

extension AuthStateX on AuthState {
  List<StoreProduct> get availableProducts =>
      availablePackages.map((e) => e.storeProduct).toList();

  List<SubscriptionPlan> get availableProPlans {
    // Get the three pro subscription tiers
    final proTiers = [
      SubscriptionTier.proMonthly,
      SubscriptionTier.proYearly,
      SubscriptionTier.proLifetime,
    ];

    return proTiers.map((tier) {
      final basePlan = tier.plan;

      // Find matching StoreProduct by productId
      final matchingProducts = availableProducts
          .where((product) => product.identifier == basePlan.productId)
          .toList();

      if (matchingProducts.isNotEmpty) {
        final matchingProduct = matchingProducts.first;

        // Create new plan with updated price and priceString from StoreProduct (RevenueCat)
        return basePlan.copyWith(
          price: matchingProduct.price,
          priceString: matchingProduct.priceString,
        );
      }

      // If product not found, return base plan with default values
      return basePlan;
    }).toList();
  }

  /// Get monthly subscription plan with prices from available products
  SubscriptionPlan get monthlyPlan => availableProPlans.firstWhere(
    (plan) => plan.tier == SubscriptionTier.proMonthly,
    orElse: () => SubscriptionTier.proMonthly.plan,
  );

  /// Get yearly subscription plan with prices from available products
  SubscriptionPlan get yearlyPlan => availableProPlans.firstWhere(
    (plan) => plan.tier == SubscriptionTier.proYearly,
    orElse: () => SubscriptionTier.proYearly.plan,
  );

  /// Get lifetime subscription plan with prices from available products
  SubscriptionPlan get lifetimePlan => availableProPlans.firstWhere(
    (plan) => plan.tier == SubscriptionTier.proLifetime,
    orElse: () => SubscriptionTier.proLifetime.plan,
  );

  bool get userBasicSubReachLimit {
    if (userSubscription == null) return false;

    return (userSubscription!.subscriptionTier.isBasic) &&
        ((userSubscription!.workoutGenUsed) >=
            (userSubscription!.workoutGenLimit));
  }

  bool get userProSubReachLimit {
    if (userSubscription == null) return false;

    return (userSubscription!.subscriptionTier.isPro) &&
        ((userSubscription!.workoutGenUsed) >=
            (userSubscription!.workoutGenLimit));
  }
}
