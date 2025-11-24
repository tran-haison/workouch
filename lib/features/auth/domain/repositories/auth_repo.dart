import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/error.dart';
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
  Future<Either<Error, void>> signOut();
}

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final SupabaseAuthService _authService;

  AuthRepoImpl(this._authService);

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
  Future<Either<Error, void>> signOut() async {
    try {
      await _authService.signOut();
      return const Right(null);
    } catch (e) {
      return Left(handleException(e));
    }
  }
}
