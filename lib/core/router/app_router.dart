import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/auth/presentation/pages/profile_page.dart';
import '../../features/workout/presentation/pages/workout_creation_page.dart';
import '../../features/workout/presentation/pages/workout_pro_page.dart';
import '../../features/workout/presentation/pages/exercises_page.dart';
import '../../features/workout/presentation/pages/workout_details_page.dart';
import '../../features/workout/presentation/pages/workout_lazy_builder_page.dart';
import '../../features/workout_session/presentation/pages/workout_ready_page.dart';
import '../../features/workout_session/presentation/pages/workout_main_page.dart';
import '../../features/workout_session/presentation/pages/workout_rest_page.dart';
import '../../features/workout_session/presentation/pages/workout_finish_page.dart';
import '../../features/auth/presentation/pages/signin_page.dart';
import '../../features/auth/presentation/pages/subscription_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/onboard/presentation/pages/onboard_main_page.dart';
import '../../features/workout/domain/entities/workout.dart';
import '../../features/workout_session/presentation/widgets/workout_session_scope_provider.dart';
import 'navigator_observer.dart';

enum AppRoute {
  signIn,
  home,
  profile,
  subscription,
  settings,
  onboard,
  workoutPro,
  workoutLazyBuilder,
  workoutCreation,
  workoutDetails,
  workoutReady,
  workoutMain,
  workoutRest,
  workoutFinish,
  exercises,
}

Page<T> _buildSlidePage<T extends Object>(
  Widget child, {
  LocalKey? key,
  String? name,
  Object? arguments,
  String? restorationId,
}) {
  return CustomTransitionPage<T>(
    key: key,
    child: child,
    name: name,
    arguments: arguments,
    restorationId: restorationId,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

final navObserver = NavigationHistoryObserver();

final appRouter = GoRouter(
  observers: [navObserver],
  initialLocation: '/signin',
  routes: <RouteBase>[
    GoRoute(
      name: AppRoute.signIn.name,
      path: '/signin',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SignInPage()),
    ),
    GoRoute(
      name: AppRoute.home.name,
      path: '/',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomePage()),
    ),
    GoRoute(
      name: AppRoute.profile.name,
      path: '/profile',
      pageBuilder: (context, state) => _buildSlidePage(
        const ProfilePage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.subscription.name,
      path: '/subscription',
      pageBuilder: (context, state) => _buildSlidePage(
        const SubscriptionPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.settings.name,
      path: '/settings',
      pageBuilder: (context, state) => _buildSlidePage(
        const SettingsPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.onboard.name,
      path: '/onboard',
      pageBuilder: (context, state) => _buildSlidePage(
        const OnboardMainPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.workoutPro.name,
      path: '/workout-pro',
      pageBuilder: (context, state) => _buildSlidePage(
        const WorkoutProPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.workoutCreation.name,
      path: '/workout-creation',
      pageBuilder: (context, state) => _buildSlidePage(
        const WorkoutCreationPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.workoutDetails.name,
      path: '/workout-details',
      pageBuilder: (context, state) => _buildSlidePage(
        const WorkoutDetailsPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.exercises.name,
      path: '/exercises',
      pageBuilder: (context, state) => _buildSlidePage(
        const ExercisesPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.workoutLazyBuilder.name,
      path: '/workout-lazy-builder',
      pageBuilder: (context, state) => _buildSlidePage(
        const WorkoutLazyBuilderPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    ShellRoute(
      builder: (context, state, child) {
        final workout = state.extra as Workout?;
        return WorkoutSessionScopeProvider(workout: workout, child: child);
      },
      routes: [
        GoRoute(
          name: AppRoute.workoutReady.name,
          path: '/workout-ready',
          pageBuilder: (context, state) => _buildSlidePage(
            const WorkoutReadyPage(),
            key: state.pageKey,
            name: state.name,
            arguments: state.extra,
          ),
        ),
        GoRoute(
          name: AppRoute.workoutMain.name,
          path: '/workout-main',
          pageBuilder: (context, state) => _buildSlidePage(
            const WorkoutMainPage(),
            key: state.pageKey,
            name: state.name,
            arguments: state.extra,
          ),
        ),
        GoRoute(
          name: AppRoute.workoutRest.name,
          path: '/workout-rest',
          pageBuilder: (context, state) => _buildSlidePage(
            const WorkoutRestPage(),
            key: state.pageKey,
            name: state.name,
            arguments: state.extra,
          ),
        ),
        GoRoute(
          name: AppRoute.workoutFinish.name,
          path: '/workout-finish',
          pageBuilder: (context, state) => _buildSlidePage(
            const WorkoutFinishPage(),
            key: state.pageKey,
            name: state.name,
            arguments: state.extra,
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text('Page not found'))),
);
