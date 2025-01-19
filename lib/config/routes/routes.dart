import 'package:brainstock/config/routes/routes_names.dart';
import 'package:brainstock/views/views.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.mainScreen:
        return MaterialPageRoute(builder: (context) => const Screen());

      case RoutesNames.homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("No Routes Found"),
                  ),
                ));
    }
  }
}
