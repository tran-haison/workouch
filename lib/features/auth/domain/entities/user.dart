import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/health_utils.dart';
import '../../../profile/domain/entities/subscription_plan.dart';
import '../../../workout/domain/enums/activity_level.dart';

part 'user.freezed.dart';

enum Gender { male, female }

@freezed
class User with _$User {
  const User._();

  const factory User({
    @Default('') String id,
    @Default('') String email,
    @Default('') String fullName,
    @Default('') String avatarUrl,
    @Default(Gender.male) Gender gender,
    @Default(0) int age,
    @Default(0.0) double height, // in cm
    @Default(0.0) double weight, // in kg
    @Default(ActivityLevel.sedentary) ActivityLevel activityLevel,
    @Default(SubscriptionTier.basic) SubscriptionTier subscriptionTier,
  }) = _User;
}

extension UserExtension on User {
  double get bmi {
    if (height == 0 || weight == 0) return 0;
    return weight / pow(height * 0.01, 2); // in kg/m^2
  }

  double get calories => HealthUtils.calculateTDEEFromUserParams(
    gender: gender,
    weight: weight,
    height: height,
    age: age,
    activityLevel: activityLevel,
  );
}

extension GenderExt on Gender {
  bool get isMale => this == Gender.male;

  bool get isFemale => this == Gender.female;
}
