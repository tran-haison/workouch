import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _User;
}

extension UserExtension on User {
  double get bmi {
    if (height == 0 || weight == 0) return 0;
    return weight / pow(height * 0.01, 2); // in kg/m^2
  }

  double get calories => weight * 1.036 * 24 * 60; // in kcal
}
