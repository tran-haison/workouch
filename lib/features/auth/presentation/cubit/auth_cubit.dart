import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../workout/domain/enums/activity_level.dart';
import '../../domain/entities/subscription_plan.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/repositories/subscription_repo.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  final SubscriptionRepo _subRepo;

  AuthCubit(this._authRepo, this._subRepo) : super(const AuthState()) {
    initUser();
    _getAvailableSubPackages();
  }

  Future<void> initUser() async {
    emit(state.copyWith(status: AuthStateStatus.loading, error: null));

    /// Get current user
    final res = await _authRepo.getCurrentUser();
    res.fold(
      (error) => emit(
        state.copyWith(
          status: AuthStateStatus.unauthenticated,
          currentUser: null,
        ),
      ),
      (user) async {
        // Login to RevenueCat
        await _subRepo.login(user.id);
        var updatedUser = user;

        // Sync user subscription from RevenueCat if it has changed
        final resUserSub = await _subRepo.getUserSubscriptionTier();
        if (resUserSub.isRight && resUserSub.right != user.subscriptionTier) {
          updatedUser = updatedUser.copyWith(
            subscriptionTier: resUserSub.right,
          );
          await _authRepo.updateUserProfile(updatedUser);
        }

        emit(
          state.copyWith(
            status: AuthStateStatus.authenticated,
            currentUser: updatedUser,
          ),
        );
      },
    );
  }

  /// Sign in with Google
  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: AuthStateStatus.loading, error: null));
    final res = await _authRepo.signInWithGoogle();
    res.fold(
      (error) =>
          emit(state.copyWith(status: AuthStateStatus.error, error: error)),
      (success) async {
        if (success) {
          // Get current user after successful sign in
          await initUser();
        } else {
          emit(state.copyWith(status: AuthStateStatus.error));
        }
      },
    );
  }

  /// Sign in with Apple
  Future<void> signInWithApple() async {
    emit(state.copyWith(status: AuthStateStatus.loading, error: null));
    final res = await _authRepo.signInWithApple();
    res.fold(
      (error) =>
          emit(state.copyWith(status: AuthStateStatus.error, error: error)),
      (success) async {
        if (success) {
          // Get current user after successful sign in
          await initUser();
        } else {
          emit(state.copyWith(status: AuthStateStatus.error));
        }
      },
    );
  }

  /// Sign in with email and password
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStateStatus.loading, error: null));
    final res = await _authRepo.signInWithEmail(
      email: email,
      password: password,
    );
    res.fold(
      (error) =>
          emit(state.copyWith(status: AuthStateStatus.error, error: error)),
      (success) async {
        if (success) {
          // Get current user after successful sign in
          await initUser();
        } else {
          emit(state.copyWith(status: AuthStateStatus.error));
        }
      },
    );
  }

  /// Update user profile
  Future<void> updateUserProfile({
    int? age,
    Gender? gender,
    double? height,
    double? weight,
    ActivityLevel? activityLevel,
  }) async {
    if (state.currentUser == null) return;

    emit(state.copyWith(status: AuthStateStatus.loading, error: null));

    final user = state.currentUser!.copyWith(
      age: age ?? state.currentUser!.age,
      gender: gender ?? state.currentUser!.gender,
      height: height ?? state.currentUser!.height,
      weight: weight ?? state.currentUser!.weight,
      activityLevel: activityLevel ?? state.currentUser!.activityLevel,
    );
    final res = await _authRepo.updateUserProfile(user);

    res.fold(
      (error) =>
          emit(state.copyWith(status: AuthStateStatus.error, error: error)),
      (success) async {
        if (success) {
          // Refresh user data after successful update
          await initUser();
        } else {
          emit(state.copyWith(status: AuthStateStatus.error));
        }
      },
    );
  }

  /// Sign out
  Future<void> signOut() async {
    emit(state.copyWith(status: AuthStateStatus.loading, error: null));
    final res = await _authRepo.signOut();
    res.fold(
      (error) =>
          emit(state.copyWith(status: AuthStateStatus.error, error: error)),
      (_) => emit(
        state.copyWith(
          status: AuthStateStatus.unauthenticated,
          error: null,
          currentUser: null,
        ),
      ),
    );
  }

  /// Get available subscription packages
  Future<void> _getAvailableSubPackages() async {
    final res = await _subRepo.getAvailablePackages();
    res.fold(
      (_) => emit(state.copyWith(availablePackages: [])),
      (packages) => emit(state.copyWith(availablePackages: packages)),
    );
  }

  Future<void> purchaseSubscription(SubscriptionTier tier) async {
    emit(state.copyWith(status: AuthStateStatus.loading, error: null));

    // Get the subscription plan for this tier to get the packageId
    final plan = tier.plan;

    // Find the matching Package by comparing package identifier with plan's packageId
    final package = state.availablePackages.firstWhere(
      (pkg) => pkg.identifier == plan.packageId,
      orElse: () => throw StateError(
        'Package not found for tier ${tier.name}. Please ensure packages are loaded.',
      ),
    );

    final res = await _subRepo.purchase(package);
    res.fold(
      (error) => emit(
        state.copyWith(status: AuthStateStatus.purchaseSubError, error: error),
      ),
      (success) => emit(
        state.copyWith(
          status: success
              ? AuthStateStatus.purchaseSubSuccess
              : AuthStateStatus.purchaseSubError,
          error: null,
        ),
      ),
    );
  }

  Future<void> restoreSubscription() async {
    emit(state.copyWith(status: AuthStateStatus.loading, error: null));
    final res = await _subRepo.restorePurchases();
    res.fold(
      (error) => emit(
        state.copyWith(status: AuthStateStatus.restoreSubError, error: error),
      ),
      (success) => emit(
        state.copyWith(
          status: success
              ? AuthStateStatus.restoreSubSuccess
              : AuthStateStatus.restoreSubError,
          error: null,
        ),
      ),
    );
  }
}
