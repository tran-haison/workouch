import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../firebase_options.dart';
import '../utils/log.dart';

@lazySingleton
class FirebaseService {
  /// Initialize Firebase services
  Future<void> initialize({required bool analyticsEnabled}) async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await setTelemetryEnabled(analyticsEnabled);
      _configureErrorHandlers();
    } catch (e) {
      Log.e('Failed to initialize Firebase: $e');
    }
  }

  void _configureErrorHandlers() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    };

    // Set up error handling for async errors
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  Future<void> setTelemetryEnabled(bool enabled) async {
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(enabled);
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(enabled);
  }

  /// Log an error to Crashlytics
  Future<void> logError(
    dynamic error,
    StackTrace? stackTrace, {
    String? reason,
    Map<String, dynamic>? additionalData,
    bool fatal = false,
  }) async {
    try {
      if (reason != null) {
        await FirebaseCrashlytics.instance.setCustomKey('error_reason', reason);
      }

      if (additionalData != null) {
        for (final entry in additionalData.entries) {
          await FirebaseCrashlytics.instance.setCustomKey(
            entry.key,
            entry.value.toString(),
          );
        }
      }

      await FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        fatal: fatal,
      );
    } catch (e) {
      Log.e('Failed to log error to Crashlytics: $e');
    }
  }

  /// Set user identifier for crash reports
  Future<void> setUserIdentifier(String userId) async {
    try {
      await FirebaseCrashlytics.instance.setUserIdentifier(userId);
    } catch (e) {
      Log.e('Failed to set user identifier: $e');
    }
  }

  /// Set custom keys for crash reports
  Future<void> setCustomKey(String key, dynamic value) async {
    try {
      await FirebaseCrashlytics.instance.setCustomKey(key, value);
    } catch (e) {
      Log.e('Failed to set custom key: $e');
    }
  }

  /// Log a message to Crashlytics
  Future<void> log(String message) async {
    try {
      await FirebaseCrashlytics.instance.log(message);
    } catch (e) {
      Log.e('Failed to log message to Crashlytics: $e');
    }
  }

  /// Test crash (for development only)
  Future<void> testCrash() async {
    try {
      if (kDebugMode) {
        FirebaseCrashlytics.instance.crash();
      }
    } catch (e) {
      Log.e('Failed to test crash: $e');
    }
  }
}
