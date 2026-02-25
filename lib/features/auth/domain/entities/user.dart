import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/extension/double_extension.dart';
import '../../../../core/utils/health_utils.dart';
import 'bmi.dart';
import 'subscription_plan.dart';
import '../../../workout/domain/enums/activity_level.dart';

part 'user.freezed.dart';

enum Gender { male, female }

enum MeasurementSystem { metric, imperial }

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
    @Default(0.0) double heightCm,
    @Default(0.0) double weightKg,
    @Default(MeasurementSystem.metric) MeasurementSystem measurementSystem,
    @Default(ActivityLevel.sedentary) ActivityLevel activityLevel,
    @Default(SubscriptionTier.basic) SubscriptionTier subscriptionTier,
    @Default(false) bool hasOnboard,
  }) = _User;
}

extension UserExtension on User {
  double get bmi {
    if (heightCm == 0 || weightKg == 0) return 0;
    return weightKg / pow(heightCm * 0.01, 2); // in kg/m^2
  }

  BmiStatus get bmiStatus => BmiStatusExt.fromBmi(bmi);

  double get calories => HealthUtils.calculateTDEEFromUserParams(
    gender: gender,
    weightKg: weightKg,
    heightCm: heightCm,
    age: age,
    activityLevel: activityLevel,
  );

  String get displayCalories {
    return '${calories.toStringAsFixed(0)} ${AppConstants.kcal.toLowerCase()}';
  }

  double get heightIn {
    return heightCm.cmToIn;
  }

  double get weightLbs {
    return weightKg.kgToLbs;
  }

  double get height {
    switch (measurementSystem) {
      case MeasurementSystem.metric:
        return heightCm;
      case MeasurementSystem.imperial:
        return heightIn;
    }
  }

  double get weight {
    switch (measurementSystem) {
      case MeasurementSystem.metric:
        return weightKg;
      case MeasurementSystem.imperial:
        return weightLbs;
    }
  }

  String get displayHeight {
    switch (measurementSystem) {
      case MeasurementSystem.metric:
        return '${heightCm.round()} ${AppConstants.cm.toLowerCase()}';
      case MeasurementSystem.imperial:
        // Display as feet and inches (example: 5'10")
        final feet = heightIn ~/ 12;
        final inches = heightIn % 12;
        return '$feet\'${inches.round()}';
    }
  }

  String get displayWeight {
    switch (measurementSystem) {
      case MeasurementSystem.metric:
        return '${weightKg.round()} ${AppConstants.kg.toLowerCase()}';
      case MeasurementSystem.imperial:
        return '${weightLbs.round()} ${AppConstants.lbs.toLowerCase()}';
    }
  }

  bool get hasBasicHealthInfo => age > 0 && height > 0 && weight > 0;
}

extension GenderExt on Gender {
  bool get isMale => this == Gender.male;

  bool get isFemale => this == Gender.female;
}

extension MeasurementSystemExt on MeasurementSystem {
  bool get isMetric => this == MeasurementSystem.metric;

  bool get isImperial => this == MeasurementSystem.imperial;
}
