
import 'dart:async';

import 'package:core/core.dart';
import '../../navigation.dart';
import '../routes/impl/main_routes_impl.dart';
import '../routes/main_routes.dart';

import '../app_router.dart';

@module
abstract class NavigationModule{

  @singleton
  AppRouter provideAppRoute() {
    return AppRouter();
  }

  @lazySingleton
  MainRoutes provideMainRoutes() => MainRoutesImpl();

  @lazySingleton
  MainNavigation provideMainNavigator(AppRouter appRouter) {
    return MainNavigationImpl(appRouter: appRouter);
  }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
