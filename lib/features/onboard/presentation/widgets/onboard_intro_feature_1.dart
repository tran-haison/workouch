import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';

class OnboardIntroFeature1 extends StatelessWidget {
  const OnboardIntroFeature1({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate available width
        // Padding is 20.r on each side, so 40.r total horizontal padding
        // Gap between images is 20.w
        final screenWidth = MediaQuery.of(context).size.width;
        final horizontalPadding = 40.r;
        final gapWidth = 40.w;
        final availableWidth = screenWidth - horizontalPadding - gapWidth;

        // Split width: left image gets 45%, right image gets 40%
        final leftImageWidth = availableWidth * 0.45;
        final rightImageWidth = availableWidth * 0.4;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.imgPhoneSample1.image(
              width: leftImageWidth,
              fit: BoxFit.contain,
            ),
            Gaps.hGap10,
            CommonAssetIcon(
              Assets.icons.arrowRightWide,
              width: 20.r,
              height: 20.r,
              color: AppColors.black,
            ),
            Gaps.hGap10,
            Assets.images.imgPhoneSample2.image(
              width: rightImageWidth,
              fit: BoxFit.contain,
            ),
          ],
        );
      },
    );
  }
}
