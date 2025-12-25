import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../profile/domain/entities/subscription_plan.dart';
import '../../../../workout/domain/enums/activity_level.dart';
import '../../../domain/entities/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserDto({
    required String id,
    required String email,
    required String fullName,
    required String avatarUrl,
    required String gender,
    required int age,
    required double height, // in cm
    required double weight, // in kg
    required String activityLevel,
    required String subscriptionTier,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  factory UserDto.fromEntity(User entity) {
    return UserDto(
      id: entity.id,
      email: entity.email,
      fullName: entity.fullName,
      avatarUrl: entity.avatarUrl,
      gender: entity.gender.name,
      age: entity.age,
      height: entity.height,
      weight: entity.weight,
      activityLevel: entity.activityLevel.name,
      subscriptionTier: entity.subscriptionTier.name,
    );
  }
}

extension UserDtoExtension on UserDto {
  User toEntity() {
    return User(
      id: id,
      email: email,
      fullName: fullName,
      avatarUrl: avatarUrl,
      gender: Gender.values.firstWhere((e) => e.name == gender),
      age: age,
      height: height,
      weight: weight,
      activityLevel: ActivityLevel.values.firstWhere(
        (e) => e.name == activityLevel,
        orElse: () => ActivityLevel.sedentary,
      ),
      subscriptionTier: SubscriptionTier.values.firstWhere(
        (e) => e.name == subscriptionTier,
        orElse: () => SubscriptionTier.basic,
      ),
    );
  }
}
