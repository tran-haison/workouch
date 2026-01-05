// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSubscriptionDtoImpl _$$UserSubscriptionDtoImplFromJson(
  Map<String, dynamic> json,
) => _$UserSubscriptionDtoImpl(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  subscriptionTier: json['subscription_tier'] as String,
  workoutGenLimit: (json['workout_gen_limit'] as num).toInt(),
  workoutGenUsed: (json['workout_gen_used'] as num).toInt(),
  periodStart: json['period_start'] as String,
  periodEnd: json['period_end'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$$UserSubscriptionDtoImplToJson(
  _$UserSubscriptionDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'subscription_tier': instance.subscriptionTier,
  'workout_gen_limit': instance.workoutGenLimit,
  'workout_gen_used': instance.workoutGenUsed,
  'period_start': instance.periodStart,
  'period_end': instance.periodEnd,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
