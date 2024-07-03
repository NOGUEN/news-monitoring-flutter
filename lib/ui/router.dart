import 'package:flutter/material.dart';
import 'package:news_monitoring/core/constants/app_constants.dart';
import 'package:news_monitoring/ui/views/home_view.dart';
import 'package:news_monitoring/ui/views/news_site_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.NewsSite:
        final siteId = settings.arguments as int;

        return MaterialPageRoute(
            builder: (_) => NewsSiteView(
                  siteId: siteId,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
