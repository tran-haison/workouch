import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/log.dart';
import '../../domain/entities/user.dart' as app_user;
import '../models/dtos/user_dto.dart';

@lazySingleton
class SupabaseAuthService {
  final _supabase = Supabase.instance.client;
  final _googleSignIn = GoogleSignIn(
    clientId: AppConstants.supabase.iosClientId,
    serverClientId: AppConstants.supabase.webClientId,
  );

  // Get current Supabase user
  User? get _currentUser => _supabase.auth.currentUser;

  // Check if user is authenticated
  bool get isAuthenticated => _currentUser != null;

  // Stream of auth state changes
  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;

  /// Fetch the current user from Supabase `public.users` table.
  Future<app_user.User?> getCurrentUser() async {
    final user = _currentUser;
    if (user == null) return null;

    try {
      final res = await _supabase
          .from(AppConstants.supabase.tableUsers)
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (res == null) return null;

      return UserDto.fromJson(res).toEntity();
    } catch (e) {
      Log.e('Error fetching current user: $e');
      rethrow;
    }
  }

  // Sign in with email and password
  Future<bool> signInWithEmail(String email, String password) async {
    try {
      final res = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return res.user != null;
    } catch (e) {
      Log.e('Error signing in with email: $e');
      return false;
    }
  }

  // Sign in with Google
  Future<bool> signInWithGoogle() async {
    try {
      final googleAccount = await _googleSignIn.signIn();
      if (googleAccount == null) {
        throw 'Failed to sign in with Google';
      }

      final googleAuth = await googleAccount.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null || idToken == null) {
        throw 'No access token or id token found';
      }

      final res = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      return res.user != null;
    } catch (e) {
      Log.e('Error signing in with Google: $e');
      return false;
    }
  }

  // Sign in with Apple
  Future<bool> signInWithApple() async {
    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        final res = await _supabase.auth.signInWithOAuth(
          OAuthProvider.apple,
          authScreenLaunchMode: LaunchMode.externalApplication,
        );

        return res;
      }

      // iOS only
      // Check if Sign in with Apple is available
      final isAvailable = await SignInWithApple.isAvailable();
      if (!isAvailable) {
        throw 'Sign in with Apple is not available on this device';
      }

      final rawNonce = _supabase.auth.generateRawNonce();
      final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

      // Request Apple ID credential
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: hashedNonce,
      );

      // Get the identity token
      final idToken = credential.identityToken;
      if (idToken == null) {
        throw 'No identity token received from Apple';
      }

      // Sign in with Supabase using Apple ID token
      final res = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.apple,
        idToken: idToken,
        nonce: rawNonce,
      );

      // Apple only provides the user's full name on the first sign-in
      // Save it to user metadata if available
      if (credential.givenName != null || credential.familyName != null) {
        try {
          final fullName =
              '${credential.givenName ?? ''} ${credential.familyName ?? ''}'
                  .trim();
          await _supabase.auth.updateUser(
            UserAttributes(
              data: {
                'full_name': fullName,
                'given_name': credential.givenName,
                'family_name': credential.familyName,
              },
            ),
          );
        } catch (e) {
          Log.e('Error updating user metadata: $e');
        }
      }

      return res.user != null;
    } catch (e) {
      Log.e('Error signing in with Apple: $e');
      return false;
    }
  }

  /// Update user profile
  Future<bool> updateUserProfile(app_user.User user) async {
    final dto = UserDto.fromEntity(user);
    final data = {
      'age': dto.age,
      'gender': dto.gender,
      'height': dto.height,
      'weight': dto.weight,
      'activity_level': dto.activityLevel,
    };

    try {
      await _supabase
          .from(AppConstants.supabase.tableUsers)
          .update(data)
          .eq('id', user.id);

      return true;
    } catch (e) {
      Log.e('Error updating user profile: $e');
      return false;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _supabase.auth.signOut();
    } catch (e) {
      Log.e('Sign out error: $e');
      rethrow;
    }
  }
}
