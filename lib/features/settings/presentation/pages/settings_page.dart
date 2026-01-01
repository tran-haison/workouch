import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/url_utils.dart';
import '../../../../core/widgets/common_button.dart';
import '../../../../core/widgets/common_gaps.dart';
import '../../../../core/widgets/common_pop_up_dialog.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../cubit/settings_cubit.dart';
import '../cubit/settings_state.dart';
import '../dialogs/contact_us_dialog.dart';
import '../widgets/settings_item.dart';
import '../widgets/settings_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingsCubit>(),
      child: const _SettingsView(),
    );
  }
}

class _SettingsView extends StatefulWidget {
  const _SettingsView();

  @override
  State<_SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<_SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                      AppConstants.settings,
                      style: AppTextStyles.h3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingsSection(
                      title: AppConstants.account,
                      items: [
                        SettingsItem(
                          icon: Assets.icons.subscription,
                          title: AppConstants.subscriptionPlans,
                          onTap: () {
                            context.pushNamed(AppRoute.subscription.name);
                          },
                        ),
                        SettingsItem(
                          icon: Assets.icons.delete,
                          title: AppConstants.deleteAccount,
                          titleColor: AppColors.errorDark,
                          onTap: () => _handleDeleteAccount(context),
                        ),
                      ],
                    ),
                    Gaps.vGap24,
                    SettingsSection(
                      title: AppConstants.legal,
                      items: [
                        SettingsItem(
                          icon: Assets.icons.terms,
                          title: AppConstants.termsConditions,
                          onTap: () => UrlUtils.openUrl(
                            context,
                            AppConstants.url.pageTermsConditions,
                          ),
                        ),
                        SettingsItem(
                          icon: Assets.icons.privacy,
                          title: AppConstants.privacyPolicy,
                          onTap: () => UrlUtils.openUrl(
                            context,
                            AppConstants.url.pagePrivacyPolicy,
                          ),
                        ),
                        SettingsItem(
                          icon: Assets.icons.support,
                          title: AppConstants.support,
                          onTap: () => UrlUtils.openUrl(
                            context,
                            AppConstants.url.pageSupport,
                          ),
                        ),
                      ],
                    ),
                    Gaps.vGap24,
                    BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, state) {
                        return SettingsSection(
                          title: AppConstants.about,
                          items: [
                            SettingsItem(
                              icon: Assets.icons.contact,
                              title: AppConstants.contactUs,
                              onTap: () => showContactUsDialog(context),
                            ),
                            SettingsItem(
                              icon: Assets.icons.info,
                              title: AppConstants.version,
                              trailing: Text(
                                state.appVersion,
                                style: AppTextStyles.h5.copyWith(
                                  color: AppColors.mediumGray,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        );
                      },
                    ),
                    Gaps.vGap40,
                    CommonButton(
                      text: AppConstants.signOut,
                      backgroundColor: AppColors.errorDark,
                      onPressed: () => _signOut(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleDeleteAccount(BuildContext context) async {
    await showCommonPopUpDialog(
      context,
      title: AppConstants.deleteAccount,
      message: AppConstants.deleteAccountConfirmation,
      onFirstButtonPressed: () =>
          UrlUtils.openUrl(context, AppConstants.url.formDeleteAccount),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await context.read<AuthCubit>().signOut();
    if (context.mounted) {
      context.goNamed(AppRoute.signIn.name);
    }
  }
}
