import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

import '../constants/app_constants.dart';
import '../di/injection.dart';
import '../utils/log.dart';

@lazySingleton
class PostHogAnalyticsService {
  PostHogAnalyticsService();

  /// Initialize PostHog analytics
  Future<void> initialize() async {
    try {
      final config = PostHogConfig(AppConstants.posthog.apiKey);

      // Set host if provided
      if (AppConstants.posthog.host.isNotEmpty) {
        config.host = AppConstants.posthog.host;
      }

      // Enable debug mode in development
      config.debug = kDebugMode;

      // Capture application lifecycle events (app open, close, etc.)
      config.captureApplicationLifecycleEvents = true;

      // Optional: Enable session replay (uncomment if needed)
      // config.sessionReplay = true;

      await Posthog().setup(config);

      Log.i('PostHog analytics initialized successfully');
    } catch (e) {
      Log.e('Failed to initialize PostHog analytics: $e');
    }
  }

  /// Identify a user with their unique ID and properties
  Future<void> identify({
    required String userId,
    Map<String, dynamic>? properties,
  }) async {
    try {
      final posthog = Posthog();

      // Identify the user
      await posthog.identify(userId: userId);

      // Set properties separately if provided using register
      if (properties != null && properties.isNotEmpty) {
        final objectProperties = properties.map(
          (key, value) => MapEntry(key, value as Object),
        );
        // Register properties to be sent with all future events
        for (final entry in objectProperties.entries) {
          await posthog.register(entry.key, entry.value);
        }
      }
    } catch (e) {
      Log.e('Failed to identify user in PostHog: $e');
    }
  }

  /// Capture an event with optional properties
  Future<void> capture(
    String eventName, {
    Map<String, dynamic>? properties,
  }) async {
    try {
      final posthog = Posthog();

      if (properties != null && properties.isNotEmpty) {
        final objectProperties = properties.map(
          (key, value) => MapEntry(key, value as Object),
        );
        await posthog.capture(
          eventName: eventName,
          properties: objectProperties,
        );
      } else {
        await posthog.capture(eventName: eventName);
      }
    } catch (e) {
      Log.e('Failed to capture event in PostHog: $e');
    }
  }

  /// Set user properties that will be attached to all future events
  Future<void> setUserProperties(Map<String, dynamic> properties) async {
    try {
      final posthog = Posthog();
      final objectProperties = properties.map(
        (key, value) => MapEntry(key, value as Object),
      );
      // Register properties to be sent with all future events
      for (final entry in objectProperties.entries) {
        await posthog.register(entry.key, entry.value);
      }
    } catch (e) {
      Log.e('Failed to set user properties in PostHog: $e');
    }
  }

  /// Reset the user identification (call on logout)
  Future<void> reset() async {
    try {
      await Posthog().reset();
    } catch (e) {
      Log.e('Failed to reset PostHog user: $e');
    }
  }

  /// Check if a feature flag is enabled
  Future<bool> isFeatureEnabled(String flagKey) async {
    try {
      return await Posthog().isFeatureEnabled(flagKey);
    } catch (e) {
      Log.e('Failed to check feature flag in PostHog: $e');
      return false;
    }
  }

  /// Get feature flag value
  Future<dynamic> getFeatureFlag(String flagKey) async {
    try {
      return await Posthog().getFeatureFlag(flagKey);
    } catch (e) {
      Log.e('Failed to get feature flag in PostHog: $e');
      return null;
    }
  }
}

class PosthogService {
  static const String eventOnboardingStarted = 'onboarding_started';
  static const String eventOnboardingStepReached = 'onboarding_step_reached';
  static const String eventOnboardingCompleted = 'onboarding_completed';
  static const String eventSubscriptionPurchaseSuccess =
      'subscription_purchase_succeeded';
  static const String eventSubscriptionPurchaseFailed =
      'subscription_purchase_failed';
  static const String eventSubscriptionRestoreSuccess =
      'subscription_restore_succeeded';
  static const String eventSubscriptionRestoreFailed =
      'subscription_restore_failed';
  static const String eventWorkoutGeneratedSuccessShuffle =
      'workout_generated_success_shuffle';
  static const String eventWorkoutGeneratedSuccessNeat =
      'workout_generated_success_neat';
  static const String eventWorkoutGeneratedFailed = 'workout_generated_failed';
  static const String eventWorkoutStarted = 'workout_started';
  static const String eventWorkoutCompleted = 'workout_completed';

  static Future<void> logOnboardingStarted() async {
    await getIt<PostHogAnalyticsService>().capture(eventOnboardingStarted);
  }

  static Future<void> logOnboardingStepReached(int step) async {
    await getIt<PostHogAnalyticsService>().capture(
      eventOnboardingStepReached,
      properties: {'step': step},
    );
  }

  static Future<void> logOnboardingCompleted() async {
    await getIt<PostHogAnalyticsService>().capture(eventOnboardingCompleted);
  }

  static Future<void> logSubscriptionPurchaseSuccess(String packageId) async {
    await getIt<PostHogAnalyticsService>().capture(
      eventSubscriptionPurchaseSuccess,
      properties: {'package_id': packageId},
    );
  }

  static Future<void> logSubscriptionPurchaseFailed(
    String packageId, {
    String? errorMessage,
  }) async {
    await getIt<PostHogAnalyticsService>().capture(
      eventSubscriptionPurchaseFailed,
      properties: {
        'package_id': packageId,
        if (errorMessage != null) 'error_message': errorMessage,
      },
    );
  }

  static Future<void> logSubscriptionRestoreSuccess() async {
    await getIt<PostHogAnalyticsService>().capture(
      eventSubscriptionRestoreSuccess,
    );
  }

  static Future<void> logSubscriptionRestoreFailed({
    String? errorMessage,
  }) async {
    await getIt<PostHogAnalyticsService>().capture(
      eventSubscriptionRestoreFailed,
      properties: {if (errorMessage != null) 'error_message': errorMessage},
    );
  }

  static Future<void> logWorkoutGeneratedSuccessShuffle() async {
    await getIt<PostHogAnalyticsService>().capture(
      eventWorkoutGeneratedSuccessShuffle,
    );
  }

  static Future<void> logWorkoutGeneratedSuccessNeat() async {
    await getIt<PostHogAnalyticsService>().capture(
      eventWorkoutGeneratedSuccessNeat,
    );
  }

  static Future<void> logWorkoutGeneratedFailed({String? errorMessage}) async {
    await getIt<PostHogAnalyticsService>().capture(
      eventWorkoutGeneratedFailed,
      properties: {if (errorMessage != null) 'error_message': errorMessage},
    );
  }

  static Future<void> logWorkoutStarted() async {
    await getIt<PostHogAnalyticsService>().capture(eventWorkoutStarted);
  }

  static Future<void> logWorkoutCompleted() async {
    await getIt<PostHogAnalyticsService>().capture(eventWorkoutCompleted);
  }
}
