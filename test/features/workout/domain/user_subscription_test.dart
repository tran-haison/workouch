import 'package:flutter_test/flutter_test.dart';
import 'package:workouch/features/auth/domain/entities/subscription_plan.dart';
import 'package:workouch/features/workout/domain/entities/user_subscription.dart';

void main() {
  group('subscription generation limits', () {
    test('basic accounts receive one generation per period', () {
      expect(SubscriptionTier.basic.workoutGenLimit, 1);
    });

    test('all Pro tiers receive fifty generations per period', () {
      expect(SubscriptionTier.proMonthly.workoutGenLimit, 50);
      expect(SubscriptionTier.proYearly.workoutGenLimit, 50);
      expect(SubscriptionTier.proLifetime.workoutGenLimit, 50);
    });

    test('remaining generations never becomes negative', () {
      final subscription = UserSubscription.defaults(
        workoutGenLimit: 1,
        workoutGenUsed: 3,
      );

      expect(subscription.remainingWorkoutGen, 0);
      expect(subscription.hasWorkoutGenRemaining, isFalse);
    });

    test('reports remaining capacity', () {
      final subscription = UserSubscription.defaults(
        workoutGenLimit: 50,
        workoutGenUsed: 12,
      );

      expect(subscription.remainingWorkoutGen, 38);
      expect(subscription.hasWorkoutGenRemaining, isTrue);
    });
  });
}
