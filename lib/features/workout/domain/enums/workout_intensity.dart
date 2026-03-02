import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../gen/assets.gen.dart';

/// Workout intensity levels
enum WorkoutIntensity {
  low(AppConstants.lowIntensity),
  medium(AppConstants.mediumIntensity),
  high(AppConstants.highIntensity);

  const WorkoutIntensity(this.label);

  final String label;
}

extension WorkoutIntensityExt on WorkoutIntensity {
  SvgGenImage get icon => switch (this) {
    WorkoutIntensity.low => Assets.icons.arrowUp1,
    WorkoutIntensity.medium => Assets.icons.arrowUp2,
    WorkoutIntensity.high => Assets.icons.arrowUp3,
  };

  Color get iconColor => switch (this) {
    WorkoutIntensity.low => AppColors.yellow,
    WorkoutIntensity.medium => AppColors.orange,
    WorkoutIntensity.high => AppColors.error,
  };
}
