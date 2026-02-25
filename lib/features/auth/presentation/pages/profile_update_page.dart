import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:workouch/core/widgets/common_loading_dialog.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_bottom_dialog.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../core/widgets/height_spinner.dart';
import '../../../../core/widgets/weight_spinner.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/user.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../../../workout/domain/enums/activity_level.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();

  late Gender _gender;
  late MeasurementSystem _measurementSystem;
  late ActivityLevel _activityLevel;
  late double _heightCm;
  late double _weightKg;

  @override
  void initState() {
    super.initState();

    final user = context.read<AuthCubit>().state.currentUser;
    _gender = user?.gender ?? Gender.male;
    _measurementSystem = user?.measurementSystem ?? MeasurementSystem.metric;
    _activityLevel = user?.activityLevel ?? ActivityLevel.moderatelyActive;
    _heightCm = user?.heightCm ?? 170.0;
    _weightKg = user?.weightKg ?? 70.0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStateStatus.loading) {
          context.showLoadingDialog();
        } else {
          context.hideLoadingDialog();
        }

        if (state.status == AuthStateStatus.authenticated &&
            state.currentUser != null) {
          showCommonToast(AppConstants.updateProfileSuccess);
          context.pop();
          return;
        }

        if (state.status == AuthStateStatus.error) {
          showCommonToast(
            state.error?.message ?? AppConstants.updateProfileError,
            isError: true,
          );
        }
      },

      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Row(
                      children: [
                        CommonIconButton(
                          backgroundColor: AppColors.grayBlue,
                          icon: Assets.icons.arrowBack,
                          iconColor: AppColors.black,
                          onTap: () => context.pop(),
                        ),
                        Gaps.hGap16,
                        Expanded(
                          child: Text(
                            AppConstants.updateProfile,
                            style: AppTextStyles.h3.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Gaps.hGap16,
                        CommonIconButton(
                          backgroundColor: AppColors.darkBlack,
                          icon: Assets.icons.check,
                          iconColor: AppColors.white,
                          onTap: _onSave,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        left: 20.w,
                        right: 20.w,
                        bottom: 30.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _TitleWidget(
                            title: AppConstants.age,
                            icon: Assets.icons.calendar,
                          ),
                          Gaps.vGap12,
                          CommonTextField(
                            controller: _ageController,
                            initialValue:
                                state.currentUser?.age.toString() ?? '',
                            hintText: AppConstants.enterYourAge,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            onChanged: (_) {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppConstants.pleaseEnterYourAge;
                              }
                              final age = int.tryParse(value);
                              if (age == null || age <= 0 || age > 150) {
                                return AppConstants.pleaseEnterAValidAge;
                              }
                              return null;
                            },
                            isShowBorder: true,
                            borderColor: AppColors.grayBlue,
                            borderFocusColor: AppColors.black,
                          ),
                          Gaps.vGap30,
                          _TitleWidget(
                            title: AppConstants.gender,
                            icon: Assets.icons.gender,
                          ),
                          Gaps.vGap12,
                          Row(
                            children: [
                              Expanded(
                                child: _GenderButton(
                                  label: AppConstants.male,
                                  isSelected: _gender.isMale,
                                  onTap: () {
                                    setState(() {
                                      _gender = Gender.male;
                                    });
                                  },
                                ),
                              ),
                              Gaps.hGap12,
                              Expanded(
                                child: _GenderButton(
                                  label: AppConstants.female,
                                  isSelected: _gender.isFemale,
                                  onTap: () {
                                    setState(() {
                                      _gender = Gender.female;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Gaps.vGap30,
                          _TitleWidget(
                            title: AppConstants.measurementSystem,
                            icon: Assets.icons.systemCoordinate,
                          ),
                          Gaps.vGap12,
                          Row(
                            children: [
                              Expanded(
                                child: _MeasurementSystemButton(
                                  label: AppConstants.metric,
                                  isSelected: _measurementSystem.isMetric,
                                  onTap: () {
                                    setState(() {
                                      _measurementSystem =
                                          MeasurementSystem.metric;
                                    });
                                  },
                                ),
                              ),
                              Gaps.hGap12,
                              Expanded(
                                child: _MeasurementSystemButton(
                                  label: AppConstants.imperial,
                                  isSelected: _measurementSystem.isImperial,
                                  onTap: () {
                                    setState(() {
                                      _measurementSystem =
                                          MeasurementSystem.imperial;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Gaps.vGap30,
                          _TitleWidget(
                            title: AppConstants.height,
                            icon: Assets.icons.height,
                          ),
                          Gaps.vGap12,
                          HeightSpinner(
                            measurementSystem: _measurementSystem,
                            initialHeightCm: _heightCm,
                            onHeightChanged: (heightCm) {
                              setState(() {
                                _heightCm = heightCm;
                              });
                            },
                          ),
                          Gaps.vGap30,
                          _TitleWidget(
                            title: AppConstants.weight,
                            icon: Assets.icons.weight,
                          ),
                          Gaps.vGap12,
                          WeightSpinner(
                            measurementSystem: _measurementSystem,
                            initialWeightKg: _weightKg,
                            onWeightChanged: (weightKg) {
                              setState(() {
                                _weightKg = weightKg;
                              });
                            },
                          ),
                          Gaps.vGap30,
                          _TitleWidget(
                            title: AppConstants.activityLevel,
                            icon: Assets.icons.lightning,
                          ),
                          Gaps.vGap12,
                          CommonButton(
                            text: _activityLevel.description,
                            onPressed: _updateActivityLevel,
                            isFullWidth: true,
                            textStyle: AppTextStyles.h4.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            borderColor: AppColors.grayBlue,
                            backgroundColor: AppColors.white,
                            trailing: CommonAssetIcon(
                              Assets.icons.arrowDown,
                              width: 16.r,
                              height: 16.r,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final age = int.tryParse(_ageController.text) ?? 0;
    if (age <= 0 || _heightCm <= 0 || _weightKg <= 0) {
      return;
    }

    context.read<AuthCubit>().updateUserProfile(
      age: age,
      gender: _gender,
      heightCm: _heightCm,
      weightKg: _weightKg,
      measurementSystem: _measurementSystem,
      activityLevel: _activityLevel,
    );
  }

  Future<void> _updateActivityLevel() async {
    final selected = await _showActivityLevelDialog(_activityLevel);

    if (mounted && selected is ActivityLevel) {
      setState(() {
        _activityLevel = selected;
      });
    }
  }

  Future<dynamic> _showActivityLevelDialog(ActivityLevel activityLevel) async {
    return await showCommonBottomDialog(
      context,
      child: _ActivityLevelSelectionDialog(
        selectedActivityLevel: activityLevel,
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({required this.title, required this.icon});

  final String title;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonAssetIcon(
          icon,
          width: 20.r,
          height: 20.r,
          color: AppColors.black,
        ),
        Gaps.hGap10,
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _ActivityLevelSelectionDialog extends StatelessWidget {
  const _ActivityLevelSelectionDialog({required this.selectedActivityLevel});

  final ActivityLevel selectedActivityLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(AppConstants.activityLevel, style: AppTextStyles.h3),
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
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: ActivityLevel.values.length,
            itemBuilder: (context, index) {
              final level = ActivityLevel.values[index];
              final isSelected = level == selectedActivityLevel;

              return InkWell(
                onTap: () => context.pop(level),
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.secondary
                        : AppColors.transparent,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.secondary
                          : AppColors.grayBlue,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              level.title,
                              style: AppTextStyles.h4.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gaps.vGap4,
                            Text(
                              level.description,
                              style: AppTextStyles.h5.copyWith(
                                color: AppColors.mediumGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isSelected) ...[
                        Gaps.hGap12,
                        CommonAssetIcon(
                          Assets.icons.check,
                          width: 20.r,
                          height: 20.r,
                          color: AppColors.black,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, _) => Gaps.vGap12,
          ),
        ),
        Gaps.vGap20,
      ],
    );
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.darkBlack : AppColors.grayBlue,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.h4.copyWith(
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class _MeasurementSystemButton extends StatelessWidget {
  const _MeasurementSystemButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.darkBlack : AppColors.grayBlue,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.h4.copyWith(
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
