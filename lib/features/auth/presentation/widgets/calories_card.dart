import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:workouch/core/constants/app_constants.dart';
import 'package:workouch/core/theme/app_colors.dart';
import 'package:workouch/core/theme/app_text_styles.dart';
import 'package:workouch/core/widgets/common_gaps.dart';
import 'package:workouch/core/widgets/common_icons.dart';
import 'package:workouch/gen/assets.gen.dart';

/// Macro distribution: Protein 30%, Carb 45%, Fat 25%
/// Calories per gram: Protein 4, Carb 4, Fat 9
const double _proteinRatio = 0.30;
const double _carbRatio = 0.45;
const double _fatRatio = 0.25;
const double _calPerGProtein = 4;
const double _calPerGCarb = 4;
const double _calPerGFat = 9;

class CaloriesCard extends StatelessWidget {
  const CaloriesCard({required this.totalCalories, super.key});

  final double totalCalories;

  @override
  Widget build(BuildContext context) {
    // Calculate target grams from total calories (30% protein, 45% carb, 25% fat)
    final proteinGrams = totalCalories * _proteinRatio / _calPerGProtein;
    final carbGrams = totalCalories * _carbRatio / _calPerGCarb;
    final fatGrams = totalCalories * _fatRatio / _calPerGFat;

    return Container(
      padding: EdgeInsets.all(20.r),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonAssetIcon(
                    Assets.icons.fire,
                    width: 16.r,
                    height: 16.r,
                    color: AppColors.black,
                  ),
                  Gaps.vGap8,
                  Text(
                    AppConstants.calories,
                    style: AppTextStyles.h4.copyWith(
                      color: AppColors.mediumGray,
                    ),
                  ),
                  Gaps.vGap4,
                  Text(
                    '${totalCalories.toStringAsFixed(0)} kcal',
                    style: AppTextStyles.h4.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gaps.hGap16,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _MacroCircularProgress(
                label: AppConstants.protein,
                grams: proteinGrams,
                totalCalories: totalCalories,
                calPerGram: _calPerGProtein,
                color: AppColors.success,
              ),
              Gaps.hGap16,
              _MacroCircularProgress(
                label: AppConstants.carb,
                grams: carbGrams,
                totalCalories: totalCalories,
                calPerGram: _calPerGCarb,
                color: AppColors.blue,
              ),
              Gaps.hGap16,
              _MacroCircularProgress(
                label: AppConstants.fat,
                grams: fatGrams,
                totalCalories: totalCalories,
                calPerGram: _calPerGFat,
                color: AppColors.error,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MacroCircularProgress extends StatelessWidget {
  const _MacroCircularProgress({
    required this.label,
    required this.grams,
    required this.totalCalories,
    required this.calPerGram,
    required this.color,
  });

  final String label;
  final double grams;
  final double totalCalories;
  final double calPerGram;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = 52.r;
    final strokeWidth = 6.r;

    // Progress = calories from this macro / total calories
    final caloriesFromMacro = grams * calPerGram;
    final progress = totalCalories > 0
        ? (caloriesFromMacro / totalCalories).clamp(0.0, 1.0)
        : 0.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size.r,
          height: size.r,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: size.r,
                height: size.r,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: strokeWidth.r,
                  backgroundColor: AppColors.grayBlue,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Text(
                '${grams.toStringAsFixed(0)}g',
                style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Gaps.vGap8,
        Text(label, style: AppTextStyles.h5),
      ],
    );
  }
}
