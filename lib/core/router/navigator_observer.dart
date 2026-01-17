import 'package:flutter/material.dart';

import '../utils/log.dart';

class NavigationHistoryObserver extends NavigatorObserver {
  final List<Route<dynamic>> history = <Route<dynamic>>[];

  String? get prevRoute =>
      history.length >= 2 ? history[history.length - 2].settings.name : null;

  String? get currRoute =>
      history.isNotEmpty ? history.last.settings.name : null;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    history.add(route);
    Log.d(
      'Pushed route: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    history.remove(route);
    Log.d(
      'Popped route: ${route.settings.name}, New current route: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final index = history.indexOf(oldRoute!);
    if (index != -1 && newRoute != null) {
      history[index] = newRoute;
    }
    Log.d(
      'Replaced route: ${oldRoute.settings.name} with ${newRoute?.settings.name}',
    );
  }
}
