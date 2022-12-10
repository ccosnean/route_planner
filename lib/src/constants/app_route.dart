enum AppRoute {
  settings,
  home,
  route,
  weather
}

class AppRouteMapper {
  AppRouteMapper._internal();

  static AppRouteMapper? _singleton;

  static AppRouteMapper get instance {
    return _singleton ??= AppRouteMapper._internal();
  }

  final Map<AppRoute, String> _routes = {
    AppRoute.settings: '/settings',
    AppRoute.home: '/home',
    AppRoute.route: '/route',
    AppRoute.weather: '/weather',
  };

  String toStringRoute(AppRoute route) {
    return _routes[route] ?? '/';
  }

  AppRoute? toAppRoute(String route) {
    AppRoute? matchedRoute;

    _routes.forEach((key, value) {
      if (value == route) {
        matchedRoute = key;
        return;
      }
    });

    return matchedRoute;
  }
}

bool matchesRouteName(String? name, AppRoute route) {
  if (name == null) return false;
  final appRoute = AppRouteMapper.instance.toAppRoute(name);
  return appRoute == route;
}

String getStringRoute(AppRoute route) {
  return AppRouteMapper.instance.toStringRoute(route);
}
