import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../workout/domain/enums/main_lift.dart';
import '../../../../core/extension/double_extension.dart';
import '../cubit/onboard_cubit.dart';
import '../cubit/onboard_state.dart';

class OnboardMainLiftsPage extends StatefulWidget {
  const OnboardMainLiftsPage({super.key});

  @override
  State<OnboardMainLiftsPage> createState() => _OnboardMainLiftsPageState();
}

class _OnboardMainLiftsPageState extends State<OnboardMainLiftsPage> {
  late final Map<MainLift, TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = {
      for (final lift in MainLift.values) lift: TextEditingController(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        final system = state.measurementSystem ?? MeasurementSystem.metric;
        final records = state.mainLiftRecords;

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.vGap40,
                  CommonIconButton(
                    icon: Assets.icons.arrowBack,
                    iconColor: AppColors.black,
                    backgroundColor: AppColors.transparent,
                    onTap: () => context.read<OnboardCubit>().previousPage(),
                  ),
                  Gaps.vGap40,
                  Text(
                    AppConstants.mainLifts,
                    style: AppTextStyles.h0.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.vGap8,
                  Text(
                    AppConstants.onboardMainLiftsDescription,
                    style: AppTextStyles.h4.copyWith(
                      color: AppColors.mediumGray,
                    ),
                  ),
                  Gaps.vGap30,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: MainLift.values.map((lift) {
                          final controller = _controllers[lift]!;

                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(lift.label, style: AppTextStyles.h4),
                                Gaps.vGap6,
                                CommonTextField(
                                  controller: controller,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                  hintText: '',
                                  suffix: Text(
                                    (system.isMetric
                                            ? AppConstants.kg
                                            : AppConstants.lbs)
                                        .toLowerCase(),
                                    style: AppTextStyles.h5.copyWith(
                                      color: AppColors.mediumGray,
                                    ),
                                  ),
                                  isShowBorder: true,
                                  initialValue: _initialTextForLift(
                                    system: system,
                                    weightKg: records[lift],
                                  ),
                                  onChanged: (_) {},
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Gaps.vGap20,
                  CommonButton(
                    text: AppConstants.next,
                    onPressed: () => _handleNext(system),
                    textStyle: AppTextStyles.h3.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.w,
                      vertical: 16.h,
                    ),
                  ),
                  Gaps.vGap40,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _initialTextForLift({
    required MeasurementSystem system,
    double? weightKg,
  }) {
    if (weightKg == null || weightKg <= 0) return '';
    return system.isMetric
        ? weightKg.toStringAsFixed(1)
        : weightKg.kgToLbs.round().toString();
  }

  Future<void> _handleNext(MeasurementSystem system) async {
    final newRecords = <MainLift, double>{};

    for (final entry in _controllers.entries) {
      final text = entry.value.text.trim();
      if (text.isEmpty) continue;

      final weight = double.tryParse(text);
      if (weight == null || weight <= 0) continue;

      newRecords[entry.key] = system.isMetric ? weight : weight.lbsToKg;
    }

    context.read<OnboardCubit>().updateMainLiftRecords(newRecords);
    context.read<OnboardCubit>().nextPage();
  }
}
