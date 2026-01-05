import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/entities/subscription_plan.dart';
import '../../../domain/entities/user_subscription.dart';

part 'user_subscription_dto.freezed.dart';
part 'user_subscription_dto.g.dart';

@freezed
abstract class UserSubscriptionDto with _$UserSubscriptionDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserSubscriptionDto({
    required String id,
    required String userId,
    required String subscriptionTier,
    required int workoutGenLimit,
    required int workoutGenUsed,
    required String periodStart,
    required String periodEnd,
    required String createdAt,
    required String updatedAt,
  }) = _UserSubscriptionDto;

  factory UserSubscriptionDto.fromJson(Map<String, dynamic> json) =>
      _$UserSubscriptionDtoFromJson(json);

  factory UserSubscriptionDto.fromEntity(UserSubscription entity) {
    return UserSubscriptionDto(
      id: entity.id,
      userId: entity.userId,
      subscriptionTier: entity.subscriptionTier.name,
      workoutGenLimit: entity.workoutGenLimit,
      workoutGenUsed: entity.workoutGenUsed,
      periodStart: entity.periodStart.toUtc().toIso8601String(),
      periodEnd: entity.periodEnd.toUtc().toIso8601String(),
      createdAt: entity.createdAt.toUtc().toIso8601String(),
      updatedAt: entity.updatedAt.toUtc().toIso8601String(),
    );
  }
}

extension UserSubscriptionDtoExtension on UserSubscriptionDto {
  UserSubscription toEntity() {
    return UserSubscription(
      id: id,
      userId: userId,
      subscriptionTier: subscriptionTierEnum,
      workoutGenLimit: workoutGenLimit,
      workoutGenUsed: workoutGenUsed,
      periodStart: DateTime.parse(periodStart).toLocal(),
      periodEnd: DateTime.parse(periodEnd).toLocal(),
      createdAt: DateTime.parse(createdAt).toLocal(),
      updatedAt: DateTime.parse(updatedAt).toLocal(),
    );
  }

  SubscriptionTier get subscriptionTierEnum {
    return SubscriptionTier.values.firstWhere(
      (tier) => tier.name == subscriptionTier,
      orElse: () => SubscriptionTier.basic,
    );
  }
}
