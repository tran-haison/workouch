import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/error.dart';
import '../../domain/entities/user.dart';

part 'auth_state.freezed.dart';

enum AuthStateStatus { initial, loading, unauthenticated, authenticated, error }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStateStatus.initial) AuthStateStatus status,
    User? currentUser,
    Error? error,
  }) = _AuthState;
}
