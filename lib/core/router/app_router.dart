import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/workout/pages/workouts_page.dart';
import '../../features/workout/presentation/pages/workout_pro_page.dart';

enum AppRoute { home, workouts, workoutPro }

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

final appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: AppRoute.home.name,
      path: '/',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomePage()),
    ),
    GoRoute(
      name: AppRoute.workouts.name,
      path: '/workouts',
      pageBuilder: (context, state) => _buildSlidePage(
        const WorkoutsPage(),
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
  ],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text('Page not found'))),
);
