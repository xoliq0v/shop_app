//
// import 'package:core/core.dart';
// import 'package:use_case/use_case.dart';
//
//
// class BottomNavigationGuard extends AutoRouteGuard {
//
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//
//     checkLocationPermission.checkPermissionWithoutRequest().then(
//           (hasPermission) {
//         if (hasPermission) {
//           resolver.next();
//           return;
//         }
//         final args = resolver.route.args as CategoryDetailRouteArgs;
//         resolver.redirect(CategoryDetailV2Route(
//           title: args.title,
//           id: args.id,
//         ));
//       },
//     );
//
//   }
//
//
//   CheckLocationPermission get checkLocationPermission {
//     return GetIt.I.get<CheckLocationPermission>();
//   }
//
// }