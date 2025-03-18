import 'dart:io';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
// import 'package:feature_home/src/pages/profile_page/profile_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class MainPage extends StatefulWidget implements AutoRouteWrapper {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetConnectivityController>(
          create: (context) {
            return AppBlocHelper.getInternetConnectivityController();
          },
        ),
      ],
      child: this,
    );
  }
}

class _MainPageState extends State<MainPage> {
  final connectionLock = Lock();

  bool hasConnection = true;
  bool isLostConnectionPage = false;

  @override
  void initState() {
    // context.read<UserProfileCubit>().initUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetConnectivityController,
        InternetConnectivityControllerState>(
      listener: (context, state) {
        state.mapOrNull(
          connected: (value) {
            hasConnection = true;
          },
          disconnected: (value) {
            hasConnection = false;
            navigateLostConnection();
          },
        );
      },
      child: Visibility(
        visible: Platform.isIOS,
        replacement: const _MainView(),
        child: const CupertinoScaffold(
          overlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          topRadius: Radius.circular(10),
          body: _MainView(),
        ),
      ),
    );
  }

  Future<void> navigateLostConnection() async {
    await connectionLock.synchronized(() async {
      if (isLostConnectionPage || hasConnection) return;
      isLostConnectionPage = true;
      await NavigationUtils.getMainNavigator().navigateLostConnectionPage(
        context: context,
        onResult: (p0) {},
      );
      isLostConnectionPage = false;
    });
  }
}

class _MainView extends StatelessWidget {
  const _MainView();

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: RouteUtils.getMainRoutes(),
      extendBody: true,
      homeIndex: 0,
      bottomNavigationBuilder: (context, tabsRouter) {
        final notHide =
            tabsRouter.topMatch.meta[AppRouterUtils.fullScreen.key] != true;
        return Visibility(
          visible: notHide,
          child: CustomBlurBox(
            color: Colors.white.withOpacity(0.8),
            blur: 40,
            borderRadius: BorderRadius.zero,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.black90)),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.transparent,
                currentIndex: tabsRouter.activeIndex,
                elevation: 0,
                onTap: (value) {
                  tabsRouter.setActiveIndex(value);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.call_to_action_outlined),
                    activeIcon: Icon(Icons.call_to_action_rounded),
                    label: 'category',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    activeIcon: Icon(Icons.favorite),
                    label: 'favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    activeIcon: Icon(Icons.account_circle),
                    label: 'profile',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}