import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/error.dart';
import '../../../workout/domain/enums/activity_level.dart';
import '../../../auth/domain/entities/user.dart';

part 'onboard_state.freezed.dart';

enum OnboardStateStatus { initial, loading, success, error }

@freezed
class OnboardState with _$OnboardState {
  const factory OnboardState({
    @Default(OnboardStateStatus.initial) OnboardStateStatus status,
    @Default(0) int currentPage,
    Gender? gender,
    int? age,
    double? height,
    double? weight,
    ActivityLevel? activityLevel,
    Error? error,
  }) = _OnboardState;
}
