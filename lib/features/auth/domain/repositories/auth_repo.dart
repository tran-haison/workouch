import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/posthog_analytics_service.dart';
import '../../../../core/utils/error.dart';
import '../../../workout/domain/entities/user_subscription.dart';
import '../../data/services/supabase_auth_service.dart';
import '../entities/user.dart';

abstract class AuthRepo {
  bool get isAuthenticated;
  Stream<dynamic> get authStateChanges;
  Future<Either<Error, User>> getCurrentUser();
  Future<Either<Error, bool>> signInWithGoogle();
  Future<Either<Error, bool>> signInWithApple();
  Future<Either<Error, bool>> signInWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Error, bool>> updateUserProfile(User user);
  Future<Either<Error, bool>> syncUserSubscription();
  Future<Either<Error, UserSubscription>> getUserSubscription();
  Future<Either<Error, void>> signOut();
  Future<Either<Error, void>> signInPosthog(User user);
}

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final SupabaseAuthService _authService;
  final PostHogAnalyticsService _posthogService;

  AuthRepoImpl(this._authService, this._posthogService);

  @override
  bool get isAuthenticated => _authService.isAuthenticated;

  @override
  Stream<dynamic> get authStateChanges => _authService.authStateChanges;

  @override
  Future<Either<Error, User>> getCurrentUser() async {
    try {
      final user = await _authService.getCurrentUser();
      if (user != null) {
        return Right(user);
      }
      return Left(
        Error(message: AppConstants.userNotFound, errorType: ErrorType.other),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, bool>> signInWithGoogle() async {
    try {
      final success = await _authService.signInWithGoogle();
      if (success) {
        return const Right(true);
      }
      return Left(
        Error(message: AppConstants.signInError, errorType: ErrorType.other),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, bool>> signInWithApple() async {
    try {
      final success = await _authService.signInWithApple();
      if (success) {
        return const Right(true);
      }
      return Left(
        Error(message: AppConstants.signInError, errorType: ErrorType.other),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, bool>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final success = await _authService.signInWithEmail(email, password);
      if (success) {
        return const Right(true);
      }
      return Left(
        Error(message: AppConstants.signInError, errorType: ErrorType.other),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, bool>> updateUserProfile(User user) async {
    try {
      final success = await _authService.updateUserProfile(user);
      if (success) {
        return const Right(true);
      }
      return Left(
        Error(
          message: AppConstants.updateProfileError,
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, bool>> syncUserSubscription() async {
    try {
      final success = await _authService.syncUserSubscription();
      if (success) {
        return const Right(true);
      }
      return Left(
        Error(
          message: 'Failed to verify your subscription',
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, UserSubscription>> getUserSubscription() async {
    try {
      final subscription = await _authService.getUserSubscription();
      if (subscription != null) {
        return Right(subscription);
      }
      return Left(
        Error(
          message: AppConstants.userSubscriptionNotFound,
          errorType: ErrorType.other,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, void>> signOut() async {
    try {
      await _authService.signOut();
      await _posthogService.reset();
      return const Right(null);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, void>> signInPosthog(User user) async {
    try {
      await _posthogService.identify(
        userId: user.id,
        properties: {
          'subscription_tier': user.subscriptionTier.name,
          'has_onboard': user.hasOnboard,
        },
      );
      return const Right(null);
    } catch (e) {
      return Left(handleException(e));
    }
  }
}
