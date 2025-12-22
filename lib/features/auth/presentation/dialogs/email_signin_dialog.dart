import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_bottom_dialog.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

Future<void> showEmailSignInDialog(BuildContext context) async {
  return await showCommonBottomDialog(
    context,
    child: const _EmailSignInDialog(),
  );
}

class _EmailSignInDialog extends StatefulWidget {
  const _EmailSignInDialog();

  @override
  State<_EmailSignInDialog> createState() => _EmailSignInDialogState();
}

class _EmailSignInDialogState extends State<_EmailSignInDialog> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStateStatus.authenticated) {
          context.pop();
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
                      AppConstants.continueWithEmail,
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
              Text(AppConstants.email, style: AppTextStyles.h4),
              Gaps.vGap8,
              CommonTextField(
                controller: _emailController,
                hintText: AppConstants.emailHint,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: _validateEmail,
                autofillHints: const [AutofillHints.email],
                onChanged: (value) {},
              ),
              Gaps.vGap16,
              Text(AppConstants.password, style: AppTextStyles.h4),
              Gaps.vGap8,
              CommonTextField(
                controller: _passwordController,
                hintText: AppConstants.passwordHint,
                obscureText: true,
                isShowPasswordIcon: true,
                textInputAction: TextInputAction.done,
                validator: _validatePassword,
                autofillHints: const [AutofillHints.password],
                onChanged: (value) {},
              ),
              Gaps.vGap24,
              CommonButton(
                text: AppConstants.continueWithEmail,
                onPressed: _handleSignIn,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppConstants.pleaseEnterYourEmail;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return AppConstants.pleaseEnterAValidEmail;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppConstants.pleaseEnterYourPassword;
    }
    return null;
  }

  void _handleSignIn() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().signInWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }
}
