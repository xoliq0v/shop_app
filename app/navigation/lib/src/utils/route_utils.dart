import 'package:core/core.dart';
import '../routes/main_routes.dart';
mixin RouteUtils {
  static List<PageRouteInfo> getMainRoutes() {
    final mainRoutes = GetIt.I.get<MainRoutes>();
    return [
      mainRoutes.getHomePage(),
      mainRoutes.getCategoryPage(),
      mainRoutes.getFavouritePage(),
      mainRoutes.getProfilePage(),
    ];
  }
}
