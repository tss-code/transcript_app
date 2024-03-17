import 'package:flutter/material.dart';
import 'package:transcript/app/core/modules/dependency_injector.dart';
import 'package:transcript/app/presenter/pages/home/home_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes(
          DependencyInjector dependencyInjector) =>
      {
        "/homePage": (context) =>
            HomePage(dependencyInjector: dependencyInjector),
      };
}
