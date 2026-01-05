import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/subscription_plan.dart';

part 'user_subscription.freezed.dart';

@freezed
class UserSubscription with _$UserSubscription {
  const UserSubscription._();

  const factory UserSubscription({
    required String id,
    required String userId,
    required SubscriptionTier subscriptionTier,
    required int workoutGenLimit,
    required int workoutGenUsed,
    required DateTime periodStart,
    required DateTime periodEnd,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserSubscription;

  factory UserSubscription.defaults({
    String id = '',
    String userId = '',
    SubscriptionTier subscriptionTier = SubscriptionTier.basic,
    int workoutGenLimit = 1,
    int workoutGenUsed = 0,
    DateTime? periodStart,
    DateTime? periodEnd,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserSubscription(
      id: id,
      userId: userId,
      subscriptionTier: subscriptionTier,
      workoutGenLimit: workoutGenLimit,
      workoutGenUsed: workoutGenUsed,
      periodStart: periodStart ?? DateTime.now(),
      periodEnd: periodEnd ?? DateTime.now().add(const Duration(days: 30)),
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}

extension UserSubscriptionExtension on UserSubscription {
  int get remainingWorkoutGen => workoutGenLimit - workoutGenUsed;

  bool get hasWorkoutGenRemaining => workoutGenUsed < workoutGenLimit;
}
