import 'package:flutter/material.dart';
import 'package:transcript/app/core/modules/app_modules.dart';
import 'package:transcript/app/core/modules/dependency_injector.dart';
import 'package:transcript/app/core/resources/navigation/app_routes.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final DependencyInjector dependencyInjector = AppModules.initializeModules();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes(dependencyInjector),
      initialRoute: "/homePage",
    );
  }
}
