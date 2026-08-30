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
    if (res.isLeft) {
      emit(
        state.copyWith(
          status: AuthStateStatus.unauthenticated,
          currentUser: null,
        ),
      );
      return;
    }

    final user = res.right;
    await _subRepo.login(user.id);
    // RevenueCat is verified by the server; the client cannot grant itself a
    // paid tier or increase its generation allowance.
    await _authRepo.syncUserSubscription();
    final refreshedUser = await _authRepo.getCurrentUser();
    final updatedUser = refreshedUser.isRight ? refreshedUser.right : user;

    await _authRepo.signInPosthog(updatedUser);
    await getUserSubscription();

    emit(
      state.copyWith(
        status: AuthStateStatus.authenticated,
        currentUser: updatedUser,
      ),
    );
  }

  Future<void> getUserSubscription() async {
    final res = await _authRepo.getUserSubscription();
    res.fold(
      (_) => emit(state.copyWith(userSubscription: null)),
      (sub) => emit(state.copyWith(userSubscription: sub)),
    );
  }

  /// Sign in with Google
  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: AuthStateStatus.loading, error: null));
    final res = await _authRepo.signInWithGoogle();
    if (res.isLeft) {
      emit(state.copyWith(status: AuthStateStatus.error, error: res.left));
    } else if (res.right) {
      await initUser();
    } else {
      emit(state.copyWith(status: AuthStateStatus.error));
    }
  }

  /// Sign in with Apple
  Future<void> signInWithApple() async {
    emit(state.copyWith(status: AuthStateStatus.loading, error: null));
    final res = await _authRepo.signInWithApple();
    if (res.isLeft) {
      emit(state.copyWith(status: AuthStateStatus.error, error: res.left));
    } else if (res.right) {
      await initUser();
    } else {
      emit(state.copyWith(status: AuthStateStatus.error));
    }
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
    if (res.isLeft) {
      emit(state.copyWith(status: AuthStateStatus.error, error: res.left));
    } else if (res.right) {
      await initUser();
    } else {
      emit(state.copyWith(status: AuthStateStatus.error));
    }
  }

  /// Update user profile
  Future<void> updateUserProfile({
    int? age,
    Gender? gender,
    double? heightCm,
    double? weightKg,
    MeasurementSystem? measurementSystem,
    ActivityLevel? activityLevel,
    bool? hasOnboard,
  }) async {
    if (state.currentUser == null) return;

    emit(state.copyWith(status: AuthStateStatus.loading, error: null));

    final user = state.currentUser!.copyWith(
      age: age ?? state.currentUser!.age,
      gender: gender ?? state.currentUser!.gender,
      heightCm: heightCm ?? state.currentUser!.heightCm,
      weightKg: weightKg ?? state.currentUser!.weightKg,
      measurementSystem:
          measurementSystem ?? state.currentUser!.measurementSystem,
      activityLevel: activityLevel ?? state.currentUser!.activityLevel,
      hasOnboard: hasOnboard ?? state.currentUser!.hasOnboard,
    );
    final res = await _authRepo.updateUserProfile(user);

    if (res.isLeft) {
      emit(state.copyWith(status: AuthStateStatus.error, error: res.left));
    } else if (res.right) {
      await initUser();
    } else {
      emit(state.copyWith(status: AuthStateStatus.error));
    }
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
    if (res.isLeft) {
      emit(
        state.copyWith(
          status: AuthStateStatus.purchaseSubError,
          error: res.left,
        ),
      );
      return;
    }

    final success = res.right;
    if (success) {
      await _authRepo.syncUserSubscription();
      await getUserSubscription();
    }
    emit(
      state.copyWith(
        status: success
            ? AuthStateStatus.purchaseSubSuccess
            : AuthStateStatus.purchaseSubError,
        error: null,
      ),
    );
  }

  Future<void> restoreSubscription() async {
    emit(state.copyWith(status: AuthStateStatus.loading, error: null));
    final res = await _subRepo.restorePurchases();
    if (res.isLeft) {
      emit(
        state.copyWith(
          status: AuthStateStatus.restoreSubError,
          error: res.left,
        ),
      );
      return;
    }

    final success = res.right;
    if (success) {
      await _authRepo.syncUserSubscription();
      await getUserSubscription();
    }
    emit(
      state.copyWith(
        status: success
            ? AuthStateStatus.restoreSubSuccess
            : AuthStateStatus.restoreSubError,
        error: null,
      ),
    );
  }
}
