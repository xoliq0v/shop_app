
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../navigation.dart';

class MainNavigationImpl extends MainNavigation {
  MainNavigationImpl({required this.appRouter});

  final AppRouter appRouter;

  @override
  Future<void> navigateMainPage() {
    return appRouter.replaceAll([const MainRoute()]);
  }

  @override
  Future<void> navigateLostConnectionPage({required BuildContext context, required void Function(bool p1) onResult}) {
    return context.showFullScreenPage(
      builder: (controller) {
        return LostConnectionPage(
          onResult: (p0) async {
            if (p0) {
              await controller.dismiss();
            }
            onResult.call(p0);
          },
        );
      },
    );
  }

}
