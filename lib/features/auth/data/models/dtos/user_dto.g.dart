// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      avatarUrl: json['avatar_url'] as String,
      gender: json['gender'] as String,
      age: (json['age'] as num).toInt(),
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      activityLevel: json['activity_level'] as String,
      subscriptionTier: json['subscription_tier'] as String,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'gender': instance.gender,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'activity_level': instance.activityLevel,
      'subscription_tier': instance.subscriptionTier,
    };
