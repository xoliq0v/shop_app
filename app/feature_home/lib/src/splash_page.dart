import 'package:core/core.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class SplashScreen extends StatefulWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<InternetConnectivityController>(
      create: (context) => AppBlocHelper.getInternetConnectivityController(),
      child: this,
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFinished = false;
  bool? hasConnection;
  bool isLostConnectionPage = false;

  final _navigateLock = Lock();

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetConnectivityController, InternetConnectivityControllerState>(
      listener: (context, state) {
        state.mapOrNull(
          connected: (value) {
            hasConnection = true;
            navigateNext(context);
          },
          disconnected: (value) {
            hasConnection = false;
            navigateNext(context);
          },
        );
      },
      child: Material(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FlutterLogo(
                size: 50,
              ),
              10.horizontalSpace,
              Text(
                'Shop app',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigateNext(BuildContext context) async {
    await _navigateLock.synchronized(() async {
      if (!context.mounted || isLostConnectionPage) return;
      switch (hasConnection) {
        case true:
          await navigateMainPage();
          break;
        case false:
          await navigateLostConnectionPage(context);
          break;
        case null:
          break;
      }
    });
  }

  Future<void> navigateLostConnectionPage(BuildContext context) async {
    isLostConnectionPage = true;
    await NavigationUtils.getMainNavigator().navigateLostConnectionPage(
      context: context,
      onResult: (p0) {},
    );
  }

  Future<void> navigateMainPage() async{
    await NavigationUtils.getMainNavigator().navigateMainPage();
  }
}
