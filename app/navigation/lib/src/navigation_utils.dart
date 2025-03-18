import 'package:core/core.dart';
import '../navigation.dart';

mixin NavigationUtils {
  static MainNavigation getMainNavigator() {
    return GetIt.I.get<MainNavigation>();
  }
}
