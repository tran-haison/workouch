import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:workouch/core/constants/app_constants.dart';
import 'package:workouch/core/theme/app_colors.dart';
import 'package:workouch/core/theme/app_text_styles.dart';
import 'package:workouch/core/widgets/common_gaps.dart';
import 'package:workouch/core/widgets/common_icons.dart';
import 'package:workouch/gen/assets.gen.dart';

import '../../domain/entities/bmi.dart';

/// BMI ranges (WHO): Underweight <18.5, Normal 18.5-24.9, Overweight 25-29.9, Obese ≥30
const double _bmiMin = 15;
const double _bmiMax = 40;

class BmiCard extends StatelessWidget {
  const BmiCard({required this.bmi, super.key});

  final double bmi;

  @override
  Widget build(BuildContext context) {
    final clampedBmi = bmi.clamp(_bmiMin, _bmiMax);
    final position = (clampedBmi - _bmiMin) / (_bmiMax - _bmiMin);

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grayBlue,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CommonAssetIcon(
                Assets.icons.heart,
                width: 20.r,
                height: 20.r,
                color: AppColors.black,
              ),
              Gaps.hGap8,
              Text(
                AppConstants.bmi,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                bmi.toStringAsFixed(1),
                style: AppTextStyles.anton.copyWith(
                  fontSize: 20.sp,
                  color: BmiStatusExt.fromBmi(bmi).color,
                ),
              ),
            ],
          ),
          Gaps.vGap16,
          LayoutBuilder(
            builder: (context, constraints) {
              final trackWidth = constraints.maxWidth;
              final trackHeight = 12.h;
              const cursorWidth = 3.0;
              final cursorLeft = (trackWidth * position - cursorWidth / 2)
                  .clamp(0.0, trackWidth - cursorWidth);

              return SizedBox(
                width: trackWidth,
                height: trackHeight,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Color-coded scale track
                    Container(
                      height: trackHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(trackHeight / 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(trackHeight / 2),
                        child: Row(
                          children: [
                            _ScaleSegment(
                              flex: _segmentFlex(
                                BmiStatus.underweight.min,
                                BmiStatus.underweight.max,
                              ),
                              color: BmiStatus.underweight.color,
                            ),
                            _ScaleSegment(
                              flex: _segmentFlex(
                                BmiStatus.normal.min,
                                BmiStatus.normal.max,
                              ),
                              color: BmiStatus.normal.color,
                            ),
                            _ScaleSegment(
                              flex: _segmentFlex(
                                BmiStatus.overweight.min,
                                BmiStatus.overweight.max,
                              ),
                              color: BmiStatus.overweight.color,
                            ),
                            _ScaleSegment(
                              flex: _segmentFlex(
                                BmiStatus.obese.min,
                                BmiStatus.obese.max,
                              ),
                              color: BmiStatus.obese.color,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Cursor - vertical line
                    Positioned(
                      left: cursorLeft,
                      top: -trackHeight / 2,
                      child: Container(
                        width: cursorWidth,
                        height: trackHeight * 2,
                        decoration: BoxDecoration(
                          color: AppColors.darkBlack,
                          borderRadius: BorderRadius.circular(cursorWidth / 2),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Gaps.vGap16,
          Wrap(
            spacing: 8.w,
            runSpacing: 12.h,
            children: [
              _BmiScaleInfo(status: BmiStatus.underweight),
              _BmiScaleInfo(status: BmiStatus.normal),
              _BmiScaleInfo(status: BmiStatus.overweight),
              _BmiScaleInfo(status: BmiStatus.obese),
            ],
          ),
          Gaps.vGap16,
          _BmiStatusGuidance(status: BmiStatusExt.fromBmi(bmi)),
        ],
      ),
    );
  }

  int _segmentFlex(double start, double end) {
    return ((end - start) / (_bmiMax - _bmiMin) * 100).round();
  }
}

class _BmiStatusGuidance extends StatelessWidget {
  const _BmiStatusGuidance({required this.status});

  final BmiStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, instruction) = switch (status) {
      BmiStatus.underweight => (
        AppConstants.bmiUnderweight,
        AppConstants.bmiUnderweightInstruction,
      ),
      BmiStatus.normal => (
        AppConstants.bmiNormal,
        AppConstants.bmiNormalInstruction,
      ),
      BmiStatus.overweight => (
        AppConstants.bmiOverweight,
        AppConstants.bmiOverweightInstruction,
      ),
      BmiStatus.obese => (
        AppConstants.bmiObese,
        AppConstants.bmiObeseInstruction,
      ),
    };

    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${AppConstants.bmiYouAreIn}$label',
            style: AppTextStyles.h5.copyWith(
              fontWeight: FontWeight.w600,
              color: status.color,
            ),
          ),
          Gaps.vGap4,
          Text(instruction, style: AppTextStyles.h6),
        ],
      ),
    );
  }
}

class _BmiScaleInfo extends StatelessWidget {
  const _BmiScaleInfo({required this.status});

  final BmiStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10.r,
          height: 10.r,
          decoration: BoxDecoration(
            color: status.color,
            shape: BoxShape.circle,
          ),
        ),
        Gaps.hGap4,
        Text(status.label, style: AppTextStyles.h6),
      ],
    );
  }
}

class _ScaleSegment extends StatelessWidget {
  const _ScaleSegment({required this.flex, required this.color});

  final int flex;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(color: color),
    );
  }
}
