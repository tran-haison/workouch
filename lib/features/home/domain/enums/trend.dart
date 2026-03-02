import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../gen/assets.gen.dart';

enum Trend { up, down, same }

extension TrendExt on Trend {
  SvgGenImage get icon {
    return switch (this) {
      Trend.up => Assets.icons.arrowUpDiagonal,
      Trend.down => Assets.icons.arrowDownDiagonal,
      Trend.same => Assets.icons.equal,
    };
  }

  Color get color {
    return switch (this) {
      Trend.up => AppColors.success,
      Trend.down => AppColors.error,
      Trend.same => AppColors.mediumGray,
    };
  }
}
