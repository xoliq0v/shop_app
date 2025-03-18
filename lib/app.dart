import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:navigation/navigation.dart';

import 'di/init.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = getIt.get<AppRouter>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: _MaterialApp(appRouter: _appRouter),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp({required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        FlutterNativeSplash.remove();
        return Toast(
          navigatorKey: appRouter.navigatorKey,
          child: child ?? const SizedBox(),
        );
      },
      routerConfig: appRouter.config(
        navigatorObservers: () => [
          AppRouteObserver(),
        ],
      ),
    );
  }
}