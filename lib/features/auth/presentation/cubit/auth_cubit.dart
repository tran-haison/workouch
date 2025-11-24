import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repo.dart';
import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(const AuthState()) {
    _getCurrentUser();
  }

  /// Get current user
  Future<void> _getCurrentUser() async {
    emit(state.copyWith(status: AuthStateStatus.loading, error: null));
    final res = await _authRepo.getCurrentUser();
    res.fold(
      (error) => emit(
        state.copyWith(
          status: AuthStateStatus.unauthenticated,
          currentUser: null,
        ),
      ),
      (user) => emit(
        state.copyWith(
          status: AuthStateStatus.authenticated,
          currentUser: user,
        ),
      ),
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
          await _getCurrentUser();
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
          await _getCurrentUser();
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
          await _getCurrentUser();
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
}
