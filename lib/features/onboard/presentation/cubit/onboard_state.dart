import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extension/double_extension.dart';
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
    MeasurementSystem? measurementSystem,
    Gender? gender,
    int? age,
    @Default(170.0) double heightCm,
    @Default(70.0) double weightKg,
    ActivityLevel? activityLevel,
    Error? error,
  }) = _OnboardState;
}

extension OnboardStateExt on OnboardState {
  double get weightLbs => weightKg.kgToLbs;

  String get displayWeight {
    switch (measurementSystem ?? MeasurementSystem.metric) {
      case MeasurementSystem.metric:
        return '${weightKg.round()} ${AppConstants.kg.toLowerCase()}';
      case MeasurementSystem.imperial:
        return '${weightLbs.round()} ${AppConstants.lbs.toLowerCase()}';
    }
  }
}
