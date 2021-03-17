import 'package:flutter/material.dart';
import 'package:wikipedia/core/utils/routes_constants.dart';
import 'package:wikipedia/ui/routes/home_screen.dart';
import 'package:wikipedia/ui/routes/respective_web_view.dart';

class RouterNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainHome:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case respectiveWebPage:
        return MaterialPageRoute(
          builder: (_) => RespectiveWebPage(nameOfPage: settings.arguments),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route found for the name $settings.name',
              ),
            ),
          ),
        );
    }
  }
}
