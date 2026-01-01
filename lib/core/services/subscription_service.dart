import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/domain/entities/subscription_plan.dart';
import '../utils/log.dart';

@lazySingleton
class SubscriptionService {
  SubscriptionService();

  static const _entitlementIdPro = 'Workouch Pro';
  static const _packageIdMonthly = '\$rc_monthly';
  static const _packageIdYearly = '\$rc_annual';
  static const _packageIdLifetime = '\$rc_lifetime';

  // Public RevenueCat key associated with the app
  static const String _appleApiKey = 'appl_KsRXtcAZdAAEavRLvZsmlBTrcCE';
  static const String _googleApiKey = 'goog_ibSFtpQwaBvWKrEphfkBfqFCgWK';
  static final String _apiKey = Platform.isIOS ? _appleApiKey : _googleApiKey;

  // Initialize RevenueCat
  Future<void> initialize({String? userId}) async {
    try {
      if (kDebugMode) {
        await Purchases.setLogLevel(LogLevel.debug);
      }

      final config = PurchasesConfiguration(_apiKey);
      if (userId != null) {
        config.appUserID = userId;
      }
      await Purchases.configure(config);
    } catch (e) {
      Log.e('Failed to initialize RevenueCat: $e');
    }
  }

  /// Should always call when logging in to sync user with Supabase
  Future<void> login(String userId) async {
    try {
      await Purchases.logIn(userId);
    } catch (e) {
      Log.e('Failed to log in RevenueCat: $e');
    }
  }

  // Get available packages
  Future<List<Package>> getAvailablePackages() async {
    try {
      final packages = <Package>[];
      final offerings = await Purchases.getOfferings();

      if (offerings.current != null &&
          offerings.current?.availablePackages.isNotEmpty == true) {
        // Get the product for the monthly package
        final monthlyPackage = offerings.current?.getPackage(_packageIdMonthly);
        final yearlyPackage = offerings.current?.getPackage(_packageIdYearly);
        final lifetimePackage = offerings.current?.getPackage(
          _packageIdLifetime,
        );

        if (monthlyPackage != null) {
          packages.add(monthlyPackage);
        }
        if (yearlyPackage != null) {
          packages.add(yearlyPackage);
        }
        if (lifetimePackage != null) {
          packages.add(lifetimePackage);
        }
      }

      Log.i(
        'Available packages: ${packages.map((e) => e.identifier).join(', ')}',
      );

      return packages;
    } catch (e) {
      Log.e('Error getting available packages: $e');
      return [];
    }
  }

  // Check if user has active subscription
  Future<bool> _hasActiveSubscription() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo.entitlements.active.containsKey(_entitlementIdPro);
    } catch (e) {
      Log.e('Error checking subscription status: $e');
      return false;
    }
  }

  // Get current subscription tier for this user
  Future<SubscriptionTier> getUserSubscriptionTier() async {
    try {
      final hasSubscription = await _hasActiveSubscription();

      // If user has no active subscription, return basic tier
      if (!hasSubscription) {
        return SubscriptionTier.basic;
      }

      final customerInfo = await Purchases.getCustomerInfo();
      final activeEntitlement =
          customerInfo.entitlements.active[_entitlementIdPro]!;

      // Android: workouch_pro
      // iOS: workouch_pro_monthly
      final productId = activeEntitlement.productIdentifier;
      Log.i('Product identifier: $productId');

      // This is for Android only
      // Android: workouch-pro-monthly
      // iOS: null
      final productPlanId = activeEntitlement.productPlanIdentifier;
      Log.i('Product plan identifier: $productPlanId');

      // This is the final id that matches id on RevenueCat
      // Android: workouch_pro:workouch-pro-monthly
      // iOS: workouch_pro_monthly
      final id =
          '$productId${productPlanId?.isNotEmpty == true ? ':$productPlanId' : ''}';

      // Find the matching subscription tier
      final matchingTier = SubscriptionTier.values.firstWhere(
        (tier) => tier.plan.isActive(id),
        orElse: () => SubscriptionTier.basic,
      );

      return matchingTier;
    } catch (e) {
      Log.e('Error getting subscription tier: $e');
      return SubscriptionTier.basic;
    }
  }

  // Purchase a package
  Future<bool> purchase(Package package) async {
    try {
      final purchaseParams = PurchaseParams.package(package);
      final result = await Purchases.purchase(purchaseParams);
      return result
              .customerInfo
              .entitlements
              .all[_entitlementIdPro]
              ?.isActive ??
          false;
    } catch (e) {
      Log.e('Purchase failed: $e');
      return false;
    }
  }

  // Restore purchases
  Future<bool> restorePurchases() async {
    try {
      final customerInfo = await Purchases.restorePurchases();
      final activeSubs = customerInfo.entitlements.active;
      return activeSubs.isNotEmpty;
    } catch (e) {
      Log.e('Restore purchases failed: $e');
      return false;
    }
  }
}
