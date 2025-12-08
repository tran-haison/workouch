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
import '../../../../core/widgets/common_text_field.dart';
import '../../../../core/widgets/common_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';

Future<void> showProfileUpdateDialog(
  BuildContext context, {
  required User user,
}) async {
  return await showCommonBottomDialog(
    context,
    child: _ProfileUpdateDialog(user: user),
  );
}

class _ProfileUpdateDialog extends StatefulWidget {
  const _ProfileUpdateDialog({required this.user});

  final User user;

  @override
  State<_ProfileUpdateDialog> createState() => _ProfileUpdateDialogState();
}

class _ProfileUpdateDialogState extends State<_ProfileUpdateDialog> {
  late final TextEditingController _ageController;
  late final TextEditingController _heightController;
  late final TextEditingController _weightController;
  late Gender _selectedGender;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _ageController = TextEditingController();
    _heightController = TextEditingController();
    _weightController = TextEditingController();
    _selectedGender = widget.user.gender;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
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
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppConstants.updateProfile,
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
              Gaps.vGap20,
              // Age
              Text(
                AppConstants.age,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
              Gaps.vGap8,
              CommonTextField(
                controller: _ageController,
                initialValue: widget.user.age.toString(),
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
              Gaps.vGap20,
              // Gender
              Text(
                AppConstants.gender,
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
              Gaps.vGap8,
              Row(
                children: [
                  Expanded(
                    child: _GenderButton(
                      label: AppConstants.male.toUpperCase(),
                      isSelected: _selectedGender == Gender.male,
                      onTap: () {
                        setState(() {
                          _selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Gaps.hGap12,
                  Expanded(
                    child: _GenderButton(
                      label: AppConstants.female.toUpperCase(),
                      isSelected: _selectedGender == Gender.female,
                      onTap: () {
                        setState(() {
                          _selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Gaps.vGap20,
              // Height
              Text(
                '${AppConstants.height} (${AppConstants.cm})',
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
              Gaps.vGap8,
              CommonTextField(
                controller: _heightController,
                initialValue: widget.user.height.toStringAsFixed(0),
                hintText: AppConstants.enterYourHeight,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
                  LengthLimitingTextInputFormatter(6),
                ],
                onChanged: (_) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppConstants.pleaseEnterYourHeight;
                  }
                  final height = double.tryParse(value);
                  if (height == null || height <= 0 || height > 300) {
                    return AppConstants.pleaseEnterAValidHeight;
                  }
                  return null;
                },
                isShowBorder: true,
                borderColor: AppColors.grayBlue,
                borderFocusColor: AppColors.black,
              ),
              Gaps.vGap20,
              // Weight
              Text(
                '${AppConstants.weight} (${AppConstants.kg})',
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w600),
              ),
              Gaps.vGap8,
              CommonTextField(
                controller: _weightController,
                initialValue: widget.user.weight.toStringAsFixed(1),
                hintText: AppConstants.enterYourWeight,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
                  LengthLimitingTextInputFormatter(6),
                ],
                onChanged: (_) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppConstants.pleaseEnterYourWeight;
                  }
                  final weight = double.tryParse(value);
                  if (weight == null || weight <= 0 || weight > 500) {
                    return AppConstants.pleaseEnterAValidWeight;
                  }
                  return null;
                },
                isShowBorder: true,
                borderColor: AppColors.grayBlue,
                borderFocusColor: AppColors.black,
              ),
              Gaps.vGap30,
              CommonButton(text: AppConstants.update, onPressed: _onSave),
              Gaps.vGap20,
            ],
          ),
        ),
      ),
    );
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final age = int.tryParse(_ageController.text) ?? 0;
    final height = double.tryParse(_heightController.text) ?? 0.0;
    final weight = double.tryParse(_weightController.text) ?? 0.0;

    if (age <= 0 || height <= 0 || weight <= 0) {
      return;
    }

    context.read<AuthCubit>().updateUserProfile(
      age: age,
      gender: _selectedGender,
      height: height,
      weight: weight,
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
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.grayBlue,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.h4.copyWith(
              color: isSelected ? AppColors.white : AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
