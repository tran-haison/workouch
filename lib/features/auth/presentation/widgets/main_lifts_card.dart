import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/widgets/common_images.dart';
import 'package:workouch/core/widgets/common_loading_dialog.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extension/double_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_bottom_dialog.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../workout/domain/enums/main_lift.dart';
import '../../../workout/presentation/cubit/workout_cubit.dart';
import '../../../workout/presentation/cubit/workout_state.dart';
import '../../../workout_session/domain/entities/exercise_personal_record.dart';
import '../../domain/entities/user.dart';

class MainLiftsCard extends StatelessWidget {
  const MainLiftsCard({required this.system, super.key});

  final MeasurementSystem system;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      buildWhen: (prev, curr) =>
          prev.mainLiftPersonalRecords != curr.mainLiftPersonalRecords,
      builder: (context, state) {
        final records = state.mainLiftPersonalRecords;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    AppConstants.mainLifts,
                    style: AppTextStyles.h4.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Gaps.hGap10,
                CommonIconButton(
                  icon: Assets.icons.edit,
                  iconSize: 16.r,
                  iconColor: AppColors.black,
                  padding: EdgeInsets.all(8.r),
                  backgroundColor: AppColors.grayBlue,
                  onTap: () => _showEditDialog(context, records),
                ),
              ],
            ),
            Gaps.vGap10,
            if (records.isEmpty)
              Text(
                AppConstants.noDataYet,
                style: AppTextStyles.h5.copyWith(color: AppColors.mediumGray),
              )
            else
              Container(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 20.h,
                  bottom: 10.h,
                ),
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
                  children: [
                    ...MainLift.values.map((lift) {
                      final value = _formatMainLiftValue(records[lift]);

                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          children: [
                            CommonNetworkImage(
                              url: lift.gifUrl,
                              width: 40.r,
                              height: 40.r,
                              backgroundColor: AppColors.transparent,
                            ),
                            Gaps.hGap12,
                            Expanded(
                              child: Text(
                                lift.label,
                                style: AppTextStyles.h4.copyWith(
                                  color: AppColors.mediumGray,
                                ),
                              ),
                            ),
                            Gaps.hGap10,
                            Text(
                              value,
                              style: AppTextStyles.h4.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  String _formatMainLiftValue(ExercisePersonalRecord? pr) {
    if (pr == null || pr.maxWeightKg <= 0) {
      return '-';
    }
    return pr.maxWeightWithUnit(system);
  }

  Future<void> _showEditDialog(
    BuildContext context,
    Map<MainLift, ExercisePersonalRecord?> records,
  ) async {
    await showCommonBottomDialog(
      context,
      child: _MainLiftsEditDialog(system: system, records: records),
    );
  }
}

class _MainLiftsEditDialog extends StatefulWidget {
  const _MainLiftsEditDialog({required this.system, required this.records});

  final MeasurementSystem system;
  final Map<MainLift, ExercisePersonalRecord?> records;

  @override
  State<_MainLiftsEditDialog> createState() => _MainLiftsEditDialogState();
}

class _MainLiftsEditDialogState extends State<_MainLiftsEditDialog> {
  late final Map<MainLift, TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();

    // Init controllers
    _controllers = {
      for (final lift in MainLift.values) lift: TextEditingController(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutCubit, WorkoutState>(
      listenWhen: (prev, curr) =>
          prev.upsertMainLiftPersonalRecordStatus !=
          curr.upsertMainLiftPersonalRecordStatus,
      listener: (context, state) {
        if (state.upsertMainLiftPersonalRecordStatus ==
            WorkoutStateStatus.loading) {
          context.showLoadingDialog(message: AppConstants.saving);
        } else {
          context.hideLoadingDialog();
        }

        if (state.upsertMainLiftPersonalRecordStatus ==
            WorkoutStateStatus.success) {
          context.read<WorkoutCubit>().getMainLiftPersonalRecords();
          context.pop();
        }
      },
      builder: (context, state) {
        final records = state.mainLiftPersonalRecords;

        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      AppConstants.mainLifts,
                      style: AppTextStyles.h3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Gaps.hGap10,
                  CommonIconButton(
                    icon: Assets.icons.close,
                    iconSize: 20.r,
                    padding: EdgeInsets.all(8.r),
                    iconColor: AppColors.black,
                    backgroundColor: AppColors.grayBlue,
                    onTap: () => context.pop(),
                  ),
                ],
              ),
              Gaps.vGap16,
              ...MainLift.values.map(
                (lift) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lift.label,
                        style: AppTextStyles.h4.copyWith(
                          color: AppColors.mediumGray,
                        ),
                      ),
                      Gaps.vGap6,
                      CommonTextField(
                        controller: _controllers[lift],
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        hintText: '',
                        suffix: Text(
                          (widget.system.isMetric
                                  ? AppConstants.kg
                                  : AppConstants.lbs)
                              .toLowerCase(),
                          style: AppTextStyles.h5.copyWith(
                            color: AppColors.mediumGray,
                          ),
                        ),
                        isShowBorder: true,
                        initialValue: _initialTextForLift(records[lift]),
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.vGap20,
              CommonButton(text: AppConstants.confirm, onPressed: _onSave),
            ],
          ),
        );
      },
    );
  }

  String _initialTextForLift(ExercisePersonalRecord? pr) {
    if (pr == null || pr.maxWeightKg <= 0) return '';
    return pr.maxWeightString(widget.system);
  }

  Future<void> _onSave() async {
    final newRecords = <MainLift, double>{};

    for (final entry in _controllers.entries) {
      final text = entry.value.text.trim();
      if (text.isEmpty) continue;

      final weight = double.tryParse(text);
      if (weight == null || weight <= 0) continue;

      newRecords[entry.key] = widget.system.isMetric ? weight : weight.lbsToKg;
    }

    await context.read<WorkoutCubit>().upsertMainLiftPersonalRecords(
      newRecords: newRecords,
    );
  }
}
