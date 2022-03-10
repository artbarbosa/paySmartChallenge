import 'package:flutter/material.dart';
import '../ui/detail/route/detail_arguments.dart';
import '../ui/detail/route/detail_route.dart';
import '../ui/home/container/home_container.dart';

class MovieRouter extends StatelessWidget {
  const MovieRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          return MaterialPageRoute(
            builder: (context) {
              return const HomeContainer();
            },
          );
        }
        if (settings.name == '/detail') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailRouter(
                arguments: settings.arguments as DetailArguments,
              );
            },
          );
        }
      },
    );
  }
}
