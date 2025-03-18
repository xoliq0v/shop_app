
import 'package:core/core.dart';
import 'package:feature_home/feature_home.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen|Page,Route',
  modules: [FeatureHomeModule],
)
class AppRouter extends _$AppRouter {

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: SplashRoute.page,initial: true),
      AutoRoute(page: MainRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: CategoryRoute.page),
            AutoRoute(page: FavouriteRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ]
      ),
    ];
  }

}