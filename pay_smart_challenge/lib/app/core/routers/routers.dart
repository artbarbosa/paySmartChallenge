import 'package:flutter/material.dart';
import '../../modules/movie/router/movie_router.dart';

class Routers {
  static String get initialRoute => '/movie';

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    '/movie': (_, __) => const MovieRouter(),
  };

  static Route? generateRoutes(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
