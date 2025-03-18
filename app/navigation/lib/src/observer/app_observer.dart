import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AppRouteObserver extends AutoRouterObserver {
  
  @override
  void didPush(Route route, Route? previousRoute) {
    FocusManager.instance.primaryFocus?.unfocus();
    final routeName = route.settings.name;
    log('New route pushed: $routeName');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    FocusManager.instance.primaryFocus?.unfocus();
    super.didPop(route, previousRoute);
    log('Route popped: ${route.settings.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    FocusManager.instance.primaryFocus?.unfocus();
    log('Tab route re-visited: ${route.name}');
  }
}
