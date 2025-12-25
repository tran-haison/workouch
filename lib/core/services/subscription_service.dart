import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../features/profile/domain/entities/subscription_plan.dart';
import '../utils/log.dart';

@lazySingleton
class SubscriptionService {
  SubscriptionService();

  static const _entitlementIdPro = 'Pro';
  static const _packageIdLifetime = '\$rc_lifetime';
  // static const _appleProductIds = ['pomofy_pro_lifetime'];
  // static const _googleProductIds = ['pomofy_pro_lifetime'];

  // This is public RevenueCat key, not private
  static const String _appleApiKey = 'appl_LnjnhqPkoOlvkHwgIZFlnpISHaP';
  static const String _googleApiKey = 'goog_xzYZtQvQqZLxAdGvJBxPVqDDPXr';
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

  /// Sync from Supabase auth user to RevenueCat user when user is logged in
  Future<void> login(String userId) async {
    try {
      await Purchases.logIn(userId);
    } catch (e) {
      Log.e('Failed to log in RevenueCat: $e');
    }
  }

  // Get available products
  Future<List<StoreProduct>> getAvailableProducts() async {
    try {
      final offerings = await Purchases.getOfferings();
      final product = offerings.current
          ?.getPackage(_packageIdLifetime)
          ?.storeProduct;
      return product != null ? [product] : [];

      // This is the old way to get products from product ids - only works for iOS or subscription products
      // final products = await Purchases.getProducts(
      //   Platform.isIOS ? _appleProductIds : _googleProductIds,
      // );
      // return products;
    } catch (e) {
      Log.e('Error getting available products: $e');
      return [];
    }
  }

  // Get current subscription tier for this user
  Future<SubscriptionTier> getUserSubscriptionTier() async {
    try {
      final hasSubscription = await hasActiveSubscription();

      // If user has no active subscription, return basic tier
      if (!hasSubscription) {
        return SubscriptionTier.basic;
      }

      return SubscriptionTier.proMonthly;
    } catch (e) {
      Log.e('Error getting subscription tier: $e');
      return SubscriptionTier.basic;
    }
  }

  // Check if user has active subscription
  Future<bool> hasActiveSubscription() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo.entitlements.active.containsKey(_entitlementIdPro);
    } catch (e) {
      Log.e('Error checking subscription status: $e');
      return false;
    }
  }

  // Purchase a package
  Future<bool> purchaseProduct(StoreProduct product) async {
    try {
      final customerInfo = await Purchases.purchaseStoreProduct(product);
      final activeSubs = customerInfo.entitlements.active;
      return activeSubs.isNotEmpty;
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
