import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workouch/core/di/injection.dart';

import '../../../../core/services/posthog_analytics_service.dart';
import '../cubit/onboard_cubit.dart';
import '../cubit/onboard_state.dart';
import 'onboard_introduction_page.dart';
import 'onboard_measurement_system_page.dart';
import 'onboard_gender_page.dart';
import 'onboard_age_page.dart';
import 'onboard_height_page.dart';
import 'onboard_weight_page.dart';
import 'onboard_activity_level_page.dart';

class OnboardMainPage extends StatelessWidget {
  const OnboardMainPage({super.key});

  static const _pages = [
    OnboardIntroductionPage(),
    OnboardMeasurementSystemPage(),
    OnboardGenderPage(),
    OnboardAgePage(),
    OnboardHeightPage(),
    OnboardWeightPage(),
    OnboardActivityLevelPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnboardCubit>(),
      child: BlocConsumer<OnboardCubit, OnboardState>(
        listenWhen: (prev, curr) => prev.currentPage != curr.currentPage,
        listener: (context, state) {
          PosthogService.logOnboardingStepReached(state.currentPage);
        },
        builder: (context, state) {
          return _pages[state.currentPage];
        },
      ),
    );
  }
}
