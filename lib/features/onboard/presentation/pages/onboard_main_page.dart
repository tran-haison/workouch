import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workouch/core/di/injection.dart';

import '../cubit/onboard_cubit.dart';
import '../cubit/onboard_state.dart';
import 'onboard_introduction_page.dart';
import 'onboard_gender_page.dart';
import 'onboard_age_page.dart';
import 'onboard_height_page.dart';
import 'onboard_weight_page.dart';
import 'onboard_activity_level_page.dart';

class OnboardMainPage extends StatelessWidget {
  const OnboardMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnboardCubit>(),
      child: BlocBuilder<OnboardCubit, OnboardState>(
        builder: (context, state) {
          // Page 0: Introduction
          if (state.currentPage == 0) {
            return const OnboardIntroductionPage();
          }

          // Page 1: Gender selection
          if (state.currentPage == 1) {
            return const OnboardGenderPage();
          }

          // Page 2: Age input
          if (state.currentPage == 2) {
            return const OnboardAgePage();
          }

          // Page 3: Height input
          if (state.currentPage == 3) {
            return const OnboardHeightPage();
          }

          // Page 4: Weight input
          if (state.currentPage == 4) {
            return const OnboardWeightPage();
          }

          // Page 5: Activity level selection
          if (state.currentPage == 5) {
            return const OnboardActivityLevelPage();
          }

          // Default: Introduction
          return const OnboardIntroductionPage();
        },
      ),
    );
  }
}
