import 'package:transcript/app/blocs/bloc_home_page.dart';
import 'package:transcript/app/core/modules/dependency_injector.dart';

class AppModules {
  static DependencyInjector initializeModules() {
    final dependencyInjector = DependencyInjector.instance();
    dependencyInjector.registerDependency<BlocHomePage>(() => BlocHomePage());
    return dependencyInjector;
  }
}
