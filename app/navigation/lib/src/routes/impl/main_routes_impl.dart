import 'package:auto_route/src/route/page_route_info.dart';
import 'package:feature_home/feature_home.dart';
import '../main_routes.dart';

class MainRoutesImpl extends MainRoutes {
  @override
  PageRouteInfo getCategoryPage() {
    return const CategoryRoute();
  }

  @override
  PageRouteInfo getFavouritePage() {
    return const FavouriteRoute();
  }

  @override
  PageRouteInfo getHomePage() {
    return const HomeRoute();
  }

  @override
  PageRouteInfo getProfilePage() {
    return const ProfileRoute();
  }

}