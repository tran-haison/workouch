import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/widgets/common_pop_up_dialog.dart';

/// Show upgrade dialog when basic user has no remaining workout generations
Future<void> showUpgradePlanDialog(BuildContext context) async {
  return await showCommonPopUpDialog(
    context,
    title: AppConstants.upgradeToPro,
    message: AppConstants.upgradeToProMessage,
    firstButtonText: AppConstants.goToSubscription,
    secondButtonText: AppConstants.maybeLater,
    onFirstButtonPressed: () {
      context.pushNamed(AppRoute.subscription.name);
    },
  );
}

/// Show limit reached dialog when pro user has no remaining workout generations
/// Displays the next period start date (which is the current period_end)
Future<void> showProLimitDialog(
  BuildContext context, {
  required DateTime currPeriodEnd,
}) async {
  final formattedDate = AppDateUtils.fullDate(currPeriodEnd);
  final message = '${AppConstants.limitExceededMessage}:\n\n$formattedDate';

  return await showCommonPopUpDialog(
    context,
    title: AppConstants.limitExceeded,
    message: message,
    showSecondButton: false,
    firstButtonText: AppConstants.close,
  );
}
