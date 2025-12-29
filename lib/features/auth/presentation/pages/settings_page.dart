import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_icons.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/auth_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final String _appVersion = '1.0.0+3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: AppColors.grayBlue,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: CommonAssetIcon(
                        Assets.icons.arrowBack,
                        width: 20.r,
                        height: 20.r,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  Gaps.hGap16,
                  Text(
                    AppConstants.settings,
                    style: AppTextStyles.h0.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Account Section
                    _SettingsSection(
                      title: AppConstants.account,
                      items: [
                        _SettingsItem(
                          icon: Assets.icons.rocket,
                          title: AppConstants.subscriptionPlans,
                          onTap: () {
                            context.pushNamed(AppRoute.subscription.name);
                          },
                        ),
                        _SettingsItem(
                          icon: Assets.icons.delete,
                          title: AppConstants.deleteAccount,
                          titleColor: AppColors.errorDark,
                          onTap: () => _handleDeleteAccount(context),
                        ),
                      ],
                    ),
                    Gaps.vGap24,
                    // Legal Section
                    _SettingsSection(
                      title: AppConstants.legal,
                      items: [
                        _SettingsItem(
                          icon: Assets.icons.info,
                          title: AppConstants.termsAndConditions,
                          onTap: () => _handleTermsAndConditions(context),
                        ),
                        _SettingsItem(
                          icon: Assets.icons.info,
                          title: AppConstants.privacyPolicy,
                          onTap: () => _handlePrivacyPolicy(context),
                        ),
                        _SettingsItem(
                          icon: Assets.icons.info,
                          title: AppConstants.support,
                          onTap: () => _handleSupport(context),
                        ),
                      ],
                    ),
                    Gaps.vGap24,
                    // About Section
                    _SettingsSection(
                      title: AppConstants.about,
                      items: [
                        _SettingsItem(
                          icon: Assets.icons.user,
                          title: AppConstants.contactUs,
                          onTap: () => _handleContactUs(context),
                        ),
                        _SettingsItem(
                          icon: Assets.icons.info,
                          title: AppConstants.version,
                          trailing: Text(
                            _appVersion,
                            style: AppTextStyles.h5.copyWith(
                              color: AppColors.mediumGray,
                            ),
                          ),
                          onTap: () {
                            // Copy version to clipboard
                            Clipboard.setData(ClipboardData(text: _appVersion));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Version $_appVersion copied to clipboard',
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Gaps.vGap40,
                  ],
                ),
              ),
            ),
            CommonButton(
              text: AppConstants.signOut,
              backgroundColor: AppColors.errorDark,
              onPressed: () => _signOut(context),
            ),
            Gaps.vGap40,
          ],
        ),
      ),
    );
  }

  Future<void> _handleDeleteAccount(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppConstants.deleteAccount),
        content: Text(AppConstants.deleteAccountConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(AppConstants.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.errorDark),
            child: Text(AppConstants.confirm),
          ),
        ],
      ),
    );

    if (confirm == true && context.mounted) {
      // TODO: Open delete account form URL
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Delete account form coming soon')),
      );
    }
  }

  Future<void> _handleTermsAndConditions(BuildContext context) async {
    // TODO: Implement terms and conditions page or URL
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Terms and Conditions coming soon')),
    );
  }

  Future<void> _handlePrivacyPolicy(BuildContext context) async {
    // TODO: Implement privacy policy page or URL
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Privacy Policy coming soon')));
  }

  Future<void> _handleSupport(BuildContext context) async {
    // TODO: Implement support page or URL
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Support coming soon')));
  }

  Future<void> _handleContactUs(BuildContext context) async {
    // TODO: Implement contact us page or email
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Contact Us coming soon')));
  }

  Future<void> _signOut(BuildContext context) async {
    await context.read<AuthCubit>().signOut();
    if (context.mounted) {
      context.goNamed(AppRoute.signIn.name);
    }
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title, required this.items});

  final String title;
  final List<_SettingsItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
          child: Text(
            title.toUpperCase(),
            style: AppTextStyles.h5.copyWith(
              color: AppColors.mediumGray,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.grayBlue.withValues(alpha: 0.5),
                blurRadius: 8.r,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              for (int i = 0; i < items.length; i++) ...[
                items[i],
                if (i < items.length - 1)
                  Divider(
                    height: 1.h,
                    thickness: 1.h,
                    color: AppColors.grayBlue,
                    indent: 64.w,
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.titleColor,
    this.trailing,
  });

  final SvgGenImage icon;
  final String title;
  final VoidCallback onTap;
  final Color? titleColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CommonAssetIcon(
                icon,
                width: 20.r,
                height: 20.r,
                color: titleColor ?? AppColors.black,
              ),
            ),
            Gaps.hGap16,
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.h4.copyWith(
                  fontWeight: FontWeight.w600,
                  color: titleColor ?? AppColors.text,
                ),
              ),
            ),
            if (trailing != null) ...[
              Gaps.hGap12,
              trailing!,
            ] else ...[
              CommonAssetIcon(
                Assets.icons.arrowTopRight,
                width: 16.r,
                height: 16.r,
                color: AppColors.mediumGray,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
