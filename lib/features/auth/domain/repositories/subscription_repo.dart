import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../../core/services/posthog_analytics_service.dart';
import '../../../../core/services/subscription_service.dart';
import '../../../../core/utils/error.dart';
import '../entities/subscription_plan.dart';

abstract class SubscriptionRepo {
  Future<Either<Error, void>> initialize({String? userId});
  Future<Either<Error, void>> login(String userId);
  Future<Either<Error, List<Package>>> getAvailablePackages();
  Future<Either<Error, SubscriptionTier>> getUserSubscriptionTier();
  Future<Either<Error, bool>> purchase(Package package);
  Future<Either<Error, bool>> restorePurchases();
}

@LazySingleton(as: SubscriptionRepo)
class SubscriptionRepoImpl implements SubscriptionRepo {
  final SubscriptionService _subscriptionService;
  final PostHogAnalyticsService _posthogService;

  SubscriptionRepoImpl(this._subscriptionService, this._posthogService);

  @override
  Future<Either<Error, void>> initialize({String? userId}) async {
    try {
      await _subscriptionService.initialize(userId: userId);
      return const Right(null);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, void>> login(String userId) async {
    try {
      await _subscriptionService.login(userId);
      return const Right(null);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, List<Package>>> getAvailablePackages() async {
    try {
      final packages = await _subscriptionService.getAvailablePackages();
      if (packages.isNotEmpty) {
        return Right(packages);
      }
      return Left(
        Error(message: 'No packages found', errorType: ErrorType.other),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, SubscriptionTier>> getUserSubscriptionTier() async {
    try {
      final tier = await _subscriptionService.getUserSubscriptionTier();
      return Right(tier);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, bool>> purchase(Package package) async {
    try {
      // Track purchase attempt
      await _posthogService.capture(
        PostHogAnalyticsService.eventSubscriptionPurchaseStarted,
        properties: {'package_id': package.identifier},
      );

      final success = await _subscriptionService.purchase(package);
      if (success) {
        await _posthogService.capture(
          PostHogAnalyticsService.eventSubscriptionPurchaseSucceeded,
          properties: {'package_id': package.identifier},
        );
        return const Right(true);
      }
      await _posthogService.capture(
        PostHogAnalyticsService.eventSubscriptionPurchaseFailed,
        properties: {'package_id': package.identifier},
      );
      return Left(
        Error(
          message: 'Purchase failed. Please try again.',
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      final error = handleException(e);
      await _posthogService.capture(
        PostHogAnalyticsService.eventSubscriptionPurchaseFailed,
        properties: {'package_id': package.identifier, 'error': error.message},
      );
      return Left(error);
    }
  }

  @override
  Future<Either<Error, bool>> restorePurchases() async {
    try {
      // Track restore attempt
      await _posthogService.capture(
        PostHogAnalyticsService.eventSubscriptionRestoreStarted,
      );

      final success = await _subscriptionService.restorePurchases();
      if (success) {
        await _posthogService.capture(
          PostHogAnalyticsService.eventSubscriptionRestoreSucceeded,
        );
        return const Right(true);
      }
      await _posthogService.capture(
        PostHogAnalyticsService.eventSubscriptionRestoreFailed,
      );
      return Left(
        Error(
          message: 'No purchases found to restore',
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      final error = handleException(e);
      await _posthogService.capture(
        PostHogAnalyticsService.eventSubscriptionRestoreFailed,
        properties: {'error': error.message},
      );
      return Left(error);
    }
  }
}
