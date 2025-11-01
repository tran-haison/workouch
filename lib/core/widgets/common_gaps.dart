import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class Gaps {
  const Gaps._();

  /// Blank space between items in row
  static final hGap2 = SizedBox(width: 2.w);
  static final hGap4 = SizedBox(width: 4.w);
  static final hGap6 = SizedBox(width: 6.w);
  static final hGap8 = SizedBox(width: 8.w);
  static final hGap10 = SizedBox(width: 10.w);
  static final hGap12 = SizedBox(width: 12.w);
  static final hGap16 = SizedBox(width: 16.w);
  static final hGap20 = SizedBox(width: 20.w);
  static final hGap24 = SizedBox(width: 24.w);
  static final hGap30 = SizedBox(width: 30.w);
  static final hGap32 = SizedBox(width: 32.w);
  static final hGap40 = SizedBox(width: 40.w);
  static final hGap80 = SizedBox(width: 80.w);
  static SizedBox hGap(double width) => SizedBox(width: width);

  /// Blank space between items in column
  static final vGap2 = SizedBox(height: 2.h);
  static final vGap4 = SizedBox(height: 4.h);
  static final vGap6 = SizedBox(height: 6.h);
  static final vGap8 = SizedBox(height: 8.h);
  static final vGap10 = SizedBox(height: 10.h);
  static final vGap12 = SizedBox(height: 12.h);
  static final vGap16 = SizedBox(height: 16.h);
  static final vGap20 = SizedBox(height: 20.h);
  static final vGap24 = SizedBox(height: 24.h);
  static final vGap30 = SizedBox(height: 30.h);
  static final vGap32 = SizedBox(height: 32.h);
  static final vGap40 = SizedBox(height: 40.h);
  static final vGap80 = SizedBox(height: 80.h);
  static final vGap100 = SizedBox(height: 100.h);
  static SizedBox vGap(double height) => SizedBox(height: height);

  /// Horizontal line
  static final hLine = SizedBox(
    height: 1.5.h,
    width: 1.sw,
    child: const DecoratedBox(
      decoration: BoxDecoration(color: AppColors.mediumGray),
    ),
  );

  /// Vertical line
  static final vLine = SizedBox(
    width: 1.5.w,
    height: 1.sh,
    child: const DecoratedBox(
      decoration: BoxDecoration(color: AppColors.mediumGray),
    ),
  );

  /// Space between items in row, calculate by percent
  SizedBox hGapPercent([double percent = 0.1]) =>
      SizedBox(width: ScreenUtil().screenWidth * percent);

  /// Space between items in column, calculate by percent
  SizedBox vGapPercent([double percent = 0.1]) =>
      SizedBox(height: ScreenUtil().screenHeight * percent);

  static const Divider line = Divider();
  static const empty = SizedBox.shrink();
}
