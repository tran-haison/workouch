import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/personal_records_page.dart';
import '../../features/home/presentation/pages/workout_sessions_by_day_page.dart';
import '../../features/auth/presentation/pages/profile_page.dart';
import '../../features/workout/presentation/pages/workout_creation_page.dart';
import '../../features/workout/presentation/pages/workout_pro_page.dart';
import '../../features/workout/presentation/pages/exercises_page.dart';
import '../../features/workout/presentation/pages/workout_details_page.dart';
import '../../features/workout/presentation/pages/workout_lazy_builder_page.dart';
import '../../features/workout_session/domain/entities/workout_session.dart';
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
  home('/'),
  signIn('/signin'),
  profile('/profile'),
  subscription('/subscription'),
  settings('/settings'),
  onboard('/onboard'),
  workoutPro('/workout-pro'),
  workoutLazyBuilder('/workout-lazy-builder'),
  workoutCreation('/workout-creation'),
  workoutDetails('/workout-details'),
  workoutReady('/workout-ready'),
  workoutMain('/workout-main'),
  workoutRest('/workout-rest'),
  workoutFinish('/workout-finish'),
  exercises('/exercises'),
  personalRecords('/personal-records'),
  workoutSessionsByDay('/workout-sessions-by-day');

  const AppRoute(this.path);

  final String path;
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
final posthogObserver = PosthogObserver();

final appRouter = GoRouter(
  observers: [navObserver, posthogObserver],
  initialLocation: AppRoute.signIn.path,
  routes: <RouteBase>[
    GoRoute(
      name: AppRoute.signIn.name,
      path: AppRoute.signIn.path,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SignInPage()),
    ),
    GoRoute(
      name: AppRoute.home.name,
      path: AppRoute.home.path,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomePage()),
    ),
    GoRoute(
      name: AppRoute.profile.name,
      path: AppRoute.profile.path,
      pageBuilder: (context, state) => _buildSlidePage(
        const ProfilePage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.subscription.name,
      path: AppRoute.subscription.path,
      pageBuilder: (context, state) => _buildSlidePage(
        const SubscriptionPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.settings.name,
      path: AppRoute.settings.path,
      pageBuilder: (context, state) => _buildSlidePage(
        const SettingsPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.onboard.name,
      path: AppRoute.onboard.path,
      pageBuilder: (context, state) => _buildSlidePage(
        const OnboardMainPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.workoutPro.name,
      path: AppRoute.workoutPro.path,
      pageBuilder: (context, state) => _buildSlidePage(
        const WorkoutProPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.workoutCreation.name,
      path: AppRoute.workoutCreation.path,
      pageBuilder: (context, state) => _buildSlidePage(
        const WorkoutCreationPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.workoutDetails.name,
      path: AppRoute.workoutDetails.path,
      pageBuilder: (context, state) => _buildSlidePage(
        const WorkoutDetailsPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.exercises.name,
      path: AppRoute.exercises.path,
      pageBuilder: (context, state) => _buildSlidePage(
        const ExercisesPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.personalRecords.name,
      path: AppRoute.personalRecords.path,
      pageBuilder: (context, state) => _buildSlidePage(
        const PersonalRecordsPage(),
        key: state.pageKey,
        name: state.name,
        arguments: state.extra,
      ),
    ),
    GoRoute(
      name: AppRoute.workoutSessionsByDay.name,
      path: AppRoute.workoutSessionsByDay.path,
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        final date = extra?['date'] as DateTime? ?? DateTime.now();
        final sessions =
            (extra?['sessions'] as List<WorkoutSession>?) ?? const [];

        return _buildSlidePage(
          WorkoutSessionsByDayPage(date: date, sessions: sessions),
          key: state.pageKey,
          name: state.name,
          arguments: state.extra,
        );
      },
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
