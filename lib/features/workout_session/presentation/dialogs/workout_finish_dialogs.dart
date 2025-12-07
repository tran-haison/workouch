import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/common_pop_up_dialog.dart';

Future<void> showWorkoutExitDialog(BuildContext context) async {
  return await showCommonPopUpDialog(
    context,
    title: AppConstants.exitWorkout,
    message: AppConstants.exitWorkoutMessage,
    onFirstButtonPressed: () {
      context.goNamed(AppRoute.home.name);
    },
  );
}

Future<void> showWorkoutFinishDialog(BuildContext context) async {
  return await showCommonPopUpDialog(
    context,
    title: AppConstants.finishWorkout,
    message: AppConstants.finishWorkoutMessage,
    onFirstButtonPressed: () {
      context.pushNamed(AppRoute.workoutFinish.name);
    },
  );
}
